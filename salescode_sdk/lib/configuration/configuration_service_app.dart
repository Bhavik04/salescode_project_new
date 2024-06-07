import 'dart:convert';
import 'dart:io';

import 'package:client_information/client_information.dart';
import 'package:flutter/foundation.dart';

import '../constants/global_variables.dart';
import '../datasync/data_sync_service.dart';
import '../db/loaders/meta_data_loader.dart';
import '../db/models/app/application_data.dart';
import '../db/models/app/configuration.dart';
import '../db/models/app/data_sync.dart';
import '../db/models/app/metadata.dart';
import '../db/services/database/database_service_app.dart';
import '../models/data_sync_ui.dart';
import '../models/metadata_ui.dart';
import '../network/network_services.dart';
import '../objectbox.g.dart';
import '../user/models/user_ui.dart';
import '../user/services/user_services_app.dart';
import 'configuration_dictionary.dart';
import 'configuration_service.dart';
import 'models/configuration_ui.dart';

class ConfigurationServiceApp extends ConfigurationService {
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  MetadataLoader metadataLoader = MetadataLoader();

  @override
  Future<int> getClientConfig() async {
    Store store = databaseService.getStore()!;
    int status = 200;
    try {
      DataSyncV1 dataSyncEntry =
          getSyncInfo(store, name: describeEnum(Services.ConfigurationLoader));
      bool isInitialised = false;
      if (dataSyncEntry.status == "success") {
        isInitialised =
            !isServiceExpired(DataSyncUI.fromMap(dataSyncEntry.toMap()));
      }
      if (!isInitialised) {
        try {
          NetworkResponse<dynamic> networkResponse = await networkService
              .get<dynamic>('/metadata/clientconfig?minimalResponse=true',
                  isTokenRequired: false);
          GlobalVariables.metadata = networkResponse;
          List<ConfigurationUI> configurationList = [];
          List<MetadataUI> metadataList = [];
          dynamic configurationValues =
              GlobalVariables.metadata.data['features'];
          List<String> configKeyList = GlobalVariables.requiredDomainTypes;

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
                  betaVersions =
                      configurationValues[i]['domainValues'][j]['value'];
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
            configurationValues =
                overrideConfig(configurationValues, betaConfig);
          }

          for (int i = 0; i < configurationValues.length; i++) {
            if (configKeyList.contains(configurationValues[i]['domainType']) ||
                configurationValues[i]['domainType']
                    .contains("app_feature_configuration") ||
                configurationValues[i]['domainType']
                    .contains("app_layout_configuration") ||
                configurationValues[i]['domainType']
                    .contains("app_options_configuration") ||
                configurationValues[i]['domainType']
                    .endsWith("specific_configuration")) {
              for (int j = 0;
                  j < configurationValues[i]['domainValues'].length;
                  j++) {
                configurationList.add(ConfigurationUI.toConfiguration(
                    configurationValues[i]['domainValues'][j],
                    configurationValues[i]['domainType']));
              }
            } else {
              metadataList.add(MetadataUI.fromMap(
                  _toMetadata(configurationValues[i]).toMap()));
            }
          }

          store.box<ConfigurationV1>().removeAll();
          store.box<MetadataV1>().removeAll();
          store
              .box<ConfigurationV1>()
              .putMany(configurationList.map((configUI) {
                return ConfigurationV1(
                  id: configUI.id,
                  name: configUI.name,
                  value: configUI.value,
                  role: configUI.role,
                  feature: configUI.feature,
                  domainType: configUI.domainType,
                );
              }).toList());
          store.box<MetadataV1>().putMany(
              metadataList.map((e) => MetadataV1.fromMap(e.toMap())).toList());
          debugPrint("Metadata V1 count in service: ${store.box<MetadataV1>().count()}");
          debugPrint("ConfigurationV1 count in service: ${store.box<ConfigurationV1>().count()}");
          await loadAppConfig();
          dataSyncEntry.status = describeEnum(Status.success);
          store.box<DataSyncV1>().put(dataSyncEntry);
          status = networkResponse.status;
        } on NetworkException catch (e) {
          await loadAppConfig();
          if (store.box<ConfigurationV1>().getAll().isNotEmpty) {
            status = 200;
          } else {
            status = e.status;
          }
        }
      }
      await loadAppConfig();
      return status;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return 500;
    }
  }

  Map<String, List<dynamic>> createConfigMapping(
      dynamic configurationDomainValues) {
    Map<String, List<dynamic>> configMapping = {};
    for (int j = 0; j < configurationDomainValues.length; j++) {
      String? domainType = configurationDomainValues?[j]?["domainType"];
      if (domainType == null) {
        continue;
      }
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

  MetadataV1 _toMetadata(Map<String, dynamic> data) {
    var domainValues = data['domainValues'];

    MetadataV1 metadata = MetadataV1(
      domainName: data['domainName'].toString() ?? '',
      domainType: data['domainType'].toString() ?? '',
      domainValue: json.encode(domainValues) ?? '',
    );
    return metadata;
  }

  @override
  bool isConfigPresent(String designation) {
    Store store = databaseService.getStore()!;
    Box<ConfigurationV1> productMetadataBox = store.box<ConfigurationV1>();
    QueryBuilder<ConfigurationV1> queryBuilder = productMetadataBox.query();
    Query<ConfigurationV1> query = queryBuilder.build();
    List<ConfigurationV1> configurationListValue = query.find();
    List<ConfigurationV1> configList = [];
    configurationListValue.forEach((config) {
      if (config.feature == ("${designation}_app_layout_configuration") ||
          config.feature == ("${designation}_app_feature_configuration") ||
          config.feature == ("${designation}_app_options_configuration")) {
        configList.add(config);
      }
    });
    if (configList.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Future<void> loadAppConfig() async {
    UserServicesApp userServices = UserServicesApp();
    List<UserUI> userList = userServices.getUserList();
    String? designation;
    List<String> roles = [];
    if (userList.isNotEmpty) {
      designation = userList.first.designation.toLowerCase();
    }

    if (userList.isNotEmpty) {
      roles = userList.first.roles;
    }
    Store store = databaseService.getStore()!;
    Box<ConfigurationV1> productMetadataBox = store.box<ConfigurationV1>();
    QueryBuilder<ConfigurationV1> queryBuilder = productMetadataBox.query();
    Query<ConfigurationV1> query = queryBuilder.build();
    List<ConfigurationV1> configurationListValue = query.find();

    Box<ApplicationDataV1> applicationDataBox = store.box<ApplicationDataV1>();
    QueryBuilder<ApplicationDataV1> queryBuilder1 = applicationDataBox.query();
    Query<ApplicationDataV1> query1 = queryBuilder1.build();
    List<ApplicationDataV1> applicationDataListValue = query1.find();

    List<ConfigurationV1> finalList = [];
    List<String> roleSpecificConfigs = [];
    List<String> roleDomainNames = [];
    for (String role in roles) {
      roleDomainNames.add("${role}_specific_configuration");
    }
    if (designation != null && designation.isNotEmpty) {
      roleDomainNames.add("${designation}_specific_configuration");
    }
    if (roleDomainNames.isNotEmpty) {
      for (var config in configurationListValue) {
        if (roleDomainNames.contains(config.feature)) {
          roleSpecificConfigs.add(config.name);
          config.feature = config.domainType;
          finalList.add(config);
        }
      }
    }

    for (var config in configurationListValue) {
      if (!(config.feature.contains("app_layout_configuration") ||
          config.feature.contains("app_feature_configuration") ||
          config.feature.contains("app_options_configuration") ||
          roleSpecificConfigs.contains(config.name) ||
          config.feature.contains("specific_configuration"))) {
        finalList.add(config);
      }
    }

    for (var config in applicationDataListValue) {
      if (config.name == 'useExternalRecoEngine' && config.value == 'true') {
        GlobalVariables.useExternalRecoEngine = true;
      }
    }

    if (designation != null) {
      configurationListValue.forEach((config) {
        if (config.feature
                .contains("${designation}_app_layout_configuration") ||
            config.feature
                .contains("${designation}_app_feature_configuration") ||
            config.feature
                .contains("${designation}_app_options_configuration")) {
          finalList.add(config);
        }
      });
    }
    GlobalVariables.appConfig =
        finalList.map((e) => ConfigurationUI.fromMap(e.toMap())).toList();

    ConfigurationDictionary.init(
        finalList.map((e) => ConfigurationUI.fromMap(e.toMap())).toList());
    setAppTheme();
  }

  @override
  DataSyncV1 getSyncInfo(dynamic store,
      {required String name, String type = "full", int validityPeriod = 1}) {
    List<DataSyncV1> dsList = store
        .box<DataSyncV1>()
        .query(DataSyncV1_.name
            .equals(name)
            .and(DataSyncV1_.syncType.equals(type)))
        .build()
        .find();
    return dsList.isNotEmpty
        ? dsList.first
        : DataSyncV1(
            syncTime: 0,
            syncType: type,
            name: name,
            startTime: DateTime.now(),
            endTime: DateTime.now(),
            status: "pending",
            expiryTime: DateTime.now().add(Duration(days: validityPeriod)));
  }

  @override
  bool isServiceExpired(DataSyncUI ds) {
    return DataSyncV1.fromMap(ds.toMap())
            .expiryTime
            .compareTo(DateTime.now()) <=
        0;
  }

  @override
  Future<void> storeIntoDb(dynamic configurationValues) async {
    Store store = await databaseService.getStore()!;
    List<ConfigurationUI> configurationList = [];
    List<MetadataV1> metadataList = [];
    List<String> configKeyList = GlobalVariables.requiredDomainTypes;
    for (int i = 0; i < configurationValues.length; i++) {
      if (configKeyList.contains(configurationValues[i]['domainType']) ||
          configurationValues[i]['domainType']
              .contains("app_feature_configuration") ||
          configurationValues[i]['domainType']
              .contains("app_layout_configuration") ||
          configurationValues[i]['domainType']
              .contains("app_options_configuration") ||
          configurationValues[i]['domainType']
              .endsWith("specific_configuration")) {
        for (int j = 0;
            j < configurationValues[i]['domainValues'].length;
            j++) {
          configurationList.add(ConfigurationUI.toConfiguration(
              configurationValues[i]['domainValues'][j],
              configurationValues[i]['domainType']));
        }
      } else {
        metadataList.add(MetadataV1.toMetadata(configurationValues[i]));
      }
    }
    store.box<ConfigurationV1>().removeAll();
    store.box<ConfigurationV1>().putMany(configurationList.map((uiConfig) {
          return ConfigurationV1.fromMap(uiConfig.toMap());
        }).toList());
    store.box<MetadataV1>().putMany(metadataList);
  }

  @override
  Future<void> addAllMetaData(List<dynamic> metadataList) async {
    Store store = await databaseService.getStore()!;
    store.box<MetadataV1>().removeAll();
    List<MetadataV1> metadataList_ = [];
    for (int i = 0; i < metadataList.length; i++) {
      metadataList_.add(MetadataV1.toMetadata(metadataList[i]));
    }
    store.box<MetadataV1>().putMany(metadataList_);
  }
}
