import 'configuration_ui.dart';

class ErrorLoggerConfiguration {
  final Map<String, dynamic> _configMap = {
    "errorEnums": "null",
    "errorLogServiceFilter": "null",
    "unhanldedErrorOmissionList": "null",
    "kibanaConfig": "null"
  };

  String get errorEnums => _configMap["errorEnums"];
  String get errorLogServiceFilter => _configMap["errorLogServiceFilter"];
  String get unhanldedErrorOmissionList =>
      _configMap["unhanldedErrorOmissionList"];
  String get kibanaConfig => _configMap["kibanaConfig"];

  ErrorLoggerConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
