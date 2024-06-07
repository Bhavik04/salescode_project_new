import 'dart:convert';

import 'kpi_interface.dart';

class UnforgettableSKUKpiService extends KpiInterface{
  String KPI_ID = "unforgettableSKU";

  @override
  Map<String, String> getHomeScreenColor() {
    // TODO: implement getHomeScreenColor
    return {};
  }

  @override
  Map<String, String> getHomeScreenData({required String kpiName}) {
    // TODO: implement getHomeScreenData
    return {};
  }

  @override
  String getHomeScreenPercentageValue({required String kpiName}) {
    // TODO: implement getHomeScreenPercentageValue
    return "0";
  }

  @override
  Map<String, String> getSalesRepSummaryData({required String salesRepId}) {
    // TODO: implement getSalesRepSummaryData
    throw UnimplementedError();
  }

}