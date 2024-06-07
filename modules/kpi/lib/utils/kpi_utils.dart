import 'dart:convert';
import 'package:salescode_sdk/salescode_sdk.dart';

import '../constants/kpiConstants.dart';

class KpiUtils {
   static final OPERATORS_MAP_FUN = {
      '>': (a, b) => a > b,
      '<': (a, b) => a < b,
      '>=': (a, b) => a >= b,
      '<=': (a, b) => a <= b,
      '=': (a, b) => a == b,
    };

  static int orderSortComparison(Map<String, String> a, Map<String, String> b) {
    final int orderA = int.tryParse(a["order"] ?? "0") ?? 0;
    final int orderB = int.tryParse(b["order"] ?? "0") ?? 0;
    return orderA - orderB;
  }

  static Map<String, Map<String, List<Map<String, String>>>>
      getDataFieldsToShow(kpiList) {
    Map<String, Map<String, List<Map<String, String>>>> data = {};

    for (var kpiValue in kpiList) {
      data[kpiValue["id"]] = getDataFieldsToShowFromKPI(kpiValue);
    }

    return data;
  }

  static Map<String, List<Map<String, String>>> getDataFieldsToShowFromKPI(
      kpiValue) {
    List<String> fieldNames = ["homeTile"];
    List<String> toggles = [];

    if (kpiValue.containsKey("filterToggles")) {
      toggles = kpiValue["filterToggles"].cast<String>();
    }

    if (toggles.isNotEmpty) {
      for (var toggleName in toggles) {
        fieldNames.add("summaryCard-$toggleName");
      }
    } else {
      fieldNames.add('summaryCard');
    }

    Map<String, List<Map<String, String>>> dataFields = {};
    for (var fieldName in fieldNames) {
      dataFields[fieldName] = getDataFieldsToShowFieldName(kpiValue, fieldName);
    }
    return dataFields;
  }

  static List<Map<String, String>> getDataFieldsToShowFieldName(
      kpiValue, String fieldName) {
    if (kpiValue == null || !kpiValue.containsKey(fieldName)) return [];

    List<Map<String, String>> dataFields = [];
    kpiValue[fieldName].forEach((val) => {
          dataFields.add({
            "id": val["id"],
            "label": val["label"],
            "order": val["order"] ?? "0"
          })
        });

    dataFields.sort((a, b) => orderSortComparison(a, b));
    return dataFields
        .map((val) => {"id": val["id"]!, "label": val["label"]!})
        .toList();
  }

  static String getValidationType(String emoji) {
    if (emoji.toLowerCase() == "happy") {
      return KPIConstants.SUCCESS;
    } else if (emoji.toLowerCase() == "neutral") {
      return KPIConstants.FAILURE;
    } else {
      return KPIConstants.DEFAULT;
    }
  }

  static Map<String, String> getColorForValueInRange(
      double value, List<dynamic> ranges) {
    value = double.tryParse(roundOffString(toFixed2DecimalPlaces(value))) ?? 0.0;
    for (var range in ranges) {
      double startValue = (range["startValue"] == "min")
          ? double.negativeInfinity
          : double.tryParse(range["startValue"] ?? "") ??
              double.negativeInfinity;
      double endValue = (range["endValue"] == "max")
          ? double.infinity
          : double.tryParse(range["endValue"] ?? "") ?? double.infinity;

      if (value >= startValue && value <= endValue) {
        return {
          "type": getValidationType(range["emoji"] ?? ""),
          "color": range["color"] ?? KPIConstants.DEFAULT_COLOR
        };
      }
    }
    return {"type": KPIConstants.DEFAULT, "color": KPIConstants.DEFAULT_COLOR};
  }

