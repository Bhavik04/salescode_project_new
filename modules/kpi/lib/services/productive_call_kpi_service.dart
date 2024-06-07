import 'package:salescode_sdk/salescode_sdk.dart';

import '../models/kpi_productive_ui.dart';
import '../utils/kpi_utils.dart';
import 'kpi_interface.dart';

class ProductiveCallKpiService extends KpiInterface {
  String KPI_ID = "productiveCall";
  
  @override
  Map<String, String> getHomeScreenData({required String kpiName}) {
    List kpiDataList = kpiRepository.getKpiByName(kpiName);
    List<Map<String, String>> dataPointsToShow =
        KpiUtils.getHomeScreenDataPointsToShow(kpiId: KPI_ID);

    KpiProductiveUserPeriodModel? kpiProductiveUserPeriodModel =
        kpiDataList.isNotEmpty ? kpiDataList.first : null;

    final Map<String, String> data = {};

    for (var element in dataPointsToShow) {
      final configId = element["id"];
      final configLabel = element["label"];

      switch (configId) {
        case "totalCall":
          data[configLabel!] = convertToKString(double.tryParse(
                  kpiProductiveUserPeriodModel?.totCalls.toString() ?? "0") ??
              0.0);
          break;

        case "daysPassed":
          data[configLabel!] = convertToKString(double.tryParse(
                  kpiProductiveUserPeriodModel?.daysPassed.toString() ?? "0") ??
              0.0);
          break;

        case "productiveCall":
          data[configLabel!] = convertToKString(double.tryParse(
                  kpiProductiveUserPeriodModel?.prodCalls.toString() ?? "0") ??
              0.0);
          break;

        case "daysWith70perTGTAch":
          data[configLabel!] = convertToKString(double.tryParse(
                  kpiProductiveUserPeriodModel?.per70.toString() ?? "0") ??
              0.0);
          break;

        case "noSales":
          data[configLabel!] =
              kpiProductiveUserPeriodModel?.noSales.toString() ?? "0";
      }
    }

    return data;
  }

  @override
  String getHomeScreenPercentageValue({required String kpiName}) {
    List kpiDataList = kpiRepository.getKpiByName(kpiName);
    if (kpiDataList.isNotEmpty) {
      KpiProductiveUserPeriodModel kpiProductiveUserPeriodModel =
          kpiDataList.first;

      if(kpiProductiveUserPeriodModel.totCalls == 0) return "0";
      
      return toFixed2DecimalPlaces((kpiProductiveUserPeriodModel.prodCalls /
              kpiProductiveUserPeriodModel.totCalls) *
          100);
    }
    return "0";
  }

  @override
  Map<String, String> getHomeScreenColor() {
    String kpiName = KpiUtils.getHomeScreenKpiNameFromConfig(kpiId: KPI_ID);
    double percentage =
        double.tryParse(getHomeScreenPercentageValue(kpiName: kpiName)) ?? 0.0;
    return KpiUtils.getHomeScreenColorByKpiId(
        kpiId: KPI_ID, percentage: percentage);
  }

}
