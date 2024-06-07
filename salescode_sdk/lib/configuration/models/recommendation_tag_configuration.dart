import 'configuration_ui.dart';

class RecommendationTagConfiguration {
  final Map<String, dynamic> _configMap = {
    "recommendation_tag_configuration": "null"
  };

  String get recommendationTagConfiguration =>
      _configMap["recommendation_tag_configuration"];

  RecommendationTagConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