  static Map<String, String> getColorForThreshold(
      double value, Map conditionMap) {
      double val = double.tryParse(roundOffString(toFixed2DecimalPlaces(value))) ?? 0;
    double thresholdLevel =
        double.tryParse(conditionMap["value"]?.toString() ?? "0.0") ?? 0.0;
    if (conditionMap.isNotEmpty) {
      if (val > thresholdLevel.toDouble()) {
        return {
          "type": KPIConstants.SUCCESS,
          "color": conditionMap["gc"] ?? KPIConstants.DEFAULT_COLOR
        };
      } else if (val < thresholdLevel.toDouble()) {
        return {
          "type": KPIConstants.FAILURE,
          "color": conditionMap["lc"] ?? KPIConstants.DEFAULT_COLOR
        };
      } else if (val == thresholdLevel.toDouble()) {
        return {
          "type": KPIConstants.EQUAL,
          "color": conditionMap["ec"] ?? KPIConstants.DEFAULT_COLOR
        };
      }
    }
    return {"type": KPIConstants.DEFAULT, "color": KPIConstants.DEFAULT_COLOR};
  }

  static Map<String, String> getColorForRunRate(
      Map validationMap, double? salesAch, double? currentDayTgt) {
    if (salesAch == null || currentDayTgt == null) {
      return {
        "type": KPIConstants.DEFAULT,
        "color": KPIConstants.DEFAULT_COLOR
      };
    }

    if (salesAch > currentDayTgt) {
      return {
        "type": KPIConstants.SUCCESS,
        "color": validationMap["runRate"]?["gc"] ?? KPIConstants.SUCCESS_COLOR
      };
    } else if (salesAch == currentDayTgt) {
      return {
        "type": KPIConstants.EQUAL,
        "color": validationMap["runRate"]?["ec"] ?? KPIConstants.EQUAL_COLOR
      };
    } else {
      return {
        "type": KPIConstants.FAILURE,
        "color": validationMap["runRate"]?["lc"] ?? KPIConstants.FAILURE_COLOR
      };
    }
  }

  static Map<String,String> getColorForComparison(Map<String,double> data, List<dynamic> comparisons){
    
    Map<String,String> result = {
       "type": KPIConstants.DEFAULT,
      "color": KPIConstants.DEFAULT_COLOR
    };
    
    for(int i=0 ; i<comparisons.length ; i++){
      final currentComparison = comparisons[i];
      final fun = OPERATORS_MAP_FUN[currentComparison["operator"]];
      double op1Val = data[currentComparison["operand1"]] ?? 0;
      double op2Val = data[currentComparison["operand2"]] ?? 0;

      if(fun != null && fun(op1Val,op2Val)){
        result = {
          "type":getValidationType(currentComparison["emoji"] ?? ""),
          "color":currentComparison["color"]
        };
        break;
      }
    }

    return result;

  }

  static String roundOffString(String num) {
    if (num == "") return "";
    String str = double.parse(num).roundToDouble().toString();
    if (str.contains(".")) {
      return str.split('.')[0];
    } else {
      return str;
    }
  }

  static Map? getKpiValueFromId({required String kpiId}){
     String kpiConfigStr =
        ConfigurationDictionary.kpiConfiguration.kpiConfigList;
    if (kpiConfigStr != "null") {
     return jsonDecode(kpiConfigStr)?.firstWhere(
              (element) => element["id"] == kpiId,
              orElse: () => null);
    }
    return null;
  }

  static dynamic getValFromObject({required Map obj , required String fieldName , required String id}){
    return obj[fieldName]?.firstWhere((element)=> element["id"] == id , orElse:()=>null);
  }

  static List<Map<String, String>> getTogglesFromConfig({required String kpiId}) {
    Map? kpiValue = getKpiValueFromId(kpiId: kpiId);

    if (kpiValue == null) return [];

    Map toggleConfigObj = getValFromObject(
            obj: kpiValue, fieldName: "detail_summary", id: "toggleListView") ??
        {};

    return toggleConfigObj["toggle_list"] != null
        ? (toggleConfigObj["toggle_list"] as List).map((item) {
            return Map<String, String>.from(item);
          }).toList()
        : [];
  }


  static Map<String, String> getTableHeaderFromConfig({required String kpiId , required String selectedToggle}){
    Map<String, String> header = {};
  
    List<Map<String, String>> dataPointsToShow =
        getTableDataPointsToShowFromConfig(kpiId: kpiId, selectedToggle:selectedToggle);

    for (var dataPoint in dataPointsToShow) {
      String id = dataPoint["id"] ?? "NA";
      String label = dataPoint["label"] ?? "NA";
      header[id] = label;
    }

    return header;
  }


