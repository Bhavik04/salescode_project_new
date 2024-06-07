
import 'dart:convert';

import 'package:must_do_actions/model/must_do_action_ui.dart';

class MustDoActionService {

  List<MustDoActionUI> getAllMustDoActions() {
    try {
      String mustDoActionWidget = '[{"id":"salesTarget","unit":"Cases","color":"#17C3B2","heading":"SALES TARGET","actionTag":"Sales Target","subHeading":"Must Achieve Today","avgValueLabel":"Avg. Sales L7 Days : "},{"id":"mustOrderOutlets","unit":"Stores","color":"#DE715B","heading":"MUST ORDER OUTLETS","actionTag":"Must Order Outlets","subHeading":"To Drive Effective Call","avgValueLabel":"Avg. Billed Outlets L7 Days : "},{"id":"mustSellSKUs","unit":"Stores","color":"#227C9D","heading":"UNFORGETTABLE SKU","actionTag":"MUST SELL SKUs","subHeading":"Focus Products To Be Sold","avgValueLabel":"Must Sell Stores L7 Days : "}]';
      // print("mustDoActionWidget: $mustDoActionWidget");
      // debugPrint("mustDoActionWidget: $mustDoActionWidget");
      List<dynamic> mustDoActionWidgetList = jsonDecode(mustDoActionWidget);
      List<dynamic> targetEnrichedData =
          enrichTargetInfo(mustDoActionWidgetList);
      // List<dynamic> avgValEnrichedData = enrichAvgAch(targetEnrichedData);
      List<dynamic> avgValEnrichedData = [{"id":"salesTarget","unit":"Cases","color":"#17C3B2","heading":"SALES TARGET","actionTag":"Sales Target","subHeading":"Must Achieve Today","avgValueLabel":"Avg. Sales L7 Days : ","value1":0.0,"avgAch":"0"},{"id":"mustOrderOutlets","unit":"Stores","color":"#DE715B","heading":"MUST ORDER OUTLETS","actionTag":"Must Order Outlets","subHeading":"To Drive Effective Call","avgValueLabel":"Avg. Billed Outlets L7 Days : ","value1":0.0,"avgAch":"0"},{"id":"mustSellSKUs","unit":"Stores","color":"#227C9D","heading":"UNFORGETTABLE SKU","actionTag":"MUST SELL SKUs","subHeading":"Focus Products To Be Sold","avgValueLabel":"Must Sell Stores L7 Days : ","value1":0.0}];
      // List<dynamic> finalEnrichedData = enrichIncentives(avgValEnrichedData);
      List<dynamic> finalEnrichedData = [{"id":"salesTarget","unit":"Cases","color":"#17C3B2","heading":"SALES TARGET","actionTag":"Sales Target","subHeading":"Must Achieve Today","avgValueLabel":"Avg. Sales L7 Days : ","value1":0.0,"avgAch":"0","incentivePoints":null},{"id":"mustOrderOutlets","unit":"Stores","color":"#DE715B","heading":"MUST ORDER OUTLETS","actionTag":"Must Order Outlets","subHeading":"To Drive Effective Call","avgValueLabel":"Avg. Billed Outlets L7 Days : ","value1":0.0,"avgAch":"0"},{"id":"mustSellSKUs","unit":"Stores","color":"#227C9D","heading":"UNFORGETTABLE SKU","actionTag":"MUST SELL SKUs","subHeading":"Focus Products To Be Sold","avgValueLabel":"Must Sell Stores L7 Days : ","value1":0.0}];

      List<MustDoActionUI> mustDoActionsList =
          finalEnrichedData.map((e) => MustDoActionUI.fromMap(e)).toList();
      return mustDoActionsList;
    } catch (error, stackTrace) {
      return [];
    }
  }

  List enrichTargetInfo(List<dynamic> actionList) {
    double target = 0.0;

    for (var element in actionList) {
      switch (element["id"]) {
        case "salesTarget":
          element["value1"] = target;
          break;
        case "mustOrderOutlets":
          element["value1"] = 0.0;
          break;
        case "mustSellSKUs":
          element["value1"] = 0.0;
          break;
        case "executionTask":
          element["value1"] = 0.0;
          break;
        case "secondaryOrder":
          element["value1"] = 0.0;
          break;
        case "primaryOrder":
          element["value1"] = 0.0;
          break;
        default:
          continue;
      }
    }
    return actionList;
  }

  // List enrichIncentives(List<dynamic> actionList) {
  //   for (var element in actionList) {
  //     List<OutletUI> outletList = [];
  //     switch (element["id"]) {
  //       case "salesTarget":
  //         outletList = outletServices.getPjpOutlets();
  //         break;
  //       default:
  //         outletList = [];
  //         continue;
  //     }
  //     List<String> outletCodeList =
  //         outletList.map((outletObject) => outletObject.outletCode).toList();
  //     element['incentivePoints'] =
  //         incentiveService.aggregateIncentive(outletCodeList);
  //   }
  //   return actionList;
  // }

  // List enrichAvgAch(List<dynamic> actionList) {
  //   for (var element in actionList) {
  //     String kpiName = "";
  //     switch (element["id"]) {
  //       case "salesTarget":
  //         kpiName = "kpi_sales_value_user";
  //         break;
  //       case "mustOrderOutlets":
  //         kpiName = "kpi_sales_value_user";
  //         break;
  //       default:
  //         kpiName = "";
  //         continue;
  //     }
  //     element['avgAch'] = getAvgAchValFromKpi(kpiName, element["id"]);
  //   }
  //   return actionList;
  // }

  // String getAvgAchValFromKpi(String kpiName, String id) {
  //   if (kpiName.isEmpty) return '0';

  //   List kpiDataList = kpiRepository.getKpiByName(kpiName);
  //   if (kpiDataList.isNotEmpty) {
  //     KpiReviewSalesValueUser kpiReviewSalesValueUser = kpiDataList.first;
  //     switch (id) {
  //       case "salesTarget":
  //         return kpiReviewSalesValueUser.avgSales;

  //       case "mustOrderOutlets":
  //         return kpiReviewSalesValueUser.outletBilled;
  //     }
  //   }

  //   return "0";
  // }
}
