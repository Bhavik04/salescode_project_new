import 'configuration_ui.dart';

class OutletMappingConfiguration {
  final Map<String, dynamic> _configMap = {
    "outletMappingFormFiled": "null",
    "outletMappingChannelCode": "null",
    "outletMappingTabs": "null",
    "locationLoaderSource": "null",
  };

  String get outletMappingFormFiled => _configMap["outletMappingFormFiled"];
  String get outletMappingChannelCode => _configMap["outletMappingChannelCode"];
  String get outletMappingTabs => _configMap["outletMappingTabs"];
  String get locationLoaderSource => _configMap["locationLoaderSource"];

  OutletMappingConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
