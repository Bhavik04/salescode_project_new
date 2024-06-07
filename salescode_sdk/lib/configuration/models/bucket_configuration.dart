import 'configuration_ui.dart';

class BucketConfiguration {
  final Map<String, dynamic> _configMap = {
    "bucketConfiguration": "null",
  };

  String get bucketConfiguration => _configMap["bucketConfiguration"];

  BucketConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
