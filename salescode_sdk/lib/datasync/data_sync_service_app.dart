import 'package:flutter/foundation.dart';
import 'package:salescode_sdk/db/models/app/data_sync.dart';
import 'package:salescode_sdk/db/services/database/database_service_app.dart';
import 'package:salescode_sdk/models/data_sync_ui.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'data_sync_service.dart';

class DataSyncServiceApp extends DataSyncService {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  // @override
  // Future<bool> areProductsLoaded() async {
  //   Box<DataSync> dsBox = databaseService.getStore()!.box<DataSync>();
  //   List<DataSync> productDataSync = dsBox
  //       .query((DataSyncV1_.name.equals("Products") &
  //           DataSyncV1_.status.equals(describeEnum(Status.success))))
  //       .build()
  //       .find();

  //   if (productDataSync.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Future<int> deleteSyncInfo(
      {required String name, String type = "full"}) async {
    return databaseService
        .getStore()!
        .box<DataSyncV1>()
        .query(DataSyncV1_.name.equals(name))
        .build()
        .remove();
  }

  @override
  List<DataSyncUI> getAll() {
    Box<DataSyncV1> dsBox = databaseService.getStore()!.box<DataSyncV1>();
    var data = dsBox
        .getAll()
        .map((e) => DataSyncUI(
            id: e.id,
            syncTime: e.syncTime,
            syncType: e.syncType,
            startTime: e.startTime,
            endTime: e.endTime,
            size: e.size,
            records: e.records,
            name: e.name,
            status: e.status,
            description: e.description,
            expiryTime: e.expiryTime))
        .toList();

    return data;
  }

  @override
  List<DataSyncUI> getRunningInstances() {
    Box<DataSyncV1> dsBox = databaseService.getStore()!.box<DataSyncV1>();
    return dsBox
        .query(DataSyncV1_.status.equals("running"))
        .build()
        .find()
        .map((e) => DataSyncUI(
            id: e.id,
            syncTime: e.syncTime,
            syncType: e.syncType,
            startTime: e.startTime,
            endTime: e.endTime,
            size: e.size,
            records: e.records,
            name: e.name,
            status: e.status,
            description: e.description,
            expiryTime: e.expiryTime))
        .toList();
  }

  @override
  int getServiceSuccessCount() {
    return databaseService
        .getStore()!
        .box<DataSyncV1>()
        .query(DataSyncV1_.status.equals("success"))
        .build()
        .count();
  }

  @override
  Future<DataSyncUI> getSyncInfo(
      {required String name,
      String type = "full",
      int validityPeriod = 1}) async {
    List<DataSyncUI> dsList = (databaseService
            .getStore()!
            .box<DataSyncV1>()
            .query(DataSyncV1_.name
                .equals(name)
                .and(DataSyncV1_.syncType.equals(type)))
            .build()
            .find() as List<DataSyncV1>)
        .map((e) => DataSyncUI(
            id: e.id,
            syncTime: e.syncTime,
            syncType: e.syncType,
            startTime: e.startTime,
            endTime: e.endTime,
            size: e.size,
            records: e.records,
            name: e.name,
            status: e.status,
            description: e.description,
            expiryTime: e.expiryTime))
        .toList();
    return dsList.isNotEmpty
        ? dsList.first
        : DataSyncUI(
            syncTime: 0,
            syncType: type,
            name: name,
            startTime: DateTime.now(),
            endTime: DateTime.now(),
            status: "pending",
            expiryTime: DateTime.now().add(Duration(days: validityPeriod)));
  }

  @override
  Future<DataSyncUI> save(DataSyncUI dsObject, String status) async {
    (databaseService.getStore()! as Store)
        .box<DataSyncV1>()
        .query(DataSyncV1_.name.equals(dsObject.name))
        .build()
        .remove();
    dsObject.status = status;
    dsObject.endTime = DateTime.now();
    dsObject.syncTime = (dsObject.endTime.millisecondsSinceEpoch -
            dsObject.startTime.millisecondsSinceEpoch) ~/
        1000;
    databaseService.getStore()!.box<DataSyncV1>().put(DataSyncV1(
        syncTime: dsObject.syncTime,
        syncType: dsObject.syncType,
        name: dsObject.name,
        startTime: dsObject.startTime,
        endTime: dsObject.endTime,
        status: dsObject.status,
        expiryTime: dsObject.expiryTime,
        description: dsObject.description,
        records: dsObject.records,
        size: dsObject.size));
    return dsObject;
  }

  @override
  Future<void> createDataSyncEntry(DataSyncUI dataSyncUI) async {
    Store store = databaseService.getStore()!;
    await deleteSyncInfo(name: dataSyncUI.name);
    DataSyncV1 tempDataSync = DataSyncV1.fromMap(dataSyncUI.toMap());
    store.box<DataSyncV1>().put(tempDataSync);
  }

  @override
  Future<void> cleanSyncData() async {
    databaseService.getStore()!.box<DataSyncV1>().removeAll();
  }

  @override
  List<DataSyncV1> getFailedLoaders() {
    return databaseService
        .getStore()!
        .box<DataSyncV1>()
        .query(DataSyncV1_.status.equals(describeEnum(Status.failure)))
        .build()
        .find();
  }
}
