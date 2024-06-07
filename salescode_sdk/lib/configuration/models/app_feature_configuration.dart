import 'configuration_ui.dart';

class AppFeatureConfiguration {
  final Map<String, dynamic> _configMap = {
    "featureConfig": "null",
    "dummyWhatsappPhoneNumber" : "null"
    };


  String get featureConfig => _configMap["featureConfig"];
  String get dummyWhatsappPhoneNumber => _configMap["dummyWhatsappPhoneNumber"];

  AppFeatureConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
