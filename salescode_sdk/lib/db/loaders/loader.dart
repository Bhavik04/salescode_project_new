// ignore_for_file: avoid_catches_without_on_clauses

import 'package:flutter/foundation.dart';
import 'package:salescode_sdk/datasync/data_sync_service.dart';
import 'package:salescode_sdk/datasync/data_sync_service_app.dart';
import 'package:salescode_sdk/db/services/database/database_service_app.dart';
import 'package:salescode_sdk/models/data_sync_ui.dart';

abstract class Loader {
  String get name => "Loader";
  late DataSyncUI _dataSyncUI;
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  DataSyncServiceApp dataSyncService = DataSyncServiceApp();

  Future<String> load() async {

    if (!await dataSyncService.isServiceAlreadyInitialised(name)) {
      try {
        _initializeEntry();
        await fetchAndSave();
        _finalizeEntry(Status.success);
      } catch (error, stackTrace) {
        _finalizeEntry(Status.failure);
        return Status.failure.name;
      }
      await _createEntry();
      return _dataSyncUI.status;
    }
    return Status.success.name;
  }

  Future<void> fetchAndSave();

  void _initializeEntry() {
    _dataSyncUI = DataSyncUI(
        name: name,
        status: describeEnum(Status.running),
        syncTime: 0,
        expiryTime: DateTime.now(),
        syncType: 'full',
        startTime: DateTime.now(),
        endTime: DateTime.now());
  }

  void updateEntryRecords(int records) {
    _dataSyncUI.records += records;
  }

  void _finalizeEntry(Status status, [int daysTillExpiry = 1]) {
    _dataSyncUI.status = describeEnum(status);
    _dataSyncUI.endTime = DateTime.now();
    _dataSyncUI.syncTime =
        _dataSyncUI.endTime.difference(_dataSyncUI.startTime).inSeconds;
    _dataSyncUI.expiryTime = _getExpiryTime();
  }

  DateTime _getExpiryTime() {
    DateTime now = DateTime.now();
    // ExpiryService expiryService = GetIt.instance.get<ExpiryService>();
    // Expiry expiry = expiryService.getServiceExpiry(name);
    // if (expiry.expiryType == ExpiryType.daily) {
    //   return DateTime(now.year, now.month, now.day, expiry.expiryHour ?? 6)
    //       .add(Duration(days: expiry.expiryValue));
    // } else if (expiry.expiryType == ExpiryType.hourly) {
    //   return now.add(Duration(hours: expiry.expiryValue));
    // }
    return DateTime(now.year, now.month, now.day, 6)
        .add(const Duration(days: 1));
  }

  Future<void> _createEntry() async {
    await dataSyncService.createDataSyncEntry(_dataSyncUI);
  }
}
