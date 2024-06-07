import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salescode_sdk/application/models/application_data_ui.dart';
import 'package:salescode_sdk/application/repository/application_repository.dart';
import 'package:salescode_sdk/application/repository/application_repository_app.dart';
import 'storage_utils.dart';
import 'storage_keys.dart';

class StorageService {
  ApplicationRepositoryApp applicationRepository = ApplicationRepositoryApp();

  bool containsKeyInSecureData(StorageKey key) {
    var containsKey = applicationRepository.readData(key.name).isNotEmpty;
    return containsKey;
  }

  String? readSecureData(StorageKey key) {
    List<ApplicationDataUiModel> readData =
        applicationRepository.readData(key.name);
    return readData.isNotEmpty ? readData[0].value : null;
  }

  Future<void> writeSecureData(StorageKey key, String value) async {
    ApplicationDataUiModel applicationDataUi =
        ApplicationDataUiModel(name: key.name, value: value);
    await applicationRepository.writeStorageData(applicationDataUi);
  }

  Future<void> deleteSecureData(StorageKey key) async {
    await applicationRepository.clearStorageData(key.name);
  }

  Future<void> clear() async {
    await applicationRepository.clearAllStorageData();
  }

  String? getString(StorageKey key) {
    String? flag = readSecureData(key);
    return flag;
  }

  Future<void> setString(StorageKey key, String value) async {
    await writeSecureData(key, value);
  }

  Future<void> setBool(StorageKey key, bool value) async {
    await writeSecureData(key, value.toString());
  }

  bool? getBool(StorageKey key) {
    String? flag = readSecureData(key);
    return StorageUtils.convertStringToBool(flag);
  }

  Future<void> setInt(StorageKey key, int value) async {
    await writeSecureData(key, value.toString());
  }

  int? getInt(StorageKey key) {
    String? integer = readSecureData(key);
    return StorageUtils.getIntFromString(integer);
  }

  Future<void> setStringList(StorageKey key, List<String> list) async {
    await writeSecureData(key, jsonEncode(list));
  }

  List<String> getStringList(StorageKey key) {
    String? listStr = readSecureData(key);
    return StorageUtils.getListFromString(listStr);
  }

  Future<void> setDouble(StorageKey key, double value) async {
    await writeSecureData(key, value.toString());
  }

  double? getDouble(StorageKey key) {
    String? integer = readSecureData(key);
    return StorageUtils.getDoubleFromString(integer);
  }

  Future<void> remove(StorageKey key) async {
    await deleteSecureData(key);
  }

  // void setAuthTokenFromSharedPrefs() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? savedAuthToken = await secureStorage.readData(StorageKey.authToken);
  //   if (savedAuthToken == null) {
  //     String? token = preferences.getString('x-auth-token');
  //     if (token != null) {
  //       await secureStorage.saveData(StorageKey.authToken, token);
  //       await preferences.remove('x-auth-token');
  //     } else {
  //       // const secureStorage = FlutterSecureStorage();
  //       // var readData = await secureStorage.read(
  //       //     key: StorageKey.authToken.name,
  //       //     aOptions: _getAndroidOptions(),
  //       //     iOptions: _getIOSOptions());
  //       // if (readData != null) {
  //       //   await prefs.setString(StorageKey.authToken, readData);
  //       //   await secureStorage.delete(
  //       //       key: StorageKey.authToken.name,
  //       //       aOptions: _getAndroidOptions(),
  //       //       iOptions: _getIOSOptions());
  //       // }
  //       String? oldToken = getString(StorageKey.authToken);
  //       if (oldToken != null) {
  //         await secureStorage.saveData(StorageKey.authToken, oldToken);
  //         await remove(StorageKey.authToken);
  //       }
  //     }
  //   }
  // }
}

AndroidOptions _getAndroidOptions() => const AndroidOptions();
IOSOptions _getIOSOptions() => const IOSOptions();
