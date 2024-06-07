import 'configuration_ui.dart';

class PsrpmConfiguration {
  final Map<String, dynamic> _configMap = {
    "performanceMetricsOptions": "null",
    "dashboardType": "null",
    "stockistSamriddhiCards": "null"
  };

  String get performanceMetricsOptions =>
      _configMap["performanceMetricsOptions"];
  String get dashboardType => _configMap["dashboardType"];
  String get stockistSamriddhiCards => _configMap["stockistSamriddhiCards"];

  PsrpmConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
