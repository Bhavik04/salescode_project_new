import 'configuration_ui.dart';

class TabFiltersConfiguration {
  final Map<String, dynamic> _configMap = {
    "tabFilters": "null",
  };

  String get tabFilters => _configMap["tabFilters"];

  TabFiltersConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