  static List<Map<String, String>> getTableDataPointsToShowFromConfig({required String kpiId , required String selectedToggle}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    String? tableId = getTableIdFromToggleId(kpiId:kpiId , selectedToggle: selectedToggle);
    if(tableId == null) return [];

    Map obj = getValFromObject(obj: kpiValue,fieldName: "detail_summary",id:tableId) ?? {};
    return getDataFieldsToShowFieldName(obj, "data_points");
    
  }


  static String getTableKpiNameFromConfig({required String kpiId , required String selectedToggle}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    String? tableId = getTableIdFromToggleId(kpiId: kpiId ,selectedToggle: selectedToggle);
    if(tableId == null) return "";
    return getValFromObject(obj: kpiValue, fieldName: "detail_summary", id: tableId)?["kpiName"] ?? "";
  
  }


  static String? getTableIdFromToggleId({required String kpiId , required String selectedToggle}){
    String mappingId = generateMappingId(kpiId: kpiId , selectedToggle: selectedToggle);
    return KPIConstants.KPI_TOGGLE_MAP_TABLE_ID[mappingId];
  }


  static String generateMappingId({required String kpiId , required String selectedToggle}){
    return "$kpiId--$selectedToggle";
  }



  static Map getHomeScreenvalidationFromConfig({required String kpiId , required String keyId}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    return getValFromObject(obj: kpiValue, fieldName: "data_points", id: keyId)?["validation"] ?? {};
  }

  static Map getSummaryCardValidationFromConfig({required String kpiId , required String selectedToggle , required String keyId}){
    dynamic kpiVal = getKpiValueFromId(kpiId: kpiId);
    if(kpiVal == null) return {};
    
    String? summarycardId = getSummaryCardIdFromToggleId(kpiId :kpiId , selectedToggle: selectedToggle);
    if(summarycardId == null) return {};
    Map obj = getValFromObject(obj: kpiVal, fieldName: "detail_summary", id: summarycardId) ?? {};
    return getValFromObject(obj: obj, fieldName: "data_points", id: keyId)?["validation"] ?? {};
  }


  static String? getSummaryCardIdFromToggleId({required String kpiId , required String selectedToggle}){
    String mappingId = generateMappingId(kpiId: kpiId , selectedToggle: selectedToggle);
    return KPIConstants.KPI_TOGGLE_MAP_SUMMARY_CARD_ID[mappingId];
  }


  static String getSummaryCardLabelFromConfig({required String kpiId ,required String selectedToggle }){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    String? smCardId = getSummaryCardIdFromToggleId(kpiId:kpiId, selectedToggle:selectedToggle);
    if(smCardId == null) return "";
    return getValFromObject(obj: kpiValue, fieldName: "detail_summary", id: smCardId)?["title"] ?? "";
  }

  static String getSummaryCardPercentageLabelFromConfig({required String kpiId , required String selectedToggle , required String keyId}){
    Map? kpiValue = getKpiValueFromId(kpiId: kpiId);
    if(kpiValue == null) return "";
    String? smCardId = getSummaryCardIdFromToggleId( kpiId: kpiId  , selectedToggle: selectedToggle);
    if(smCardId == null) return "";
    Map card = getValFromObject(obj: kpiValue, fieldName: "detail_summary", id: smCardId);
    return getValFromObject(obj: card, fieldName: "data_points", id: keyId)?["label"] ?? "";
  }

  static List<Map<String, String>> getHomeScreenDataPointsToShow({required String kpiId}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    return getDataFieldsToShowFieldName(kpiValue, "data_points");
  }

  static List<Map<String, String>> getSummaryCardDataPointsToShowFromConfig({required String kpiId , required String selectedToggle,}){
    Map? kpiValue = getKpiValueFromId(kpiId:kpiId) ?? {};
    String? summaryCardId = getSummaryCardIdFromToggleId(selectedToggle: selectedToggle , kpiId: kpiId);
    if(summaryCardId == null) return [];
    Map obj = getValFromObject(obj: kpiValue,fieldName: "detail_summary",id:summaryCardId) ?? {};
    return getDataFieldsToShowFieldName(obj, "data_points");
  }

