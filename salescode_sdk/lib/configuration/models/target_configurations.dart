import 'configuration_ui.dart';

class TargetConfiguration {
  final Map<String, dynamic> _configMap = {
    "targetType": "null",
    "targetUnit": "null",
    "targetLevel": "null",
    "targetSource": "null"
  };

  String get targetType => _configMap["targetType"];
  String get targetUnit => _configMap["targetUnit"];
  String get targetLevel => _configMap["targetLevel"];
  String get targetSource => _configMap["targetSource"];

  TargetConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
