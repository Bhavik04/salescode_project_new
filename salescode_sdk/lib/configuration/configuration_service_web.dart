// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:get_it/get_it.dart';
// import 'package:hive/hive.dart' if (dart.index.io) '';
// import 'package:injectable/injectable.dart';
// import '../../constants/config_lob.dart';
// import '../../constants/global_variables.dart';
// import '../../db/loaders/meta_data_loader.dart';
// import '../../db/models/web/configuration.dart';
// import '../../db/models/web/data_sync.dart';
// import '../../db/models/web/metadata.dart';
// import '../../db/services/database/database_service.dart';
// import '../../db/services/datasync/data_sync_service.dart';
// import '../../models/configuration_ui.dart';
// import '../../models/data_sync_ui.dart';
// import '../../models/metadata_ui.dart';
// import '../../models/user_ui.dart';
// import '../../services/slack/slack_alert_service.dart';
// import '../network/network_services.dart';
// import '../order/services/order_utils.dart';
// import '../user/services/user_services.dart';
// import 'configuration_dictionary.dart';
// import 'configuration_service.dart';

// @Singleton(as: ConfigurationService, env: ["web"])
// class ConfigurationServiceWeb extends ConfigurationService {
//   late DatabaseService databaseService;
//   late MetadataLoader metadataLoader;

//   ConfigurationServiceWeb(
//     super.networkService,
//     super.configurationLoader, {
//     required this.databaseService,
//     required this.metadataLoader,
//   });

//   @override
//   Future<int> getClientConfig() async {
//     Box<DataSync> dsBox =
//         databaseService.getStore<DataSync>("dataSyncBox")! as Box<DataSync>;
//     Box<Configuration> configBox = databaseService
//         .getStore<Configuration>('configurationBox')! as Box<Configuration>;
//     Box<Metadata> metadataBox =
//         databaseService.getStore<Metadata>('metadataBox')! as Box<Metadata>;
//     int status = 200;
//     try {
//       DataSync dataSyncEntry =
//           getSyncInfo(dsBox, name: describeEnum(Services.ConfigurationLoader));
//       bool isInitialised = false;
//       if (dataSyncEntry.status == "success") {
//         isInitialised =
//             !isServiceExpired(DataSyncUI.fromMap(dataSyncEntry.toMap()));
//       }
//       if (!isInitialised) {
//         try {
//           NetworkResponse<dynamic> networkResponse = await networkService
//               .get<dynamic>('/metadata/clientconfig?minimalResponse=true',
//                   isTokenRequired: false);
//           GlobalVariables.metadata = networkResponse;
//           List<ConfigurationUI> configurationList = [];
//           dynamic configurationValues =
//               GlobalVariables.metadata.data['features'];
//           List<MetadataUI> metadataList = [];
//           List<String> configKeyList = GlobalVariables.requiredDomainTypes;
//           for (int i = 0; i < configurationValues.length; i++) {
//             if (configKeyList.contains(configurationValues[i]['domainType']) ||
//                 configurationValues[i]['domainType']
//                     .contains("app_feature_configuration") ||
//                 configurationValues[i]['domainType']
//                     .contains("app_layout_configuration") ||
//                 configurationValues[i]['domainType']
//                     .contains("app_options_configuration") ||
//                 configurationValues[i]['domainType']
//                     .endsWith("specific_configuration")) {
//               for (int j = 0;
//                   j < configurationValues[i]['domainValues'].length;
//                   j++) {
//                 configurationList.add(ConfigurationUI.toConfiguration(
//                     configurationValues[i]['domainValues'][j],
//                     configurationValues[i]['domainType']));
//               }
//             } else {
//               metadataList.add(MetadataUI.fromMap(
//                   _toMetadata(configurationValues[i]).toMap()));
//             }
//           }
//           await configBox.clear();
//           await metadataBox.clear();
//           await configBox.addAll(configurationList.map((configUI) {
//             return Configuration(
//               id: configUI.id,
//               name: configUI.name,
//               value: configUI.value,
//               role: configUI.role,
//               feature: configUI.feature,
//               domainType: configUI.domainType,
//             );
//           }).toList());
//           await metadataBox.addAll(metadataList.map((metaDataUI) {
//             return Metadata.fromMap(metaDataUI.toMap());
//           }));
//           await configurationService.loadAppConfig();
//           dataSyncEntry.status = describeEnum(Status.success);
//           dsBox.add(dataSyncEntry);
//           status = networkResponse.status;
//         } on NetworkException catch (e) {
//           await configurationService.loadAppConfig();
//           status = e.status;
//           unawaited(SlackAlertService().alert(
//               "Configuration API failed with status ${e.status}",
//               extraInfo: e));
//         }
//       } else {
//         await configurationService.loadAppConfig();
//       }
//       return status;
//       // ignore: avoid_catches_without_on_clauses
//     } catch (e) {
//       unawaited(SlackAlertService()
//           .alert("Failed to get client config", extraInfo: e));
//       return 500;
//     }
//   }