  static String getSummaryCardKpiNameFromConfig({required String kpiId , required String selectedToggle}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    String? summaryCardId = getSummaryCardIdFromToggleId( selectedToggle:selectedToggle , kpiId: kpiId);
    if(summaryCardId == null) return "";
    return getValFromObject(obj: kpiValue, fieldName: 'detail_summary', id: summaryCardId)?["kpiName"] ?? "";
  }

  static String getHomeScreenKpiNameFromConfig({required String kpiId}){
    return getKpiValueFromId(kpiId: kpiId)?["kpiName"] ?? "";
  }

  static void addDynamicToggleDataToToggleIdMap({required kpiId , required List<Map<String,String>>toggles  , String? tableIdValue , String? smCardIdValue}){
    for(Map<String,String> toggle in toggles){
      String mappedId = generateMappingId(kpiId: kpiId , selectedToggle: toggle["id"] ?? "");
      if(tableIdValue != null) {
        KPIConstants.KPI_TOGGLE_MAP_TABLE_ID[mappedId] = tableIdValue;
      }
      if(smCardIdValue != null) {
        KPIConstants.KPI_TOGGLE_MAP_SUMMARY_CARD_ID[mappedId] = smCardIdValue;
      }
    }
  }

  static Map<String, String> getHomeScreenColorByKpiId({required String kpiId , required double percentage , Map<String, double?>? runRateValues , Map<String,double>?comparisonData }){
    String? mappedKey = KPIConstants.KPI_ID_MAP_HT_CARD_PER_DATAPOINT_ID[kpiId];
    if(mappedKey == null) return {"type": KPIConstants.DEFAULT, "color": KPIConstants.DEFAULT_COLOR};
    Map validationMap = getHomeScreenvalidationFromConfig(kpiId: kpiId ,keyId: mappedKey);
    return getColorValidation(percentage: percentage , validation: validationMap , runRateValues: runRateValues ,comparisonData: comparisonData);
   }


  static Map<String, String> getSummaryCardColorByKpiId({required kpiId , required String selectedToggle , required double percentage , Map<String, double?>? runRateValues ,Map<String,double>?comparisonData}){
    String? mappedKey = KPIConstants.KPI_ID_MAP_SM_CARD_PER_DATAPOINT_ID[kpiId];
    if(mappedKey == null) return {"type": KPIConstants.DEFAULT, "color": KPIConstants.DEFAULT_COLOR};
    Map validationMap = getSummaryCardValidationFromConfig(kpiId: kpiId ,keyId: mappedKey,selectedToggle:selectedToggle);
    return getColorValidation(percentage: percentage , validation: validationMap , runRateValues: runRateValues,comparisonData: comparisonData);
  }


  static Map<String, String> getColorValidation(
      {required Map validation,
      required double percentage,
      Map<String, double?>? runRateValues,
       Map<String,double>? comparisonData
      }) {
    if (validation["type"] == "range") {
      return getColorForValueInRange(percentage, validation["range"] ?? {});
    } else if (validation["type"] == "threshold") {
      return getColorForThreshold(percentage, validation["threshold"] ?? {});
    } else if (validation["type"] == "runRate") {
      return getColorForRunRate(validation, runRateValues?["salesAch"],
          runRateValues?["currentDayTgt"]);
    }else if(validation["type"] == "comparison" && comparisonData != null){
      return getColorForComparison(comparisonData, validation["comparison"]);
    }

    return {"type": KPIConstants.DEFAULT, "color": KPIConstants.DEFAULT_COLOR};
  }

  static List<String> hideRowKeys({required String kpiId , required String selectedToggle}){
    Map kpiValue = getKpiValueFromId(kpiId: kpiId) ?? {};
    String? tableId = getTableIdFromToggleId(kpiId:kpiId , selectedToggle: selectedToggle);
    if(tableId == null) return [];

    Map obj = getValFromObject(obj: kpiValue,fieldName: "detail_summary",id:tableId) ?? {};
    List configList =  obj["hideRowKeysZero"] ?? [];
    return configList.map((e) => e?.toString() ?? "").toList();
  }

}
