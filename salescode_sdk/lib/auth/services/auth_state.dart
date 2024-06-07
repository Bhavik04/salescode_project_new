import 'package:salescode_sdk/constants/config_lob.dart';
import 'package:salescode_sdk/constants/global_variables.dart';
import 'package:salescode_sdk/db/storage/storage_keys.dart';
import 'package:salescode_sdk/services/secure_storage/secure_storage.dart';

class AuthState {
  String baseUrl = AppConfig.baseUrl;
  String lob = AppConfig.lob;

  SecureStorage secureStorage = SecureStorage();

  Future<Map<String, String>> getAuthHeader() async {
    String? token = await secureStorage.readData(StorageKey.authToken) ??
        GlobalVariables.token;
    Map<String, String> authHeader;
    if (token != "") {
      authHeader = {
        'Content-Type': 'application/json',
        'Authorization': token,
        'lob': lob
      };
    } else {
      authHeader = {'Content-Type': 'application/json', 'lob': lob};
    }
    return authHeader;
  }

  String getBaseUrl(String url) {
    if (url.startsWith("http")) {
      return "";
    }
    return baseUrl;
  }
}