//   Metadata _toMetadata(Map<String, dynamic> data) {
//     var domainValues = data['domainValues'];

//     Metadata metadata = Metadata(
//       domainName: data['domainName'].toString() ?? '',
//       domainType: data['domainType'].toString() ?? '',
//       domainValue: json.encode(domainValues) ?? '',
//     );
//     return metadata;
//   }

//   @override
//   DataSync getSyncInfo(store,
//       {required String name, String type = "full", int validityPeriod = 1}) {
//     Box<DataSync> dataSyncBox =
//         databaseService.getStore<DataSync>('dataSyncBox')! as Box<DataSync>;
//     List<DataSync> dsList = dataSyncBox.values
//         .where((element) => element.name == name && element.syncType == type)
//         .toList();
//     return dsList.isNotEmpty
//         ? dsList.first
//         : DataSync(
//             syncTime: 0,
//             syncType: type,
//             name: name,
//             startTime: DateTime.now(),
//             endTime: DateTime.now(),
//             status: "pending",
//             expiryTime: DateTime.now().add(Duration(days: validityPeriod)));
//   }

//   @override
//   bool isServiceExpired(DataSyncUI ds) {
//     return DataSync.fromMap(ds.toMap()).expiryTime.compareTo(DateTime.now()) <=
//         0;
//   }

//   @override
//   Future<void> loadAppConfig() async {
//     UserServices userServices = GetIt.instance.get<UserServices>();
//     List<UserUI> userList = userServices.getUserList();
//     String? designation;
//     List<String> roles = [];

//     if (userList.isNotEmpty) {
//       designation = userList.first.designation.toLowerCase();
//     }
//     if (userList.isNotEmpty) {
//       roles = userList.first.roles;
//     }
//     Box<Configuration> tempConfigBox = databaseService
//         .getStore<Configuration>('configurationBox')! as Box<Configuration>;
//     await tempConfigBox.close();
//     await Hive.openBox<Configuration>('configurationBox');
//     Box<Configuration> configBox = databaseService
//         .getStore<Configuration>('configurationBox')! as Box<Configuration>;
//     List<Configuration> configurationListValue = configBox.values.toList();
//     print(configurationListValue.length);
//     print(configurationListValue
//         .where((element) => element.feature.contains("specific_configuration"))
//         .toList());
//     List<Configuration> finalList = [];
//     List<String> roleSpecificConfigs = [];
//     List<String> roleDomainNames = [];

//     for (String role in roles) {
//       roleDomainNames.add("${role}_specific_configuration");
//     }
//     if (designation != null && designation!.isNotEmpty) {
//       roleDomainNames.add("${designation}_specific_configuration");
//     }
//     if (roleDomainNames.isNotEmpty && AppConfig.lob!="hccbckinddemo" && AppConfig.lob!="kbuddy") {
//       for (var config in configurationListValue) {
//         if (roleDomainNames.contains(config.feature)) {
//           //config.feature=="${designation}_specific_configuration"
//           roleSpecificConfigs.add(config.name);
//           config.feature = config.domainType;
//           finalList.add(config);
//         }
//       }
//     }

