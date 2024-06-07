
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salescode_sdk/db/storage/storage_keys.dart';
import 'package:salescode_sdk/db/storage/storage_service.dart';

class SecureStorage {
  late final FlutterSecureStorage _storage;
  bool _testEnvironment = false;

  final StorageService _storageService = StorageService();

  SecureStorage() {
    _storage = const FlutterSecureStorage();
  }

  void mockOn() {
    _testEnvironment = true;
  }

  void mockOff() {
    _testEnvironment = false;
  }

  bool isInTestEnvironment() {
    return _testEnvironment;
  }

  Future<void> saveData(StorageKey key, String value) async {
    if (_testEnvironment) {
      await _storageService.setString(key, value);
      return;
    }
    await _storage.write(key: key.name, value: value);
  }

  Future<void> deleteData(StorageKey key) async {
    if (_testEnvironment) {
      await _storageService.remove(key);
      return;
    }
    await _storage.delete(key: key.name);
  }

  Future<String?> readData(StorageKey key) async {
    if (_testEnvironment) {
      return _storageService.getString(key);
    }
    return _storage.read(key: key.name);
  }
}
