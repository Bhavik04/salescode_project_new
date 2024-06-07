import 'models/app_options_configuration.dart';
import 'models/analytics_config.dart';
import 'models/app_configuration.dart';
import 'models/app_feature_configuration.dart';
import 'models/app_layout_configuration.dart';
import 'models/authentication_configuration.dart';
import 'models/bucket_configuration.dart';
import 'models/catalogue_configuration.dart';
import 'models/configuration_ui.dart';
import 'models/customer_configuration.dart';
import 'models/error_logger_configuration.dart';
import 'models/export_order_configuration.dart';
import 'models/filters_label_configuration.dart';
import 'models/incentive_basket_dashboard_configuration.dart';
import 'models/incentive_configuration.dart';
import 'models/instant_registration_configuration.dart';
import 'models/internal_banks_configuration.dart';
import 'models/invoice_configuration.dart';
import 'models/kpi_configuration.dart';
import 'models/loyalty_points_configuration.dart';
import 'models/multi_lingual_configuration.dart';
import 'models/must_do_action_configuration.dart';
import 'models/order_basket_configuration.dart';
import 'models/order_configuration.dart';
import 'models/outlet_activity_configuration.dart';
import 'models/outlet_mapping_config.dart';
import 'models/profile_screen_instructions.dart';
import 'models/order_return_configuration.dart';
import 'models/psrpm_configuration.dart';
import 'models/app_images_configuration.dart';
import 'models/recommendation_tag_configuration.dart';
import 'models/scheme_configuration.dart';
import 'models/store_inventory_configuration.dart';
import 'models/tab_filters.dart';
import 'models/tactical_configuration.dart';
import 'models/target_configurations.dart';
import 'models/target_dashboard_configuration.dart';
import 'models/theme_configuration.dart';
import 'models/upgrader_config.dart';

class ConfigurationDictionary {
  static AppConfiguration appConfiguration = AppConfiguration([]);
  static OrderConfiguration orderConfiguration = OrderConfiguration([]);
  static ThemeConfiguration themeConfiguration = ThemeConfiguration([]);
  static CatalogueConfiguration catalogueConfiguration =
      CatalogueConfiguration([]);
  static late CustomerConfiguration customerConfiguration;
  static late InternalBanksConfiguration internalBanksConfiguration;
  static AuthenticationConfiguration authenticationConfiguration =
      AuthenticationConfiguration([]);
  static late LoyaltyPointsConfiguration loyaltyPointsConfiguration;
  static late TabFiltersConfiguration tabFiltersConfiguration;
  static late OrderBasketConfiguration orderBasketConfiguration =
      OrderBasketConfiguration([]);
  static late BucketConfiguration bucketConfiguration;
  static late ProfileScreenInstructionsConfiguration
      profileScreenInstructionsConfiguration;
  static late UpgraderConfiguration upgraderConfiguration;
  static late FiltersLabelConfiguration filtersLabelConfiguration;
  static late InstantRegistrationConfiguration instantRegistrationConfiguration;
  static late ExportOrderConfiguration exportOrderConfiguration;
  static late MultiLingualConfiguration multiLingualConfiguration;
  static late AnalyticsConfiguration analyticsConfiguration;
  static late SchemeConfiguration schemeConfiguration;
  static late MustDoActionConfiguration mustDoActionConfiguration;
  static late KpiConfiguration kpiConfiguration;
  static late AppLayoutConfiguration appLayoutConfiguration;
  static late AppFeatureConfiguration appFeatureConfiguration;
  static late OrderReturnConfiguration orderReturnConfiguration;
  static late TacticalPromotionConfiguration tacticalPromotionConfiguration;
  static late OutletMappingConfiguration outletMappingConfiguration;
  static ErrorLoggerConfiguration errorLoggerConfiguration =
      ErrorLoggerConfiguration([]);
  static late IncentiveConfiguration incentiveConfiguration;
  static late TargetConfiguration targetConfiguration;
  static late AppOptionsConfiguration appOptionsConfiguration;
  static late RecommendationTagConfiguration recommendationTagConfiguration;
  static late StoreInventoryConfiguration storeInventoryConfiguration;
  static late InvoiceConfiguration invoiceConfiguration;
  static late OutletActivityConfiguration outletActivityConfiguration;
  static late TargetDashboardConfiguration targetDashboardConfiguration;
  static late IncentiveBasketDashboardConfiguration
      incentiveBasketConfiguration;
  static late PsrpmConfiguration psrPmConfiguration;
  static late AppImagesConfiguration appImagesConfiguration;

