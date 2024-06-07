import 'configuration_ui.dart';

class ExportOrderConfiguration {
  final Map<String, dynamic> _configMap = {
    "createOrderFile": "null",
    "orderFileType": "null",
    "orderFileNameFormat": "null",
    "orderFileDataKeys": "null",
    "orderFileLocation": "null"
  };

  String get createOrderFile => _configMap["createOrderFile"];
  String get orderFileType => _configMap["orderFileType"];
  String get orderFileNameFormat => _configMap["orderFileNameFormat"];
  String get orderFileDataKeys => _configMap["orderFileDataKeys"];
  String get orderFileLocation => _configMap["orderFileLocation"];

  ExportOrderConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
