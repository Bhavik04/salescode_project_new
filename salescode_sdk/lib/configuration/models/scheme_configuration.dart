import 'configuration_ui.dart';

class SchemeConfiguration {
  final Map<String, dynamic> _configMap = {
    "schemesCalculationType": "null",
    "overnAboveCouponVisibility": "null",
    "schemeCriteriaFilters": "null",
    "checkLastOrderInCoupon": "null",
    "schemeVisibility": "null",
    "missedSchemeVisibility": "null",
    "couponVisibility": "null",
    "uniqueSchemeVisibility": "null",
    "uptoSchemeAmountThreshhold": "null",
    "uptoSchemeItemThreshhold": "null",
    "uptoSchemePercentThreshhold": "null",
    "customSchemeDescriptionVisibility": "null",
    "uptoSchemeVisibility": "null",
    "showViewAllForSchemes":
        "null", //NA- it will be based on slab configuration only
    "viewSchemeCount": "null", //NA- it will show to all clients
    "schemeDisclaimers": "null",
    "hideOffersCountInViewAllTile": "null", //NA- it will show to all clients
    "schemeCalculation": "null",
    "groupbyschemes": "null", //TBD
    "schemeWithSequence": "null", //TBD
    "schemeSlabVisibility": "null",
    "mustBuyValidation": "null",
    "couponPrimaryColor": "null",
    "couponGradientColor": "null",
    "couponBgColor": "null",
    "couponFilterVisibility": "null",
    "dummyCouponImage": "null",
    "dummyItemCouponImage": "null",
    "bundleCouponVisibility": "null",
    "showMissedSchemePopUp": "null",
    "schemeDisplayCheck": "null",
    "offersTabVisibility": "null",
    "offersTabLabel": "null",
    "discountRuleList": "null",
    "filterSchemesBasedOnUsage": "null",
    "hideUsageLimit":  "null",
    "showFocSelection":"null"
  };

  String get overnAboveCouponVisibility =>
      _configMap["overnAboveCouponVisibility"];
  String get schemeCriteriaFilters => _configMap["schemeCriteriaFilters"];
  // main config which decides the flow of offers (unnati or hccb types)
  String get schemesCalculationType => _configMap["schemesCalculationType"];
  String get checkLastOrderInCoupon => _configMap["checkLastOrderInCoupon"];
  String get schemeVisibility => _configMap["schemeVisibility"];
  String get missedSchemeVisibility => _configMap["missedSchemeVisibility"];
  String get couponVisibility => _configMap["couponVisibility"];
  String get uniqueSchemeVisibility => _configMap["uniqueSchemeVisibility"];
  String get uptoSchemeAmountThreshhold =>
      _configMap["uptoSchemeAmountThreshhold"];
  String get uptoSchemeItemThreshhold => _configMap["uptoSchemeItemThreshhold"];
  String get uptoSchemePercentThreshhold =>
      _configMap["uptoSchemePercentThreshhold"];
  String get customSchemeDescriptionVisibility =>
      _configMap["customSchemeDescriptionVisibility"];
  String get uptoSchemeVisibility => _configMap["uptoSchemeVisibility"];
  String get showViewAllForSchemes => _configMap["showViewAllForSchemes"];
  String get viewSchemeCount => _configMap["viewSchemeCount"];
  String get schemeDisclaimers => _configMap["schemeDisclaimers"];
  String get hideOffersCountInViewAllTile =>
      _configMap["hideOffersCountInViewAllTile"];
  String get schemeCalculation => _configMap["schemeCalculation"];
  String get groupbyschemes => _configMap["groupbyschemes"];
  String get schemeWithSequence => _configMap["schemeWithSequence"];
  String get schemeSlabVisibility => _configMap["schemeSlabVisibility"];
  String get mustBuyValidation => _configMap["mustBuyValidation"];
  String get couponPrimaryColor => _configMap["couponPrimaryColor"];
  String get couponGradientColor => _configMap["couponGradientColor"];
  String get couponBgColor => _configMap["couponBgColor"];
  String get couponFilterVisibility => _configMap["couponFilterVisibility"];
  String get dummyCouponImage => _configMap["dummyCouponImage"];
  String get dummyItemCouponImage => _configMap["dummyItemCouponImage"];
  String get bundleCouponVisibility => _configMap["bundleCouponVisibility"];
  String get showMissedSchemePopUp => _configMap["showMissedSchemePopUp"];
  String get schemeDisplayCheck => _configMap["schemeDisplayCheck"];
  String get offersTabVisibility => _configMap["offersTabVisibility"];
  String get offersTabLabel => _configMap["offersTabLabel"];
  String get discountRuleList => _configMap["discountRuleList"];
  String get filterSchemesBasedOnUsage =>
      _configMap["filterSchemesBasedOnUsage"];
  String get hideUsageLimit =>
      _configMap["hideUsageLimit"];
  String get showFocSelection => _configMap["showFocSelection"];

  SchemeConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
