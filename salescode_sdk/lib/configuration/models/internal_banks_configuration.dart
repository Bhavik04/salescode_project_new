import 'configuration_ui.dart';

class InternalBanksConfiguration {
  final Map<String, dynamic> _configMap = {
    "sbiOtpImage": "null",
    "sbiOtpNotes": "null",
    "sbiOtpTimer": "null",
    "creditInfoPopup": "null",
    "transactionNote": "null",
    "bankListForPayment": "null",
    "bankEnrollmentSectionHeader": "null",
    "bankPolicyFiles": "null",
    "bankOnboardingConsentDisclaimer": "null",
    "onboardingStateSelect": "null",
    "vintageKeys": "null",
    "onboardingButtonTextConfiguration": "null",
    "axisPaymentInProgressConfigurations": "null",
    "sbiRedirectionUrl": "null",
    "upiPaymentInProgressConfigurations": "null",
    "finaggNumberChangedPopupText": "null",
    "finaggValidatePanPopupText": "null",
    "bankEnrollementODLabel": "null",
    "upiIntegration": "null",
    "upiOptionLabel": "null",
  };

  String get sampleConfig => _configMap["sampleConfig"];
  String get sbiOtpImage => _configMap["sbiOtpImage"];
  String get sbiOtpNotes => _configMap["sbiOtpNotes"];
  String get sbiOtpTimer => _configMap["sbiOtpTimer"];
  String get creditInfoPopup => _configMap["creditInfoPopup"];
  String get transactionNote => _configMap["transactionNote"];
  String get bankListForPayment => _configMap["bankListForPayment"];
  String get bankEnrollmentSectionHeader =>
      _configMap["bankEnrollmentSectionHeader"];
  String get bankPolicyFiles => _configMap["bankPolicyFiles"];
  String get bankOnboardingConsentDisclaimer =>
      _configMap["bankOnboardingConsentDisclaimer"];
  String get onboardingStateSelect => _configMap["onboardingStateSelect"];
  String get vintageKeys => _configMap["vintageKeys"];
  String get onboardingButtonTextConfiguration =>
      _configMap["onboardingButtonTextConfiguration"];
  String get axisPaymentInProgressConfigurations =>
      _configMap["axisPaymentInProgressConfigurations"];
  String get sbiRedirectionUrl => _configMap["sbiRedirectionUrl"];
  String get upiPaymentInProgressConfigurations =>
      _configMap["upiPaymentInProgressConfigurations"];
  String get finaggNumberChangedPopupText =>
      _configMap["finaggNumberChangedPopupText"];
  String get finaggValidatePanPopupText =>
      _configMap["finaggValidatePanPopupText"];
  String get bankEnrollementODLabel => _configMap["bankEnrollementODLabel"];
  String get upiIntegration => _configMap["upiIntegration"];
  String get upiOptionLabel => _configMap["upiOptionLabel"];

  InternalBanksConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
