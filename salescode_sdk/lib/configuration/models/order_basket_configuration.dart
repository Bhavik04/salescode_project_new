import 'configuration_ui.dart';

class OrderBasketConfiguration {
  final Map<String, dynamic> _configMap = {
    "orderBasketMapping": "null",
  };

  String get orderBasketMapping => _configMap["orderBasketMapping"];

  OrderBasketConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
