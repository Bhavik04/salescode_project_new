// ignore_for_file: avoid_catches_without_on_clauses

import 'package:salescode_sdk/salescode_sdk.dart';

import '../constants/kpiConstants.dart';
import 'productive_call_kpi_service.dart';
import 'sales_value_kpi_service.dart';
import 'unforgettableSKU_kpi_service.dart';

class KpiReviewService {
  SalesValueKpiService salesValueKpiService = SalesValueKpiService();
  ProductiveCallKpiService productiveCallKpiService =
      ProductiveCallKpiService();
  UnforgettableSKUKpiService unforgettableSKUKpiService =
      UnforgettableSKUKpiService();

  Map<String, String> getHomeScreenDataByKpiId(
      {required String id, required String kpiName}) {
    try {
      switch (id) {
        case "salesValue":
          return salesValueKpiService.getHomeScreenData(kpiName: kpiName);
        case "productiveCall":
          return productiveCallKpiService.getHomeScreenData(kpiName: kpiName);
        case 'unforgettableSKU':
          return unforgettableSKUKpiService.getHomeScreenData(kpiName: kpiName);
        default:
          return {};
      }
    } catch (error, stackTrace) {
      // unawaited(errorLoggerService.logError(
      //   errorCode: ErrorType.kpi_home_tile_failure,
      //   error: error.toString(),
      //   stackTrace: stackTrace,
      //   message: "getHomeScreenDataByKpiId failed -> failed -> id : $id , kpiName: $kpiName",
      //   severity: Severity.high,
      //   feature: Feature.kpi
      // ));
      return {};
    }
  }

  String getPercentageForHomeByKpiId(
      {required String id, required String kpiName}) {
    try {
      switch (id) {
        case "salesValue":
          return salesValueKpiService.getHomeScreenPercentageValue(
              kpiName: kpiName);
        case "productiveCall":
          return productiveCallKpiService.getHomeScreenPercentageValue(
              kpiName: kpiName);
        case 'unforgettableSKU':
          return unforgettableSKUKpiService.getHomeScreenPercentageValue(
              kpiName: kpiName);
        default:
          return "0";
      }
    } catch (error, stackTrace) {
      return "0";
    }
  }

  String getDateForHome() {
    var formattedDate = formatTodayDate(v5: true);
    switch (ConfigurationDictionary.targetConfiguration.targetLevel) {
      case "month":
        String transalatedTargetLevel = "MTD";
        return "$transalatedTargetLevel $formattedDate";
      case "period":
        String transalatedTargetLevel = "PTD";
        return "$transalatedTargetLevel $formattedDate";
    }
    return formattedDate;
  }

  Map<String, String> getColourForHomeScreenEmoji(
      String id, String validationType, String toggle,
      [String? salesRepId]) {
    try {
      if (validationType == "homescreen") {
        switch (id) {
          case "salesValue":
            return salesValueKpiService.getHomeScreenColor();
          case "productiveCall":
            return productiveCallKpiService.getHomeScreenColor();
          case 'unforgettableSKU':
            return unforgettableSKUKpiService.getHomeScreenColor();

          default:
            return {
              "type": KPIConstants.DEFAULT,
              "color": KPIConstants.DEFAULT_COLOR
            };
        }
      }
      return {
        "type": KPIConstants.DEFAULT,
        "color": KPIConstants.DEFAULT_COLOR
      };
    } catch (error, stackTrace) {
      return {
        "type": KPIConstants.DEFAULT,
        "color": KPIConstants.DEFAULT_COLOR
      };
    }
  }

  bool isDetailSummaryEmpty(Map kpiValue) {
    if (kpiValue.isEmpty ||
        !kpiValue.containsKey("detail_summary") ||
        kpiValue["detail_summary"].length == 0) return true;
    return false;
  }
}
