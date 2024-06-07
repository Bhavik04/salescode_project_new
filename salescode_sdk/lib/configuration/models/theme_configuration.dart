import 'configuration_ui.dart';

class ThemeConfiguration {
  final Map<String, dynamic> _configMap = {
    "themeColor": "null",
    "themeDisabledButtonColor": "null",
  };

  String get themeColor => _configMap["themeColor"];
  String get themeDisabledButtonColor => _configMap["themeDisabledButtonColor"];

  ThemeConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
