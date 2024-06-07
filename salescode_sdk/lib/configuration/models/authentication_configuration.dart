import 'configuration_ui.dart';

class AuthenticationConfiguration {
  final Map<String, dynamic> _configMap = {
    "termsChecked": "null",
    "twoFactor": "null",
    "loginType": "null",
    "outletLoginHintText": "null",
    "phoneLoginHintText": "null",
    "phoneNumberMaximumLength": "null",
    "phoneNumberMinimumLength": "null",
    "phoneLoginHeadingText": "null",
    "instantRegistration": "null",
    "newRetailerRegistration": "null",
    "autoRegister": "null",
    "deviceUID": "null",
    "otpType": "null",
    "otpTimer": "null",
    "otpLength": "6",
    "otpProvider": "null",
    "otpDisclaimer": "null",
    "subHeading": "null",
    "loginBanners": "null"
  };

  String get termsChecked => _configMap["termsChecked"];
  String get twoFactor => _configMap["twoFactor"];
  String get loginType => _configMap["loginType"];
  String get outletLoginHintText => _configMap["outletLoginHintText"];
  String get phoneLoginHintText => _configMap["phoneLoginHintText"];
  String get phoneNumberMaximumLength => _configMap["phoneNumberMaximumLength"];
  String get phoneNumberMinimumLength => _configMap["phoneNumberMinimumLength"];
  String get phoneLoginHeadingText => _configMap["phoneLoginHeadingText"];
  String get instantRegistration => _configMap["instantRegistration"];
  String get autoRegister => _configMap["autoRegister"];
  String get deviceUID => _configMap["deviceUID"];
  String get otpType => _configMap["otpType"];
  String get otpTimer => _configMap["otpTimer"];
  String get otpLength => _configMap["otpLength"];
  String get otpProvider => _configMap["otpProvider"];
  String get otpDisclaimer => _configMap["otpDisclaimer"];
  String get subHeading => _configMap["subHeading"];
  String get loginBanners => _configMap["loginBanners"];
  String get newRetailerRegistration => _configMap["newRetailerRegistration"];

  AuthenticationConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
