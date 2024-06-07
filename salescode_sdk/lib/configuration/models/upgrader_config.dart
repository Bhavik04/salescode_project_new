import 'configuration_ui.dart';

class UpgraderConfiguration {
  final Map<String, dynamic> _configMap = {
    "upgraderConfig": "null",
    "forceUpdateConfig": "null"
  };

  String get upgraderConfig => _configMap["upgraderConfig"];
  String get forceUpdateConfig => _configMap["forceUpdateConfig"];

  UpgraderConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
