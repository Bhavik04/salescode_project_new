import 'configuration_ui.dart';

class FiltersLabelConfiguration {
  final Map<String, dynamic> _configMap = {
    "pieceSizeLabelMapping": "null",
  };

  String get pieceSizeLabelMapping => _configMap["pieceSizeLabelMapping"];

  FiltersLabelConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
