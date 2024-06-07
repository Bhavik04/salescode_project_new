import 'configuration_ui.dart';

class OrderConfiguration {
  final Map<String, dynamic> _configMap = {
    //order configuration
    "defaultOrderUOM": "null",
    "orderCalculationType": 'value',
    "taxVisibility": "null",
    "mustDoActionL7Visibility": "true", // need to remove
    "orderCancellation": 'null',
    "orderCancellationPeriod": "null",
    "cancelOrderInOrdertracking": "null",
    "orderCancellationReasons": "null",
    "orderCancellationDisclaimer": "null",
    "orderCancellationSummaryDisclaimer": "null",
    "enableDynamicPrices": "null",
    "stockVisibility": "null",
    "showExternalRecommendations": "null",
    "avoidRecommendationMerging": "null",
    "buyInSets": "null",
    "pricingApi": "null",
    "toUseStockFilterInProductsApi": "null",
    "toUseSupplierFilterInProductsApi": "null",
    //cart configuration
    "missedItemBasket": 'null',
    "minOrderValidation": "null",
    "minOrderType": "null",
    "minOrder": "null",
    "minOrderVisibility": "null",
    "orderFulfillmentTime": 'null',
    "orderFulfillmentTimeMessage": 'null',
    "fullFilledByLabel": 'null',
    "isDeliveryDropdownVisible": 'null',
    "deliveryDateApi": 'null',
    //order checkout configuration
    "retailerMarginVisibility": 'true',
    "orderSummaryDisclaimer": 'null',
    "showSupplierDropdown": "null",
    "orderTncVisibility": 'null',
    "orderTncLink": 'null',
    "distributorVisibility": 'null',
    "orderRemarksVisibility": 'null',
    "orderDSIdVisibility": 'null',
    "orderCheckoutUnitLabel": "null",
    "orderCheckoutPtrLabel": "null",
    "orderCheckoutPackUnitLabel": "null",
    "orderCheckoutCaseUnitLabel": "null",
    "shipmentAddressVisibility": "null",
    "orderCheckoutTotalAmountLabel": "null",
    "orderCheckoutFinalAmountLabel": "null",
    "orderCheckoutDefaultUnitLabel": "null",
    "showFreeProductLabel": "null",
    "showRedeemProductLabel": "null",
    "orderSubmitButtonLabel": 'SUBMIT',
    "orderConfirmationPopup": "null",
    "locationPopupOnOrder": 'null',
    "shipmentOptionsVisibility": "null",
    //order confirmation screen popup
    "orderIssues": 'null',
    "orderFeedback": 'null',
    "orderInvoiceDisclaimer": 'null',
    //order tracking
    "billingInformationVisibility": "null",
    "orderTrackingStages": "null",
    "orderSourceVisibility": "null",
    "orderSourceMapping": "null",
    "editOrderTimeValidation": "null",
    "editOrderTimeRange": "null",
    "normalisedQtyVisibility": "null",
    "reOrder": "null",
    "editOrder": "null",
    "rejectOrder": "null",
    "orderTrackingDefaultRange": "null",
    "syncAllButtonVisibility": "null",
    "deleteOrder": "null",
    "orderNotReceivedReasons": "null",
    "orderTrackingInvoiceTabVisibility": "null",
    "sendOrderSummaryToWhatsapp": "null",
    "getOrderApiTransformer": "null"
  };