  static void init(List<ConfigurationUI> configList) {
    Map<String, List<ConfigurationUI>> configurations = {
      "app_configuration": [],
      "order_configuration": [],
      "theme_configuration": [],
      "catalogue_configuration": [],
      "customer_configuration": [],
      "internal_banks_configuration": [],
      "authentication_configuration": [],
      "loyalty_points_configuration": [],
      "tab_filters": [],
      "order_basket_configuration": [],
      "target_achieved_configurations": [],
      "focus_basket_dashboard_configuration": [],
      "bucket_configuration": [],
      "profile_screen_instructions": [],
      "upgrader_config": [],
      "filters_label_configuration": [],
      "multiprincipleLob": [],
      "instant_registration_configuration": [],
      "export_order_configuration": [],
      "multi_lingual_configuration": [],
      "analytics_config": [],
      "scheme_configuration": [],
      "must_do_action_configuration": [],
      "app_link_sharing_config": [],
      "kpi_configuration": [],
      "service_expiry_configuration": [],
      "app_layout_configuration": [],
      "app_feature_configuration": [],
      "order_return_configuration": [],
      'tacticalConfig': [],
      "outlet_mapping": [],
      "error_logger_configuration": [],
      "incentive_configuration": [],
      "target_configuration": [],
      "app_options_configuration": [],
      "recommendation_tag_configuration": [],
      "retailer_registration_configuration": [],
      "store_inventory_configuration": [],
      "invoice_configuration": [],
      "outlet_activity_configuration": [],
      "psrpm_configuration": [],
      'app_images_configuration':[]
    };

    for (ConfigurationUI config in configList) {
      if (configurations.containsKey(config.feature)) {
        configurations[config.feature]!.add(config);
      }
      if (config.feature.contains('app_layout_configuration')) {
        configurations["app_layout_configuration"]!.add(config);
      } else if (config.feature.contains('app_feature_configuration')) {
        configurations["app_feature_configuration"]!.add(config);
      } else if (config.feature.contains("app_options_configuration")) {
        configurations["app_options_configuration"]!.add(config);
      }
    }

    // Initialize each configuration based on its feature name
    appConfiguration =
        AppConfiguration(configurations["app_configuration"] ?? []);
    orderConfiguration =
        OrderConfiguration(configurations["order_configuration"] ?? []);
    themeConfiguration =
        ThemeConfiguration(configurations["theme_configuration"] ?? []);
    catalogueConfiguration =
        CatalogueConfiguration(configurations["catalogue_configuration"] ?? []);
    customerConfiguration =
        CustomerConfiguration(configurations["customer_configuration"] ?? []);
    internalBanksConfiguration = InternalBanksConfiguration(
        configurations["internal_banks_configuration"] ?? []);
    authenticationConfiguration = AuthenticationConfiguration(
        configurations["authentication_configuration"] ?? []);
    loyaltyPointsConfiguration = LoyaltyPointsConfiguration(
        configurations["loyalty_points_configuration"] ?? []);
    tabFiltersConfiguration =
        TabFiltersConfiguration(configurations["tab_filters"] ?? []);
    orderBasketConfiguration = OrderBasketConfiguration(
        configurations["order_basket_configuration"] ?? []);
    bucketConfiguration =
        BucketConfiguration(configurations["bucket_configuration"] ?? []);
    profileScreenInstructionsConfiguration =
        ProfileScreenInstructionsConfiguration(
            configurations["profile_screen_instructions"] ?? []);
    upgraderConfiguration =
        UpgraderConfiguration(configurations["upgrader_config"] ?? []);
    filtersLabelConfiguration = FiltersLabelConfiguration(
        configurations["filters_label_configuration"] ?? []);
    instantRegistrationConfiguration = InstantRegistrationConfiguration(
        configurations["instant_registration_configuration"] ?? []);
    exportOrderConfiguration = ExportOrderConfiguration(
        configurations["export_order_configuration"] ?? []);
    multiLingualConfiguration = MultiLingualConfiguration(
        configurations["multi_lingual_configuration"] ?? []);
    analyticsConfiguration =
        AnalyticsConfiguration(configurations["analytics_config"] ?? []);
    schemeConfiguration =
        SchemeConfiguration(configurations["scheme_configuration"] ?? []);
    mustDoActionConfiguration = MustDoActionConfiguration(
        configurations["must_do_action_configuration"] ?? []);
    kpiConfiguration =
        KpiConfiguration(configurations["kpi_configuration"] ?? []);
    appLayoutConfiguration = AppLayoutConfiguration(
        configurations['app_layout_configuration'] ?? []);
    appFeatureConfiguration = AppFeatureConfiguration(
        configurations['app_feature_configuration'] ?? []);
    errorLoggerConfiguration = ErrorLoggerConfiguration(
        configurations['error_logger_configuration'] ?? []);
    orderReturnConfiguration = OrderReturnConfiguration(
        configurations['order_return_configuration'] ?? []);
    tacticalPromotionConfiguration =
        TacticalPromotionConfiguration(configurations['tacticalConfig'] ?? []);
    outletMappingConfiguration =
        OutletMappingConfiguration(configurations['outlet_mapping'] ?? []);
    incentiveConfiguration =
        IncentiveConfiguration(configurations['incentive_configuration'] ?? []);
    targetConfiguration =
        TargetConfiguration(configurations['target_configuration'] ?? []);
    appOptionsConfiguration = AppOptionsConfiguration(
        configurations['app_options_configuration'] ?? []);
    recommendationTagConfiguration = RecommendationTagConfiguration(
        configurations['recommendation_tag_configuration'] ?? []);
    storeInventoryConfiguration = StoreInventoryConfiguration(
        configurations['store_inventory_configuration'] ?? []);
    invoiceConfiguration =
        InvoiceConfiguration(configurations['invoice_configuration'] ?? []);
    outletActivityConfiguration = OutletActivityConfiguration(
        configurations['outlet_activity_configuration'] ?? []);
    targetDashboardConfiguration = TargetDashboardConfiguration(
        configurations['target_achieved_configurations'] ?? []);
    incentiveBasketConfiguration = IncentiveBasketDashboardConfiguration(
        configurations['focus_basket_dashboard_configuration'] ?? []);
    psrPmConfiguration =
        PsrpmConfiguration(configurations['psrpm_configuration'] ?? []);
    appImagesConfiguration = AppImagesConfiguration(
        configurations['app_images_configuration'] ?? []);
  }
}
