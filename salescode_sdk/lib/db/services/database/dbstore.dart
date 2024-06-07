import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:salescode_sdk/auth/services/auth_state.dart';
import '../../../objectbox.g.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

class DBStore {
  static Store? _store;
  static Store? get store => _store;
  

  Future<Store> getStore() async {
    // if (Admin.isAvailable()) {
    //   final admin = Admin(_store!);
    // }
    String dbName = await getDbPath();
    return _store ??= await openStore(directory: dbName);
  }

  Future<String> getDbPath() async {
    AuthState authState = AuthState();
    String localDocumentPath =
        ((await getApplicationDocumentsDirectory()).path);
    return '$localDocumentPath/objectBox-${authState.lob}';
  }

  void close() {
    _store?.close();
  }

  void clear() {
    _store = null;
  }

  void setStore(Store? store) {
    _store = store;
  }
}
