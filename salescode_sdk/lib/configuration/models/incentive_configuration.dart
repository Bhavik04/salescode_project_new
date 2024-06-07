import 'configuration_ui.dart';

class IncentiveConfiguration {
  final Map<String, dynamic> _configMap = {
    "incentiveFaq": "null",
    "incentiveLiveUpdate": "null",
    "leaderboardDesignation": "null",
    "ruleMapping": "[]",
    "incentiveTabConfig" : "null"
  };

  String get incentiveLiveUpdate => _configMap["incentiveLiveUpdate"];
  String get incentiveFaq => _configMap["incentiveFaq"];
  String get leaderboardDesignation => _configMap["leaderboardDesignation"];
  String get ruleMapping => _configMap["ruleMapping"];
  String get incentiveTabConfig => _configMap["incentiveTabConfig"];

  IncentiveConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
