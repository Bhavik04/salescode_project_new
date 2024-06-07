import 'configuration_ui.dart';

class OrderReturnConfiguration {
  final Map<String, dynamic> _configMap = {
    "orderReturnFields": "null",
    "orderReturnReason": "null",
    "orderReturn": "null",
    "mrpRequired" : "null",
  };

  String get orderReturnFields => _configMap["orderReturnFields"];
  String get orderReturnReason => _configMap["orderReturnReason"];
  String get orderReturn => _configMap["orderReturn"];
  String get mrpRequired => _configMap["mrpRequired"];

  OrderReturnConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
