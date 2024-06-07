import 'configuration_ui.dart';

class AppConfiguration {
  final Map<String, dynamic> _configMap = {
    "clientLogo": "null",
    "clientHeaderLogo": "null",
    "appIcon": "null",
    "appName": "null",
    "clientLogoHeight": "null",
    "clientHeaderLogoHeight": "null",
    "faqCount": "null", // Need to remove
    "shareText": "null",
    "psLink": "null",
    "loginBanner": "null", // Need to remove
    "appbarBackgroundImage": "null",
    "appBarBackgroundType": "null",
    "solidAppBarColor": "null",
    "gradientAppBarColor": "null",
    "privacyPolicyValidation": "null",
    "loadingScreenText": "null",
    "loadingScreenTextList": "null",
    "loaderGIF": "null",
    "loadingBackgroundImage": "null",
    "ondcWebviewServiceUrl": "null", // move to ondc_configuration
    "ondcLoaderImage": "null", // move to ondc_configuration
    "ondcLoaderGif": "null", // move to ondc_configuration
    "ondcWebviewLaunchUrl": "null", // move to ondc_configuration
    "ondcWebLaunchUrl": "null", // move to ondc_configuration
    "kibanaConfig": "null", // Move to alert configuration
    "locationPopup": "null", // Move to feature configuration
    "showPromoTransaction": "null", // Need to remove
    "minimizePromoRedemptionJourney": "null",
    "addPromoOtpValidation": "null",
    "externalAppDeepLink": "null",
    "deepLinkUrl": "null",
    "appStoreLink": "appStoreLink",
    "consumerPromoOutletsFileUrl": "null",
    "tvAdsHeading": "null",
    "tvAdsSubheading": "null",
    "slackAlertChannel": "null", // Move to alert configuration
    "remoteOrderlinkMessage": "null",
    "remoteOrderlink": "null",
    "remoteOrderlinkAdditionalMessage": "null",
    "recoEngineUrl": "null",
    "callExternalApiForRecommendation": "null",
    "recoEngineOutletsFileUrl": "null",
    "storeInRange": "null",
    "retailerRegistrationTkp": "null", // Move to authentication
    "faqPdfUrl": "null",
    "moreScreenLogo": "null",
    "aboutScreenLogo": "null",
    "userTypeOption": "null", // Need to remove
    "enableSfaRedirection": "null",
    "dateFormat": "null"
};

  String get clientLogo => _configMap["clientLogo"];
  String get clientHeaderLogo => _configMap["clientHeaderLogo"];
  String get appIcon => _configMap["appIcon"];
  String get appName => _configMap["appName"];
  String get isAppOffline => _configMap["isAppOffline"];
  String get clientLogoHeight => _configMap["clientLogoHeight"];
  String get clientHeaderLogoHeight => _configMap["clientHeaderLogoHeight"];
  String get faqCount => _configMap["faqCount"];
  String get shareText => _configMap["shareText"];
  String get psLink => _configMap["psLink"];
  String get loginBanner => _configMap["loginBanner"];
  String get appbarBackgroundImage => _configMap["appbarBackgroundImage"];
  String get appBarBackgroundType => _configMap["appBarBackgroundType"];
  String get solidAppBarColor => _configMap["solidAppBarColor"];
  String get gradientAppBarColor => _configMap["gradientAppBarColor"];
  String get privacyPolicyValidation => _configMap["privacyPolicyValidation"];
  String get loadingScreenText => _configMap["loadingScreenText"];
  String get loadingScreenTextList => _configMap["loadingScreenTextList"];
  String get loaderGIF => _configMap["loaderGIF"];
  String get loadingBackgroundImage => _configMap["loadingBackgroundImage"];

  String get ondcWebviewServiceUrl => _configMap["ondcWebviewServiceUrl"];
  String get ondcLoaderImage => _configMap["ondcLoaderImage"];
  String get ondcLoaderGif => _configMap["ondcLoaderGif"];
  String get ondcWebviewLaunchUrl => _configMap["ondcWebviewLaunchUrl"];
  String get ondcWebLaunchUrl => _configMap["ondcWebLaunchUrl"];
  String get kibanaConfig => _configMap["kibanaConfig"];
  String get locationPopup => _configMap["locationPopup"];
  String get showPromoTransaction => _configMap["showPromoTransaction"];
  String get minimizePromoRedemptionJourney =>
      _configMap["minimizePromoRedemptionJourney"];
  String get addPromoOtpValidation => _configMap["addPromoOtpValidation"];
  String get externalAppDeepLink => _configMap["externalAppDeepLink"];
  String get deepLinkUrl => _configMap["deepLinkUrl"];
  String get appStoreLink => _configMap["appStoreLink"];
  String get consumerPromoOutletsFileUrl =>
      _configMap["consumerPromoOutletsFileUrl"];
  String get tvAdsHeading => _configMap["tvAdsHeading"];
  String get tvAdsSubheading => _configMap["tvAdsSubheading"];
  String get slackAlertChannel => _configMap["slackAlertChannel"];
  String get remoteOrderlink => _configMap["remoteOrderlink"];
  String get remoteOrderlinkAdditionalMessage =>
      _configMap["remoteOrderlinkAdditionalMessage"];
  String get remoteOrderlinkMessage => _configMap["remoteOrderlinkMessage"];
  String get recoEngineUrl => _configMap["recoEngineUrl"];
  String get callExternalApiForRecommendation =>
      _configMap["callExternalApiForRecommendation"];
  String get recoEngineOutletsFileUrl => _configMap["recoEngineOutletsFileUrl"];
  String get retailerRegistrationTkp => _configMap["retailerRegistrationTkp"];
  String get faqPdfUrl => _configMap["faqPdfUrl"];
  String get moreScreenLogo => _configMap["moreScreenLogo"];
  String get aboutScreenLogo => _configMap["aboutScreenLogo"];
  String get storeTypeOption => _configMap["storeTypeOption"];
  String get userTypeOption => _configMap["userTypeOption"];
  String get enableSfaRedirection => _configMap["enableSfaRedirection"];
  String get dateFormat => _configMap["dateFormat"];

  AppConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
