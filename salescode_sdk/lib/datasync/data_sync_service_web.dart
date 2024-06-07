// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';

// import '../../../models/data_sync_ui.dart';
// import '../../models/web/data_sync.dart';
// import 'data_sync_service.dart';

// @Singleton(as: DataSyncService, env: ["web"])
// class DataSyncServiceWeb extends DataSyncService {
//   DataSyncServiceWeb(super.databaseService);

//   @override
//   Future<bool> areProductsLoaded() async {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     List<DataSync> productDataSync = dsBox.values
//         .where((element) =>
//             element.name == "Products" &&
//             element.status == describeEnum(Status.success))
//         .toList();

//     if (productDataSync.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   Future<int> deleteSyncInfo(
//       {required String name, String type = "full"}) async {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     Map<dynamic, DataSync> dataSyncMap = dsBox.toMap();
//     for (var entry in dataSyncMap.entries) {
//       if (entry.value.name == name) {
//         await dsBox.delete(entry.key);
//       }
//     }
//     return 0;
//   }

//   @override
//   List<DataSyncUI> getAll() {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     var data = dsBox.values
//         .map((e) => DataSyncUI(
//             id: e.id,
//             syncTime: e.syncTime,
//             syncType: e.syncType,
//             startTime: e.startTime,
//             endTime: e.endTime,
//             size: e.size,
//             records: e.records,
//             name: e.name,
//             status: e.status,
//             description: e.description,
//             expiryTime: e.expiryTime))
//         .toList();
//     return data;
//   }

//   @override
//   List<DataSyncUI> getRunningInstances() {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     var data = dsBox.values
//         .where((element) => element.status == "running")
//         .map((e) => DataSyncUI(
//             id: e.id,
//             syncTime: e.syncTime,
//             syncType: e.syncType,
//             startTime: e.startTime,
//             endTime: e.endTime,
//             size: e.size,
//             records: e.records,
//             name: e.name,
//             status: e.status,
//             description: e.description,
//             expiryTime: e.expiryTime))
//         .toList();
//     return data;
//   }

//   @override
//   int getServiceSuccessCount() {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     return dsBox.values.where((element) => element.status == "success").length;
//   }

//   @override
//   Future<DataSyncUI> getSyncInfo(
//       {required String name,
//       String type = "full",
//       int validityPeriod = 1}) async {
//     Box<DataSync> dataSyncBox =
//         databaseService.getStore<DataSync>('dataSyncBox')! as Box<DataSync>;
//     List<DataSyncUI> dsList = dataSyncBox.values
//         .where((element) => element.name == name && element.syncType == type)
//         .map((e) => DataSyncUI(
//             id: e.id,
//             syncTime: e.syncTime,
//             syncType: e.syncType,
//             startTime: e.startTime,
//             endTime: e.endTime,
//             size: e.size,
//             records: e.records,
//             name: e.name,
//             status: e.status,
//             description: e.description,
//             expiryTime: e.expiryTime))
//         .toList();
//     ;
//     return dsList.isNotEmpty
//         ? dsList.first
//         : DataSyncUI(
//             syncTime: 0,
//             syncType: type,
//             name: name,
//             startTime: DateTime.now(),
//             endTime: DateTime.now(),
//             status: "pending",
//             expiryTime: DateTime.now().add(Duration(days: validityPeriod)));
//   }

//   @override
//   Future<DataSyncUI> save(DataSyncUI dsObject, String status) async {
//     dsObject.status = status;
//     dsObject.endTime = DateTime.now();
//     dsObject.syncTime = (dsObject.endTime.millisecondsSinceEpoch -
//             dsObject.startTime.millisecondsSinceEpoch) ~/
//         1000;

//     Box<DataSync> dataSyncBox =
//         databaseService.getStore<DataSync>('dataSyncBox')! as Box<DataSync>;

//     await deleteSyncInfo(name: dsObject.name);

//     await dataSyncBox.add(DataSync(
//         syncTime: dsObject.syncTime,
//         syncType: dsObject.syncType,
//         name: dsObject.name,
//         startTime: dsObject.startTime,
//         endTime: dsObject.endTime,
//         status: dsObject.status,
//         expiryTime: dsObject.expiryTime,
//         description: dsObject.description,
//         records: dsObject.records,
//         size: dsObject.size));
//     // setValue(dsObject.endTime.millisecondsSinceEpoch);
//     return dsObject;
//   }

//   @override
//   Future<void> createDataSyncEntry(DataSyncUI dataSyncUI) async {
//     Box<DataSync> dsBox = databaseService.getStore<DataSync>("dataSyncBox");
//     await deleteSyncInfo(name: dataSyncUI.name);
//     DataSync tempDataSync = DataSync.fromMap(dataSyncUI.toMap());
//     await dsBox.add(tempDataSync);
//   }

//   @override
//   Future<void> cleanSyncData() async {
//     Box<DataSync> dsBox = databaseService.getStore<DataSync>("dataSyncBox");
//     await dsBox.clear();
//   }

//   @override
//   getFailedLoaders() {
//     // TODO: implement getFailedLoaders
//     throw UnimplementedError();
//   }
// }
