import 'dart:async';
import 'dart:io';

import '../../../objectbox.g.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';
import 'database_service.dart';
import 'dbstore.dart';

class DatabaseServiceApp implements DatabaseService {
  DBStore dbStore = DBStore();
  static Store? _store = null;

  @override
  Store? getStore<T>([String boxName = ""]) {
    return _store;
  }

  @override
  Future<void> init([String env = "prod", int attemptNumber = 1]) async {
    if (env == "test") {
      _store = await openStore(directory: '/tmp/test/');
    } else {
      try {
        _store = await dbStore.getStore();
      } catch (_) {
        try {
          _store = await openStore();
        } catch (e) {
          // print("error opening store: ${e.toString()}");
          // unawaited(
          //     SlackAlertService().alert("Error opening store: ", extraInfo: e));
        }
      }
    }
  }

  @override
  void clearOldStoreCache() {
    dbStore.clear();
  }

  @override
  void closeStore() {
    dbStore.close();
  }

  @override
  void setStore(dynamic storeParam) {
    Store? store = storeParam as Store?;
    _store = store;
    dbStore.setStore(store);
  }

  // @override
  // Future clearBox<T>(String dbName, {hive.Box<T>? boxInstance}) async {
  //   // TODO: implement clearBox
  // }

  @override
  Future<void> deleteAllDatabases() async {
    try {
      closeStore();
      String dbPath = await dbStore.getDbPath();
      print(dbPath);
      await Directory(dbPath).delete(recursive: true).then(
          (FileSystemEntity value) =>
              print("DB Deleted: ${value.existsSync()}"));
      setStore(null);
      dbStore.clear();
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // unawaited(
      //     SlackAlertService().alert("Unable to clean database", extraInfo: e));
    }
  }
}
