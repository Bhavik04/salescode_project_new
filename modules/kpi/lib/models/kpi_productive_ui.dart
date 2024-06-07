class KpiProductiveUserPeriodModel {
  final String kpiName;
  final int per70;
  final int totCalls;
  final int prodCalls;
  final int daysPassed;
  final String value;
  final int noSales;

  KpiProductiveUserPeriodModel({
    required this.kpiName,
    required this.per70,
    required this.totCalls,
    required this.prodCalls,
    required this.daysPassed,
    required this.value,
    required this.noSales,
  });

  factory KpiProductiveUserPeriodModel.fromJson(Map<String, dynamic> json) {
    return KpiProductiveUserPeriodModel(
      kpiName: json['kpiName'] ?? "",
      per70: json['70per'] ?? 0,
      totCalls: json['totCalls'] ?? 0,
      prodCalls: json['prodCalls'] ?? 0,
      daysPassed: json['daysPassed'] ?? 0,
      value: json['value'] ?? "",
      noSales: json['noSales'] ?? 0,
    );
  }
}
