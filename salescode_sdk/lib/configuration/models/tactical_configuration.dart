import 'configuration_ui.dart';

class TacticalPromotionConfiguration {
  final Map<String, dynamic> _configMap = {
    "tacticalPromotionName": "null",
  };


  String get tacticalPromotionName => _configMap["tacticalPromotionName"];

  TacticalPromotionConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
