class KPIConstants {
  static const String SUCCESS_COLOR = "#3fb154";
  static const String FAILURE_COLOR = "#e94e4e";
  static const String EQUAL_COLOR = "#FFBF00";
  static const String DEFAULT_COLOR = "#000000";

  static const String SUCCESS = "SUCCESS";
  static const String FAILURE = "FAILURE";
  static const String EQUAL = "EQUAL";
  static const String DEFAULT = "DEFAULT";
  static const String TYPE_SLAB = "SlAB";
  // static const String KPI_NAME = "kpiList";

  static Map<String,String> KPI_TOGGLE_MAP_TABLE_ID={
    "productiveCall--outlet_toggle":"productive_call_outlet_list",
    "productiveCall--day_toggle":"productive_call_day_list",
    
    "salesValue--outlet_toggle":"sales_value_outlet_list",
    "salesValue--brand_toggle":"sales_value_brand_list",
    "salesValue--channel_toggle":"sales_value_channel_list",
    "salesValue--range_toggle":"sales_value_range_list",
    
    "salesVolume--outlet_toggle":"sales_volume_outlet_list",
    "salesVolume--brand_toggle":"sales_volume_brand_list",
    "salesVolume--channel_toggle":"sales_volume_channel_list",
    "salesVolume--range_toggle":"sales_volume_range_list",
  
    "visitCompliance--lwNotVisited_toggle":"visit_compliance_lw_list",
    "visitCompliance--ptdNotVisited_toggle":"visit_compliance_drill_down_list",
    
    "damages--outlet_toggle":"damages_trade_outlet_list",

    "eco--ptdNotBilled_toggle" : "eco_drill_down_list",

    "valueTieUp--":"value_tie_up_outlet_list",

    "volumeTieUp--":"volume_tie_up_outlet_list",

    "snd--":"snd_outlet_list"
  
  };

  static Map<String,String> KPI_TOGGLE_MAP_SUMMARY_CARD_ID={
    "productiveCall--outlet_toggle":"productive_user_period_outlet",
    "productiveCall--day_toggle":"productive_user_period_day",
    "salesValue--outlet_toggle":"sales_value_user",
    "salesValue--brand_toggle":"sales_value_user",
    
    "mslDistribution--":"msl_user",

    "salesVolume--outlet_toggle":"sales_volume",
    "salesVolume--brand_toggle":"sales_volume",
    "salesVolume--channel_toggle":"sales_volume",
    "salesVolume--range_toggle":"sales_volume",

    "visitCompliance--lwNotVisited_toggle":"visit_compliance_lw_not_visited",
    "visitCompliance--ptdNotVisited_toggle":"visit_compliance_ptd_not_visited",

    "damages--outlet_toggle":"trade_return",

    "eco--ptdNotBilled_toggle" : "eco_sm_card",

    "valueTieUp--":"value_tie_up",

    "volumeTieUp--":"volume_tie_up",

    "salesEco--":"sales_eco_sm_card",

    "unforgettableSKU--":"unforgettableSKU_card"
  };

  static const Map<String,String> KPI_ID_MAP_SM_CARD_PER_DATAPOINT_ID = {
    "salesValue":"sales_ach",
    "productiveCall":"productive_ach",
    "salesVolume":"sales_volume_sm_card_per",
    "damages":"damage_sm_card_per",
    "eco":"eco_compliance_per",
    "visitCompliance":"visit_compliance_per",
    "valueTieUp":"value_ach",
    "volumeTieUp":'value_ach',
    "salesEco":"sales_eco_per",
    "unforgettableSKU":"unforgettableSKU_ach"
  };

  static const Map<String,String> KPI_ID_MAP_HT_CARD_PER_DATAPOINT_ID = {
    "salesValue":"sales_value",
    "productiveCall":"productive_call",
    "salesVolume":"sales_volume",
    "damages":"damages_per",
    "eco":"eco_per",
    "visitCompliance":"visit_compliance_per",
    "snd" :"ach_per",
    "productivity":"productivity"
  };



}
