import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:salescode_sdk/auth/services/auth_state.dart';
import 'package:salescode_sdk/constants/global_variables.dart';
import 'package:salescode_sdk/constants/utils.dart';
import 'package:http/http.dart' as http;

import '../db/storage/storage_keys.dart';
import '../services/secure_storage/secure_storage.dart';

class NetworkException implements Exception {
  dynamic error;
  int status;
  NetworkException({
    required this.error,
    required this.status,
  });

  @override
  String toString() {
    return "Error: ${error.toString()}, Status: $status";
  }
}

class NetworkResponse<T> {
  T data;
  int status;
  String url;
  String method;
  Map<String, String> headers;

  NetworkResponse(
      {required this.data,
      required this.status,
      required this.url,
      required this.method,
      required this.headers});
}

Future<String> getModifiedUrl(String url) async {
  AuthState authState = AuthState();
  String uri = authState.getBaseUrl(url) + url;
  return uri;
}

class NetworkService {
  Future<NetworkResponse<T>> get<T>(String url,
      {int timeOutDuration = 100,
      bool avoidLogout = false,
      int retryDelay = 2,
      int retryAttempts = 2,
      int attemptNumber = 1,
      String targetLob = '',
      bool isTokenRequired = true,
      Function? jsonParser}) async {
    AuthState authState = AuthState();
    if (isTokenRequired) {
      SecureStorage secureStorage = SecureStorage();

      String? token = await secureStorage.readData(StorageKey.authToken);
      if (token == null || token.isEmpty) {
        throw NetworkException(error: "", status: 403);
      }
    }

    Map<String, String> authHeader = await authState.getAuthHeader();
    if (targetLob.isNotEmpty) {
      authHeader['lob'] = targetLob;
    }

    String uri = await getModifiedUrl(url);

    http.Response res = await http.Client()
        .get(Uri.parse(uri), headers: authHeader)
        .timeout(Duration(seconds: timeOutDuration), onTimeout: () {
      return http.Response('TimeOut Error', 408);
    });

    if (res.statusCode == 200 || res.statusCode == 201) {
      T data;
      if (jsonParser == null) {
        data = jsonDecodeSafely(utf8.decode(res.bodyBytes)) as T;
      } else {
        data = jsonParser(jsonDecodeSafely(utf8.decode(res.bodyBytes)));
      }
      return NetworkResponse(
          data: data,
          status: res.statusCode,
          url: url,
          method: "GET",
          headers: res.headers);
    } else {
      if (attemptNumber < retryAttempts) {
        return Future<NetworkResponse<T>>.delayed(Duration(seconds: retryDelay),
            () async {
          return get(url,
              timeOutDuration: timeOutDuration,
              retryDelay: retryDelay,
              retryAttempts: retryAttempts,
              attemptNumber: attemptNumber + 1,
              isTokenRequired: isTokenRequired,
              targetLob: targetLob,
              avoidLogout: avoidLogout);
        });
      } else {
        throw NetworkException(
            error: jsonDecodeSafely(res.body), status: res.statusCode);
      }
    }
  }

  ///url -> url to fetch data.
  ///data -> post data
  /// timeOutDuration -> if api is taking time after this time it will return TimeOut Error with status code 408.

  Future<NetworkResponse<T>> post<T, D>(String url, D body,
      {Map<String, dynamic>? headers,
      String? featureName,
      int timeOutDuration = 100,
      bool avoidLogout = false,
      String targetLob = '',
      bool avoidLogs = false}) async {
    AuthState authState = AuthState();
    if (GlobalVariables.appType == "SFA" && avoidLogs == false) {
      T data = [] as T;
      // addToOfflineScheduler(url, "post", body, "Pending", featureName);
      return NetworkResponse(
          data: data, status: 102, url: url, method: "POST", headers: {});
    } else {
      Map<String, String> authHeader = await authState.getAuthHeader();
      if (targetLob.isNotEmpty) {
        authHeader['lob'] = targetLob;
      }

      if (headers != null) {
        for (MapEntry<String, dynamic> entry in headers.entries) {
          authHeader[entry.key] = entry.value;
        }
      }

      String uri = await getModifiedUrl(url);

      http.Response? res = await http.Client()
          .post(Uri.parse(uri), body: body, headers: authHeader)
          .timeout(Duration(seconds: timeOutDuration), onTimeout: () {
        return http.Response('TimeOut Error', 408);
      });

      if (res.statusCode == 201 ||
          res.statusCode == 200 ||
          res.statusCode == 412 ||
          res.statusCode == 409) {
        T data = jsonDecodeSafely(utf8.decode(res.bodyBytes)) as T;

        return NetworkResponse(
            data: data,
            status: res.statusCode,
            url: url,
            method: "POST",
            headers: res.headers);
      } else {
        if (GlobalVariables.appType == "SFA" && !avoidLogs) {
          T data = [] as T;
          // addToOfflineScheduler(url, "post", body, "Pending");
          return NetworkResponse(
              data: data, status: 102, url: url, method: "POST", headers: {});
        }

        throw NetworkException(
            error: jsonDecodeSafely(res.body), status: res.statusCode);
      }
    }
  }
}
