import 'configuration_ui.dart';

class LoyaltyPointsConfiguration {
  final Map<String, dynamic> _configMap = {
    "loyaltyBreakupList": "null",
    "loyaltyDashboardType": "null",
    "scoreVisibility": "null",
    "loyaltyDataPoints": "null",
    "loyaltyDashboardAuthorization": "null",
    "mergeLoyaltyPointsInCatalogue": "null"
  };

  String get loyaltyBreakupList => _configMap["loyaltyBreakupList"];
  String get loyaltyDashboardType => _configMap["loyaltyDashboardType"];
  String get scoreVisibility => _configMap["scoreVisibility"];
  String get loyaltyDataPoints => _configMap["loyaltyDataPoints"];
  String get loyaltyDashboardAuthorization =>
      _configMap["loyaltyDashboardAuthorization"];
  String get mergeLoyaltyPointsInCatalogue =>
      _configMap["mergeLoyaltyPointsInCatalogue"];

  LoyaltyPointsConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
