import 'configuration_ui.dart';

class MustDoActionConfiguration {
  final Map<String, dynamic> _configMap = {
    "mustDoActionCard": "null",
    "outletTabFilters": "null"
  };
  String get mustDoActionCard => _configMap["mustDoActionCard"];
  String get outletTabFilters => _configMap["outletTabFilters"];

  MustDoActionConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
