import 'configuration_ui.dart';

class StoreInventoryConfiguration {
  final Map<String, dynamic> _configMap = {
    "inventoryTransactionVisibility" : "null",
    "copyCardData" : "null"
  };

  String get inventoryTransactionVisibility => _configMap["inventoryTransactionVisibility"];
  String get copyCardData => _configMap["copyCardData"];
  

  StoreInventoryConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
