import 'dart:ui';
import 'package:flutter/material.dart';

import '../configuration/models/configuration_ui.dart';
import 'utils.dart';
import 'dart:ui' as ui;


class GlobalVariables {
  static String appType = "";
  static String token = '';
  static Color primaryColor = HexColor("#cb352e");
  static Color themeColor = HexColor("#cb352e");
  static String? fontFamily = "Poppins";
  static double deviceHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;
  static double deviceWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  static Color backgroundColor = HexColor("#EBEBEB");
  static LinearGradient appBarGradient = LinearGradient(
    colors: [
      HexColor("#cb352e"),
      HexColor("#cb352e"),
    ],
    stops: const [0.5, 1.0],
  );
  static Color selectedNavBarColor = HexColor("#cb352e");
  static String themeColorCode = '#cb352e';
  static Color themeDisabledColor = HexColor("#e08682");
  static List<ConfigurationUI> appConfig = [];
  static dynamic metadata;
  static List<String> requiredDomainTypes = [
    "order_configuration",
    "theme_configuration",
    "catalogue_configuration",
    "app_configuration",
    "helpdesk_options_configuration",
    "helpdesk_banks_list",
    "customer_configuration",
    "catalogue_sorting_options",
    "internal_banks_configuration",
    "authentication_configuration",
    "loyalty_points_configuration",
    "tab_filters",
    "order_basket_configuration",
    "target_achieved_configurations",
    "focus_basket_dashboard_configuration",
    "bucket_configuration",
    "profile_screen_instructions",
    "upgrader_config",
    "filters_label_configuration",
    "multiprincipleLob",
    "bottom_bar_configuration",
    "instant_registration_configuration",
    "export_order_configuration",
    "multi_lingual_configuration",
    "analytics_config",
    "scheme_configuration",
    "must_do_action_configuration",
    "app_link_sharing_config",
    "Outlet_tile_configurations",
    "attendance_configuration",
    "competitor_tracking_configuration",
    "merchandising_configuration",
    "kpi_configuration",
    "recommendation_tag_configuration",
    "service_expiry_configuration",
    "order_return_configuration",
    "target_configuration",
    "outlet_mapping",
    "no_visit_options",
    "kpi_metadata",
    "error_logger_configuration",
    "incentive_configuration",
    "store_inventory_configuration",
    "retailer_registration_configuration",
    "outlet_activity_configuration",
    "invoice_configuration",
    "cooler_configuration",
    "tacticalConfig",
    "recently_purchased_images_configuration",
    "merchandising_image_configuration",
    "upi_upload_image_configuration",
    "app_images_configuration",
    "psrpm_configuration",
    "outlet_activity_configuration"
  ];
  static bool useExternalRecoEngine = false;
  static String languageCode = '';
}