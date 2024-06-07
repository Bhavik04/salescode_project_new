import 'configuration_ui.dart';

class ProfileScreenInstructionsConfiguration {
  final Map<String, dynamic> _configMap = {
    "sampleConfig": "one",
  };

  String get sampleConfig => _configMap["sampleConfig"];

  ProfileScreenInstructionsConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
