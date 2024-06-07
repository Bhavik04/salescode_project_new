import 'configuration_ui.dart';

class MultiLingualConfiguration {
  final Map<String, dynamic> _configMap = {
    "defaultLanguage": "defaultLanguage",
    "supportedLanguages": "supportedLanguages"
  };

  String get defaultLanguage => _configMap["defaultLanguage"];
  String get supportedLanguages => _configMap["supportedLanguages"];

  MultiLingualConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
