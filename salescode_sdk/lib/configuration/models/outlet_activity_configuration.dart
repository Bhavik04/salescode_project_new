import 'configuration_ui.dart';

class OutletActivityConfiguration {
  final Map<String, dynamic> _configMap = {
    "storeInRange": "null",
    "filterStockistOutlets": "null"
  };
 

  String get storeInRange => _configMap["storeInRange"];
  String get filterStockistOutlets => _configMap["filterStockistOutlets"];

  OutletActivityConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