  String get defaultOrderUOM => _configMap["defaultOrderUOM"];
  String get orderCalculationType => _configMap["orderCalculationType"];
  String get taxVisibility => _configMap["taxVisibility"];
  String get mustDoActionL7Visibility => _configMap["mustDoActionL7Visibility"];
  String get orderCancellation => _configMap["orderCancellation"];
  String get cancelOrderInOrdertracking =>
      _configMap["cancelOrderInOrdertracking"];
  String get orderCancellationPeriod => _configMap["orderCancellationPeriod"];
  String get orderCancellationReasons => _configMap["orderCancellationReasons"];
  String get orderCancellationDisclaimer =>
      _configMap["orderCancellationDisclaimer"];
  String get orderCancellationSummaryDisclaimer =>
      _configMap["orderCancellationSummaryDisclaimer"];
  String get enableDynamicPrices => _configMap["enableDynamicPrices"];
  String get stockVisibility => _configMap["stockVisibility"];
  String get showExternalRecommendations =>
      _configMap["showExternalRecommendations"];
  String get avoidRecommendationMerging =>
      _configMap["avoidRecommendationMerging"];
  String get buyInSets => _configMap["buyInSets"];
  String get missedItemBasket => _configMap["missedItemBasket"];
  String get minOrderValidation => _configMap["minOrderValidation"];
  String get minOrderType => _configMap["minOrderType"];
  String get minOrder => _configMap["minOrder"];
  String get minOrderVisibility => _configMap["minOrderVisibility"];
  String get orderFulfillmentTime => _configMap["orderFulfillmentTime"];
  String get orderFulfillmentTimeMessage =>
      _configMap["orderFulfillmentTimeMessage"];
  String get fullFilledByLabel => _configMap["fullFilledByLabel"];
  String get isDeliveryDropdownVisible =>
      _configMap["isDeliveryDropdownVisible"];
  String get deliveryDateApi => _configMap["deliveryDateApi"];
  String get retailerMarginVisibility => _configMap["retailerMarginVisibility"];
  String get orderSummaryDisclaimer => _configMap["orderSummaryDisclaimer"];
  String get orderTncVisibility => _configMap["orderTncVisibility"];
  String get orderTncLink => _configMap["orderTncLink"];
  String get distributorVisibility => _configMap["distributorVisibility"];
  String get orderRemarksVisibility => _configMap["orderRemarksVisibility"];
  String get orderDSIdVisibility => _configMap["orderDSIdVisibility"];
  String get orderCheckoutUnitLabel => _configMap["orderCheckoutUnitLabel"];
  String get orderCheckoutPtrLabel => _configMap["orderCheckoutPtrLabel"];
  String get orderCheckoutTotalAmountLabel =>
      _configMap["orderCheckoutTotalAmountLabel"];
  String get orderCheckoutFinalAmountLabel =>
      _configMap["orderCheckoutFinalAmountLabel"];
  String get showSupplierDropdown => _configMap["showSupplierDropdown"];
  String get orderCheckoutDefaultUnitLabel =>
      _configMap["orderCheckoutDefaultUnitLabel"];
  String get showFreeProductLabel => _configMap["showFreeProductLabel"];
  String get showRedeemProductLabel => _configMap["showRedeemProductLabel"];
  String get orderSubmitButtonLabel => _configMap["orderSubmitButtonLabel"];
  String get orderConfirmationPopup => _configMap["orderConfirmationPopup"];
  String get locationPopupOnOrder => _configMap["locationPopupOnOrder"];
  String get orderIssues => _configMap["orderIssues"];
  String get orderFeedback => _configMap["orderFeedback"];
  String get orderInvoiceDisclaimer => _configMap["orderInvoiceDisclaimer"];
  String get billingInformationVisibility =>
      _configMap["billingInformationVisibility"];
  String get orderTrackingStages => _configMap["orderTrackingStages"];
  String get orderSourceVisibility => _configMap["orderSourceVisibility"];
  String get orderSourceMapping => _configMap["orderSourceMapping"];
  String get editOrderTimeValidation => _configMap["editOrderTimeValidation"];
  String get editOrderTimeRange => _configMap["editOrderTimeRange"];
  String get normalisedQtyVisibility => _configMap["normalisedQtyVisibility"];
  String get reOrder => _configMap["reOrder"];
  String get editOrder => _configMap["editOrder"];
  String get rejectOrder => _configMap["rejectOrder"];
  String get deleteOrder => _configMap["deleteOrder"];
  String get orderTrackingDefaultRange =>
      _configMap["orderTrackingDefaultRange"];
  String get syncAllButtonVisibility => _configMap["syncAllButtonVisibility"];
  String get orderCheckoutCaseUnitLabel =>
      _configMap["orderCheckoutCaseUnitLabel"];
  String get orderCheckoutPackUnitLabel =>
      _configMap["orderCheckoutPackUnitLabel"];
  String get shipmentAddressVisibility =>
      _configMap["shipmentAddressVisibility"];
  String get orderNotReceivedReasons => _configMap["orderNotReceivedReasons"];
  String get pricingApi => _configMap["pricingApi"];
  String get toUseStockFilterInProductsApi =>
      _configMap["toUseStockFilterInProductsApi"];
  String get toUseSupplierFilterInProductsApi =>
      _configMap["toUseSupplierFilterInProductsApi"];
  String get orderTrackingInvoiceTabVisibility =>
      _configMap["orderTrackingInvoiceTabVisibility"];
  String get shipmentOptionsVisibility =>
      _configMap["shipmentOptionsVisibility"];
  String get sendOrderSummaryToWhatsapp =>
      _configMap["sendOrderSummaryToWhatsapp"];
  String get getOrderApiTransformer => _configMap["getOrderApiTransformer"];

  OrderConfiguration(List<ConfigurationUI> configList) {
    for (ConfigurationUI config in configList) {
      if (_configMap.containsKey(config.name)) {
        _configMap[config.name] = config.value;
      }
    }
  }
}
