import 'configuration_ui.dart';

class KpiConfiguration {
  final Map<String, dynamic> _configMap = {
    "kpiList": "null",
    "kpiConfigList": "null",
    "kpi_metadata": "null"
  };

  String get kpiList => _configMap["kpiList"];
  String get kpiConfigList => _configMap["kpiConfigList"];
  String get kpiMetadata => _configMap["kpi_metadata"];

  KpiConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
