import 'dart:convert';

import 'package:salescode_sdk/salescode_sdk.dart';

import '../models/kpi_sales_ui.dart';
import '../repository/kpi_repository_app.dart';
import '../utils/kpi_utils.dart';
import 'kpi_interface.dart';


class SalesValueKpiService extends KpiInterface {
  String KPI_ID = "salesValue";

  @override
  Map<String, String> getHomeScreenData({required String kpiName}) {
    List kpiDataList = kpiRepository.getKpiByName(kpiName);
    List<Map<String, String>> dataPointsToShow =
        KpiUtils.getHomeScreenDataPointsToShow(kpiId: KPI_ID);

    KpiReviewSalesValueUser? kpiReviewSalesValueUser =
        kpiDataList.isNotEmpty ? kpiDataList.first : null;
    final Map<String, String> data = {};

    for (var element in dataPointsToShow) {
      final configId = element["id"];
      final configLabel = element["label"];

      switch (configId) {
        case "prd_tgt":
          data[configLabel!] = convertToKString(
              double.tryParse(kpiReviewSalesValueUser?.tgtPrd ?? "0") ?? 0.0);
          break;

        case "prd_ach":
          data[configLabel!] = convertToKString(
              double.tryParse(kpiReviewSalesValueUser?.achPrd ?? "0") ?? 0.0);
          break;

        case "qtr_tgt":
          data[configLabel!] = convertToKString(
              double.tryParse(kpiReviewSalesValueUser?.tgtQtr ?? "0") ?? 0.0);
          break;

        case "qtr_ach_per":
          data[configLabel!] = convertToKString(double.tryParse(
                  kpiReviewSalesValueUser?.achPercentageQtr ?? "0") ??
              0.0);
          break;
        case "qtr_ach":
          data[configLabel!] = convertToKString((double.tryParse(
                      kpiReviewSalesValueUser?.achPercentageQtr ?? "0")! *
                  double.tryParse(kpiReviewSalesValueUser?.tgtQtr ?? "0")!) /
              100.00);
          break;
      }
    }
    return data;
  }

 
  @override
  String getHomeScreenPercentageValue({required String kpiName}) {
    List kpiDataList = kpiRepository.getKpiByName(kpiName,null);
    if (kpiDataList.isNotEmpty) {
      KpiReviewSalesValueUser kpiReviewSalesValueUser = kpiDataList.first;
      if ((double.tryParse(kpiReviewSalesValueUser.tgtPrd) ?? 0.0) == 0.0) {
        return "0";
      }
      return toFixed2DecimalPlaces(
          ((double.tryParse(kpiReviewSalesValueUser.achPrd) ?? 0.0) /
                  (double.tryParse(kpiReviewSalesValueUser.tgtPrd) ?? 1)) *
              100);
    }
    return "0";
  }

  @override
  Map<String, String> getHomeScreenColor() {
    String kpiName = KpiUtils.getHomeScreenKpiNameFromConfig(kpiId: KPI_ID);
    Map<String, double?> runRateValues =
          getHomeScreenRunRateValues(kpiName: kpiName);
    double percentage =
        double.tryParse(getHomeScreenPercentageValue(kpiName: kpiName)) ?? 0.0;

    return KpiUtils.getHomeScreenColorByKpiId(kpiId: KPI_ID, percentage: percentage , runRateValues: runRateValues);
  
  }


  Map<String, double?> getHomeScreenRunRateValues({required String kpiName}) {
    KpiRepositoryApp kpiRepository = KpiRepositoryApp();
    List kpiDataList = kpiRepository.getKpiByName(kpiName);
    if (kpiDataList.isNotEmpty) {
      KpiReviewSalesValueUser kpiReviewSalesValueUser =
          KpiReviewSalesValueUser.fromJson(
              jsonDecode(jsonEncode(kpiDataList.first)));

      int numberOfDays = kpiReviewSalesValueUser.totalWorkingDays;
      int currentDayIndex = kpiReviewSalesValueUser.workingDaysPtd;

      double? currentDayTgt , salesAch;
      
      if(numberOfDays > 0){
        currentDayTgt =
            ((double.tryParse(kpiReviewSalesValueUser.tgtPrd) ?? 0.0) /
                    numberOfDays) *
                currentDayIndex;
        salesAch = double.tryParse(kpiReviewSalesValueUser.achPrd) ?? 0.0;
      }
      
      return {"salesAch": salesAch, "currentDayTgt": currentDayTgt};
    }

    return {"salesAch": null, "currentDayTgt": null};
  }

}
