import 'configuration_ui.dart';

class TargetDashboardConfiguration {
  final Map<String, dynamic> _configMap = {
    "targetDashboardMetaData": "null",
    "targetDashboardParameterSequence":"null"
  };

  String get targetDashboardMetaData => _configMap["targetDashboardMetaData"];
  String get targetDashboardParameterSequence => _configMap["targetDashboardParameterSequence"];

  TargetDashboardConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}