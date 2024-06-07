import 'configuration_ui.dart';

class InvoiceConfiguration {
  final Map<String, dynamic> _configMap = {
    "invoiceSourceVisibility": "null",
    "invoiceFilterVisibility": "null",
    "distributorEnable": "null",
    "paymentEnable": "null",
    "transactionAndCreditApiEnable": "null",
    "invoiceSourceFilter": "null"
  };

  String get invoiceSourceVisibility => _configMap["invoiceSourceVisibility"];
  String get invoiceFilterVisibility => _configMap["invoiceFilterVisibility"];
  String get distributorEnable => _configMap["distributorEnable"];
  String get paymentEnable => _configMap["paymentEnable"];
  String get transactionAndCreditApiEnable =>
      _configMap["transactionAndCreditApiEnable"];
  String get invoiceSourceFilter => _configMap["invoiceSourceFilter"];

  InvoiceConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
