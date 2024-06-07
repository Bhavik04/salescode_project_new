import 'configuration_ui.dart';

class AppImagesConfiguration {
  final Map<String, dynamic> _configMap = {
    "recentlyPurchasedBgImage": "null",
    "upiUploadBannerImage": "null",
    "merchandisingBannerImage": "null",
    "consumerBannerImage": "null"
  };

  String get recentlyPurchasedBgImage => _configMap["recentlyPurchasedBgImage"];
  String get upiUploadBannerImage => _configMap["upiUploadBannerImage"];
  String get merchandisingBannerImage => _configMap["merchandisingBannerImage"];
  String get consumerBannerImage => _configMap["consumerBannerImage"];

  AppImagesConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
