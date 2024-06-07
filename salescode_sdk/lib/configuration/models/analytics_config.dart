import 'configuration_ui.dart';

class AnalyticsConfiguration {
  final Map<String, dynamic> _configMap = {
    "defaultParams": "null",
    "events": "null",
    "pageviewLabelsMapping": "null",
  };

  String get defaultParams => _configMap["defaultParams"];
  String get events => _configMap["events"];
  String get pageviewLabelsMapping => _configMap["pageviewLabelsMapping"];

  AnalyticsConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