//     configurationListValue.forEach((config) {
//       if (!(config.feature.contains("app_layout_configuration") ||
//           config.feature.contains("app_feature_configuration") ||
//           config.feature.contains("app_options_configuration") ||
//           roleSpecificConfigs.contains(config.name) ||
//           config.feature.contains("specific_configuration"))) {
//         finalList.add(config);
//       }
//     });

//     if (designation != null) {
//       configurationListValue.forEach((config) {
//         if (config.feature
//                 .contains("${designation}_app_layout_configuration") ||
//             config.feature
//                 .contains("${designation}_app_feature_configuration") ||
//             config.feature
//                 .contains("${designation}_app_options_configuration")) {
//           finalList.add(config);
//         }
//       });
//     }
//     GlobalVariables.appConfig =
//         finalList.map((e) => ConfigurationUI.fromMap(e.toMap())).toList();

//     ConfigurationDictionary.init(
//         finalList.map((e) => ConfigurationUI.fromMap(e.toMap())).toList());
//     setAppTheme();
//   }

//   @override
//   bool isConfigPresent(String designation) {
//     Box<Configuration> configBox = databaseService
//         .getStore<Configuration>('configurationBox')! as Box<Configuration>;
//     Iterable<Configuration> configurationListValue = configBox.values;
//     List<Configuration> configList = [];
//     configurationListValue.forEach((config) {
//       if (config.feature == ("${designation}_app_layout_configuration") ||
//           config.feature == ("${designation}_app_feature_configuration") ||
//           config.feature == ("${designation}_app_options_configuration")) {
//         configList.add(config);
//       }
//     });
//     if (configList.isEmpty) {
//       return false;
//     }
//     return true;
//   }

//   @override
//   Future<void> storeIntoDb(configurationValues) async {
//     Box<Configuration> configBox = databaseService
//         .getStore<Configuration>('configurationBox')! as Box<Configuration>;
//     Box<Metadata> metadataBox =
//         databaseService.getStore<Metadata>('metadataBox')! as Box<Metadata>;
//     List<ConfigurationUI> configurationList = [];
//     List<Metadata> metadataList = [];
//     List<String> configKeyList = GlobalVariables.requiredDomainTypes;
//     for (int i = 0; i < configurationValues.length; i++) {
//       if (configKeyList.contains(configurationValues[i]['domainType']) ||
//           configurationValues[i]['domainType']
//               .contains("app_feature_configuration") ||
//           configurationValues[i]['domainType']
//               .contains("app_layout_configuration") ||
//           configurationValues[i]['domainType']
//               .contains("app_options_configuration") ||
//           configurationValues[i]['domainType']
//               .endsWith("specific_configuration")) {
//         for (int j = 0;
//             j < configurationValues[i]['domainValues'].length;
//             j++) {
//           configurationList.add(ConfigurationUI.toConfiguration(
//               configurationValues[i]['domainValues'][j],
//               configurationValues[i]['domainType']));
//         }
//       } else {
//         metadataList.add(Metadata.toMetadata(configurationValues[i]));
//       }
//     }
//     configBox = await databaseService
//         .clearBox<Configuration>("configurationBox", boxInstance: configBox);
//     metadataBox = await databaseService.clearBox<Metadata>("metadataBox",
//         boxInstance: metadataBox);
//     await configBox.addAll(configurationList.map((uiConfig) {
//       return Configuration.fromMap(uiConfig.toMap());
//     }).toList());
//     await metadataBox.addAll(metadataList);
//   }

//   @override
//   Future<void> addAllMetaData(List<dynamic> metadataList) async {
//     Box<Metadata> metadataBox =
//         databaseService.getStore<Metadata>('metadataBox')! as Box<Metadata>;
//     await metadataBox.clear();
//     List<Metadata> metadataList_ = [];
//     for (int i = 0; i < metadataList.length; i++) {
//       metadataList_.add(Metadata.toMetadata(metadataList[i]));
//     }
//     await metadataBox.addAll(metadataList_);
//   }
// }
