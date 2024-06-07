import 'configuration_ui.dart';

class AppLayoutConfiguration {
  final Map<String, dynamic> _configMap = {
    "morePageWidget": "null",
    "outletActivityTabs": "null",
    "orderScreenTabWidget": "null",
    "bottomBarLayout": "null",
    "visitSummaryLayout": "null",
    "outletTileOptions": "null",
    "homePageWidget": "null",
    "searchScreenWidget": "null",
    "outletOnboardingWidget": "null",
    "outletScreenTabWidget": "null",
    "homePageBlockWidget": "null",
    "homeScreenBlockWidget": "null"
  };

  String get morePageWidget => _configMap["morePageWidget"];
  String get orderScreenTabWidget => _configMap["orderScreenTabWidget"];
  String get homePageWidget => _configMap["homePageWidget"];
  String get outletActivityTabs => _configMap["outletActivityTabs"];
  String get bottomBarLayout => _configMap["bottomBarLayout"];
  String get visitSummaryLayout => _configMap["visitSummaryLayout"];
  String get outletTileOptions => _configMap["outletTileOptions"];
  String get searchScreenWidget => _configMap["searchScreenWidget"];
  String get outletOnboardingWidget => _configMap["outletOnboardingWidget"];
  String get outletScreenTabWidget => _configMap["outletScreenTabWidget"];
  String get homePageBlockWidget => _configMap["homePageBlockWidget"];
  String get homeScreenBlockWidget => _configMap["homeScreenBlockWidget"];

  AppLayoutConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
