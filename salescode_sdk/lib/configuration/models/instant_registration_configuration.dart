import 'configuration_ui.dart';

class InstantRegistrationConfiguration {
  final Map<String, dynamic> _configMap = {
    "uidAddressText": "null",
    "displaySampleBill": "null",
    "sampleInvoice": "null",

  };

  String get uidAddressText => _configMap["uidAddressText"];
  String get displaySampleBill => _configMap["displaySampleBill"];
  String get sampleInvoice => _configMap["sampleInvoice"];


  InstantRegistrationConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
