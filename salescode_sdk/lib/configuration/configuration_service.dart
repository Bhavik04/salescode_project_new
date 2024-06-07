
import 'dart:convert';
import 'package:flutter/material.dart';

import '../constants/global_variables.dart';
import '../constants/utils.dart';
import '../datasync/data_sync_service.dart';
import '../db/loaders/configuration_loader.dart';
import '../models/data_sync_ui.dart';
import '../network/network_services.dart';
import 'configuration_dictionary.dart';
import 'models/configuration_ui.dart';

abstract class ConfigurationService {
  NetworkService networkService = NetworkService();
  ConfigurationLoader configurationLoader = ConfigurationLoader();

  Future<int> getClientConfig();
  Future<void> storeIntoDb(dynamic configurationValues);
  Future<void> addAllMetaData(List<dynamic> metadataList);

  Future<void> loadAppConfig();

  bool isConfigPresent(String designation);

  dynamic getSyncInfo(dynamic store,
      {required String name, String type = "full", int validityPeriod = 1});

  bool isServiceExpired(DataSyncUI ds);

  void setAppTheme() {
    GlobalVariables.themeColor = HexColor(
        ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor);
    GlobalVariables.primaryColor = HexColor(
        ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor);
    GlobalVariables.selectedNavBarColor = HexColor(
        ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor);
    GlobalVariables.themeColorCode =
        ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor;
    GlobalVariables.themeDisabledColor = HexColor(ConfigurationDictionary
                .themeConfiguration.themeDisabledButtonColor ==
            "null"
        ? "FFFFFF"
        : ConfigurationDictionary.themeConfiguration.themeDisabledButtonColor);
    GlobalVariables.appBarGradient = LinearGradient(
      colors: [
        HexColor(ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor),
        HexColor(ConfigurationDictionary.themeConfiguration.themeColor == "null"
            ? "FFFFFF"
            : ConfigurationDictionary.themeConfiguration.themeColor),
      ],
      stops: const [0.5, 1.0],
    );
  }

  String getConfigByName(String name) {
    List<ConfigurationUI> outputList =
        GlobalVariables.appConfig.where((o) => o.name == name).toList();
    if (outputList.isNotEmpty) {
      String value = "null";
      if (outputList.first.value != "") {
        value = outputList.first.value;
      }
      return value;
    } else {
      return "null";
    }
  }

  //this method is written when service is initialised at a perticular screen. this method will make sure wheather that particular feature
  //is subscribed for this user. To avoid unnecessary service initialisation.
  bool isServiceSubscribedForUser(String serviceName) {
    List<dynamic> features = jsonDecode(
        ConfigurationDictionary.appFeatureConfiguration.featureConfig);
    List<String> allSubscribedServcies = [];
    for (dynamic feature in features) {
      if (featureToServiceMapping[feature['name']] != null) {
        allSubscribedServcies.addAll(
            featureToServiceMapping[feature['name']] as Iterable<String>);
      }
    }
    return allSubscribedServcies.contains(serviceName);
  }

  String getTemplateInfo(String feautre) {
    List<dynamic> features = jsonDecode(
        ConfigurationDictionary.appFeatureConfiguration.featureConfig);
    List<dynamic> config = features
        .where((feature) => feature['name'].toLowerCase() == feautre)
        .toList();
    String template = "";
    if (config.isNotEmpty) {
      template = config[0]["template"];
    }

    return template;
  }

  // String getLoginTheme() {
  //   String loginType =
  //       ConfigurationDictionary.authenticationConfiguration.loginType;
  //   if (loginType.toLowerCase() == "otp") {
  //     return PhoneLoginScreen.routeName;
  //   } else if (loginType.toLowerCase() == "password") {
  //     return OutletLoginScreen.routeName;
  //   } else if ((loginType.toLowerCase() == "otpandpassword" ||
  //       loginType == "")) {
  //     return SignIn2.routeName;
  //   } else if (loginType.toLowerCase() == "jnj") {
  //     return SFALoginScreen.routeName;
  //   }
  //   return SignIn2.routeName;
  // }
}
