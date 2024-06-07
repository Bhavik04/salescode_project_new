import 'dart:io';

import 'package:client_information/client_information.dart';

import '../../configuration/configuration_service_app.dart';
import '../../constants/global_variables.dart';
import '../../network/network_services.dart';
import 'loader.dart';

class ConfigurationLoader extends Loader {
  NetworkService networkService = NetworkService();

  @override
  String get name => "ConfigurationLoader";
  
  @override
  Future<void> fetchAndSave() async {
    ConfigurationServiceApp configurationService = ConfigurationServiceApp();

    NetworkResponse<dynamic> response = await networkService
        .get<dynamic>('/metadata/clientconfig?minimalResponse=true');
    GlobalVariables.metadata = response;
    if (response.status == 200) {
      dynamic configurationValues = response.data['features'];
      var betaVersions;
      var iosBetaVersions;
      Map<String, List<dynamic>> betaConfig = {};
      for (int i = 0; i < configurationValues.length; i++) {
        if (configurationValues[i]["domainType"] == "app_configuration") {
          //fetching betaVersion
          for (int j = 0;
              j < configurationValues[i]['domainValues'].length;
              j++) {
            if (configurationValues[i]['domainValues'][j]['name'] ==
                "betaVersion") {
              betaVersions = configurationValues[i]['domainValues'][j]['value'];
            } else if (configurationValues[i]['domainValues'][j]['name'] ==
                "iosBetaVersion") {
              iosBetaVersions =
                  configurationValues[i]['domainValues'][j]['value'];
            }
          }
        } else if (configurationValues[i]["domainType"] ==
            "beta_configuration") {
          //creating beta config mapping
          betaConfig =
              createConfigMapping(configurationValues[i]['domainValues']);
        }
      }
      ClientInformation info = await ClientInformation.fetch();
      if ((betaVersions != null &&
              betaVersions.contains(info.applicationVersion) &&
              !Platform.isIOS) ||
          (iosBetaVersions != null &&
              iosBetaVersions.contains(info.applicationVersion) &&
              Platform.isIOS)) {
        configurationValues = overrideConfig(configurationValues, betaConfig);
      }
      await configurationService.storeIntoDb(configurationValues);
    }
    await configurationService.loadAppConfig();
  }

  Map<String, List<dynamic>> createConfigMapping(
      dynamic configurationDomainValues) {
    Map<String, List<dynamic>> configMapping = {};
    for (int j = 0; j < configurationDomainValues.length; j++) {
      String domainType = configurationDomainValues[j]["domainType"];
      if (configMapping.containsKey(domainType)) {
        configMapping[domainType]?.add(configurationDomainValues[j]);
      } else {
        configMapping[domainType] = [configurationDomainValues[j]];
      }
    }
    return configMapping;
  }

  dynamic overrideConfig(dynamic configurationValues,
      Map<String, List<dynamic>> overrideConfigList) {
    for (int i = 0; i < configurationValues.length; i++) {
      if (overrideConfigList
          .containsKey(configurationValues[i]["domainType"])) {
        for (var configObject
            in overrideConfigList[configurationValues[i]["domainType"]]!) {
          var existingObject = configurationValues[i]["domainValues"]
              .firstWhere((obj) => obj["name"] == configObject["name"],
                  orElse: () => null);

          if (existingObject != null) {
            // If object is found, replace it with configObject
            int index =
                configurationValues[i]["domainValues"].indexOf(existingObject);
            configurationValues[i]["domainValues"][index] = configObject;
          } else {
            // If object is not found, add configObject to domainValues
            configurationValues?[i]?["domainValues"]?.add(configObject);
          }
        }
      }
    }
    return configurationValues;
  }
}
