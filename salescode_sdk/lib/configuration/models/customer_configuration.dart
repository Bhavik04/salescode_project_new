import 'configuration_ui.dart';

class CustomerConfiguration {
  final Map<String, dynamic> _configMap = {
    "supportNumber": "null",
    "currencySymbol": "null",
    "currency": "null",
    "dialCode": "null",
    "privacyLink": "null",
    "tncLink": "null",
    "rewardsLink": "null"
  };

  String get supportNumber => _configMap["supportNumber"];
  String get currencySymbol => _configMap["currencySymbol"];
  String get currency => _configMap["currency"];
  String get dialCode => _configMap["dialCode"];
  String get privacyLink => _configMap["privacyLink"];
  String get tncLink => _configMap["tncLink"];
  String get rewardsLink => _configMap["rewardsLink"];

  CustomerConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
