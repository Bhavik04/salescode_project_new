import 'configuration_ui.dart';

class IncentiveBasketDashboardConfiguration {
  final Map<String, dynamic> _configMap = {
    "incentiveDashboardAuthorization": "null",
    "mappedBasket": "null",
    "mappedRecommendation": "null"
  };

  String get incentiveDashboardAuthorization =>
      _configMap["incentiveDashboardAuthorization"];
  String get mappedBasket => _configMap["mappedBasket"];
  String get mappedRecommendation => _configMap["mappedRecommendation"];

  IncentiveBasketDashboardConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
