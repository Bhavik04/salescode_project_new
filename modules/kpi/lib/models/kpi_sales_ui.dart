class KpiReviewSalesValueUser {
  String tgtQtr;
  String achPrd;
  String tgtPrd;
  int smileyColor;
  String achPercentageQtr;
  String value;
  int totalWorkingDays;
  int workingDaysPtd;
  String last7daysAch;
  String avgSales;
  String outletBilled;

  KpiReviewSalesValueUser(
      {required this.tgtQtr,
      required this.achPrd,
      required this.tgtPrd,
      required this.smileyColor,
      required this.achPercentageQtr,
      required this.value,
      required this.totalWorkingDays,
      required this.workingDaysPtd,
      required this.last7daysAch,
      required this.avgSales,
      required this.outletBilled
      });

  

  factory KpiReviewSalesValueUser.fromJson(Map<String, dynamic> json) {
    return KpiReviewSalesValueUser(
      tgtQtr: json['tgtQtr'] ?? "0.00",
      achPrd: json['achPrd'] ?? "0.0",
      tgtPrd: json['tgtPrd'] ?? "0.00",
      smileyColor: json['smileyColor'] ?? 0,
      achPercentageQtr: json['achpercentageqtr'].toString() ?? "",
      value: json['value'] ?? "0",
      totalWorkingDays: json['totalWorkingDays'] ?? 0,
      workingDaysPtd: json['workingDaysPtd'] ?? 0,
      last7daysAch: json['last7daysAch'] ?? "0", 
      avgSales:json['avgSales'] ?? "0", 
      outletBilled: json['outletBilled'] ?? "0"
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tgtQtr': tgtQtr,
      'achPrd': achPrd,
      'tgtPrd': tgtPrd,
      'smileyColor': smileyColor,
      'achpercentageqtr': achPercentageQtr,
      'value': value,
      'totalWorkingDays': totalWorkingDays,
      'workingDaysPtd': workingDaysPtd,
      'last7daysAch':last7daysAch,
      'avgSales': avgSales,
      'outletBilled' : outletBilled
    };
  }
}
