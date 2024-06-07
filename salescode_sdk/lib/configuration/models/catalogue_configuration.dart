import 'configuration_ui.dart';

class CatalogueConfiguration {
  final Map<String, dynamic> _configMap = {
    "packUnitLabel": "null",
    "otherUnitLabel": "null",
    "caseUnitLabel": "null",
    "multiUOMSelection": "null",
    "unitLabel": "null",
    "mrpLabel": "null",
    "casePtrLabel": "null",
    "ptrLabel": "null",
    "packPtrLabel": "null",
    "suggestedQtyVisibility": "null",
    "orderSuggestedQty": "null",
    "autoUomConversion": "null",
    "defaultCatalogueImage": "null",
    "favouriteSKU": "null", // remove
    "skuCodeVisibility": "null",
    "skuCodeCondition": "null",
    "catalogueSortingType": "null", //catalogueSequencingType
    "ptrVisibility": "null",
    "pieceSizeVisibility": "null",
    "pieceSizeLabel": "null",
    "caseToPieceVisibility": "null",
    "caseToPieceLabel": "null",
    "multiVariantOrder": "null",
    "multiVariantHeader": "null",
    "multiVariantSortingOption": "null",
    "cacheCatalogueImage": "null", //remove
    "showScanButton": "null", //productScanOption
    "outletLevelPricing": "null",
    "productTypeFilter": "null",
    "showStrikedOffPrice": "null", // priceStrikedOffVisibility
    "showMarginPercentage": "null", //marginPercentageVisibility
    "showPriceIncludeTax": "null", // priceIncludedTaxVisibility
    "cataloguePrioritySorting": "null",
    "defaultUomMapping": "null",
    "catalogueSortingConfig": "null", //catalogueSortingOptions
    "maxAllowedDigitForOrder": "null",
    "orderUomCheck": "null",
    "enableDynamicPricingWithoutSlabs": "null",
    "tabFilterType": "button",
    "minPackPriceValidation": "null",
    "focPackUnitLabel": "null",
    "focCaseUnitLabel": "null",
    "sspLabel": "null",
    "displayProductValidationFilter": "null",
    "displayProductValidation": "null",
    "defaultQtyForOrder": "null",
    "backInStockBasketExpire": "null",
    "realTimeStockSync": "false",
    "priceFormatter": "null"
  };

  String get mrpLabel => _configMap["mrpLabel"];
  String get casePtrLabel => _configMap["casePtrLabel"];
  String get packUnitLabel => _configMap["packUnitLabel"];
  String get focPackUnitLabel => _configMap["focPackUnitLabel"];
  String get otherUnitLabel => _configMap["otherUnitLabel"];
  String get ptrLabel => _configMap["ptrLabel"];
  String get packPtrLabel => _configMap["packPtrLabel"];
  String get unitLabel => _configMap["unitLabel"];
  String get suggestedQtyVisibility => _configMap["suggestedQtyVisibility"];
  String get orderSuggestedQty => _configMap["orderSuggestedQty"];
  String get autoUomConversion => _configMap["autoUomConversion"];
  String get multiUOMSelection => _configMap["multiUOMSelection"];
  String get caseUnitLabel => _configMap["caseUnitLabel"];
  String get defaultCatalogueImage => _configMap["defaultCatalogueImage"];
  String get favouriteSKU => _configMap["favouriteSKU"];
  String get skuCodeVisibility => _configMap["skuCodeVisibility"];
  String get skuCodeCondition => _configMap["skuCodeCondition"];
  String get catalogueSortingType => _configMap["catalogueSortingType"];
  String get ptrVisibility => _configMap["ptrVisibility"];
  String get multiVariantSortingOption =>
      _configMap["multiVariantSortingOption"];
  String get pieceSizeVisibility => _configMap["pieceSizeVisibility"];
  String get pieceSizeLabel => _configMap["pieceSizeLabel"];
  String get caseToPieceVisibility => _configMap["caseToPieceVisibility"];
  String get caseToPieceLabel => _configMap["caseToPieceLabel"];
  String get multiVariantOrder => _configMap["multiVariantOrder"];
  String get multiVariantHeader => _configMap["multiVariantHeader"];
  String get cacheCatalogueImage => _configMap["cacheCatalogueImage"];
  String get showScanButton => _configMap["showScanButton"];
  String get outletLevelPricing => _configMap["outletLevelPricing"];
  String get productTypeFilter => _configMap["productTypeFilter"];
  String get showStrikedOffPrice => _configMap["showStrikedOffPrice"];
  String get showMarginPercentage => _configMap["showMarginPercentage"];
  String get showPriceIncludeTax => _configMap["showPriceIncludeTax"];
  String get cataloguePrioritySorting => _configMap["cataloguePrioritySorting"];
  String get defaultUomMapping => _configMap["defaultUomMapping"];
  String get catalogueSortingConfig => _configMap["catalogueSortingConfig"];
  String get maxAllowedDigitForOrder => _configMap["maxAllowedDigitForOrder"];
  String get orderUomCheck => _configMap["orderUomCheck"];
  String get enableDynamicPricingWithoutSlabs =>
      _configMap["enableDynamicPricingWithoutSlabs"];
  String get tabFilterType => _configMap["tabFilterType"];
  String get minPackPriceValidation => _configMap["minPackPriceValidation"];
  String get focCaseUnitLabel => _configMap["focCaseUnitLabel"];
  String get sspLabel => _configMap["sspLabel"];
  String get displayProductValidationFilter =>
      _configMap["displayProductValidationFilter"];
  String get displayProductValidation => _configMap["displayProductValidation"];
  String get defaultQtyForOrder => _configMap["defaultQtyForOrder"];
  String get backInStockBasketExpire => _configMap["backInStockBasketExpire"];
  String get realTimeStockSync => _configMap['realTimeStockSync'];
  String get priceFormatter => _configMap['priceFormatter'];

  CatalogueConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
