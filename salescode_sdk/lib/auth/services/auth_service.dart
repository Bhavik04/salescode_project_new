import 'dart:convert';

import 'package:salescode_sdk/auth/services/key_helper.dart';
import 'package:salescode_sdk/constants/config_lob.dart';
import 'package:salescode_sdk/db/storage/storage_keys.dart';
import 'package:salescode_sdk/network/network_services.dart';
import 'package:salescode_sdk/services/secure_storage/secure_storage.dart';

class AuthService {
  String lob = AppConfig.lob;
  NetworkService networkService = NetworkService();
  SecureStorage secureStorage = SecureStorage();

  Future<NetworkResponse> compute(String email, String password,
      [bool toHash = true]) async {
    String body = jsonEncode({
      'loginId': email.trim(),
      'password': toHash ? Cryptom.text(password.trim()) : password.trim(),
      "lob": lob,
      "unlimitedExpiry": true,
    });

    NetworkResponse<dynamic> res = await networkService.post<dynamic, String>(
        "/signin?lob=${lob}&expiry=unlimited", body,
        avoidLogout: true, avoidLogs: true);
    return res;
  }

  Future<String> signInUser(
      {required String email,
      required String password,
      bool toHash = true}) async {
    try {
      NetworkResponse<dynamic> res = await compute(email, password, toHash);
      if (res.status == 200) {
        var jsonResp = res.data;
        // StorageService prefs = GetIt.instance.get<StorageService>();
        // SecureStorage secureStorage = GetIt.instance.get<SecureStorage>();
        await secureStorage.saveData(StorageKey.authToken, jsonResp['token']);

        // await dataSyncService.deleteSyncInfo(name: userLoaderService.name);
        // await userLoaderService.load();
        // List<UserUI> userList = userServices.getUserList();
        bool isConfigPresent = false;
        // if (userList.isNotEmpty) {
        //   isConfigPresent =
        //       configurationService.isConfigPresent(userList.first.designation);
        // }
        // if (!isConfigPresent) {
        //   await secureStorage.deleteData(StorageKey.authToken);
        //   return "unauthorized";
        // }
        // await clearDataOnUserChange();
        // if (ConfigurationDictionary.appConfiguration.privacyPolicyValidation ==
        //         "true" &&
        //     GlobalVariables.metadata != null) {
        //   await checkPrivacyPolicyCondition();
        // }

        return "true";
      } else {
        return "false";
      }
    } catch (error, stackTrace) {
      return "false";
    }
  }
}
