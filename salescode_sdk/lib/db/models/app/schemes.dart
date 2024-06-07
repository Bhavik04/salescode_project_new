import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class Schemes {
  @Id()
  int id = 0;
  String discountId = "";
  String batchCode = "";
  int priority = 0;
  String schemeDescription = "";
  String supplier = "";
  int startDate = 0;
  int endDate = 0;
  String type = "";
  String criteria = "";
  double maxBudget = 0;
  double maxTerm = 0;
  String programLevel = "";
  int mustBuyQty = 0;
  String discountedBatchCode = "";
  String programNumber = "";
  String slabsInfo = "";
  String minMaxCond = '';
  bool overNAbove = false;
  String mustBuyAttributes = '';
  String channel = "";
  String distributionChannel = "";
  String subChannel = "";
  String outletType = "";
  String outletCategory = "";
  String outletDivision = "";
  String outletClass = "";
  String outletCode = "";
  String marketId = "";
  String marketName = "";
  String? bannerBlob = "";
  int? bannerPriority = 0;
  String loginId = "";
  String color = "";
  String? outletExclusionKey = "";
  String? outletExclusionValues = "";
  String? itemEach = "";
  String extendedAttributes = "";
  String activeStatus = "";
  String skuCode = "";

  Schemes({
    required this.discountId,
    required this.batchCode,
    required this.priority,
    required this.schemeDescription,
    required this.supplier,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.criteria,
    required this.maxBudget,
    required this.maxTerm,
    required this.programLevel,
    required this.mustBuyQty,
    required this.discountedBatchCode,
    required this.programNumber,
    required this.slabsInfo,
    required this.minMaxCond,
    required this.overNAbove,
    required this.mustBuyAttributes,
    this.activeStatus = "",
    this.extendedAttributes = "",
    this.skuCode = "",
    this.channel = "",
    this.distributionChannel = "",
    this.subChannel = "",
    this.outletType = "",
    this.outletCategory = "",
    this.outletDivision = "",
    this.outletClass = "",
    this.outletCode = "",
    this.marketId = "",
    this.marketName = "",
    this.bannerBlob = "",
    this.bannerPriority = 0,
    this.loginId = "",
    this.color = "",
    this.outletExclusionKey = "",
    this.outletExclusionValues = "",
    this.itemEach = "",
  });

  factory Schemes.toSchemes(Map<dynamic, dynamic> map) {
    return Schemes(
      discountId: map["discountId"] ?? "",
      activeStatus: map['activeStatus'] ?? "",
      batchCode: map["batchCode"] ?? "",
      priority: map["priority"] ?? 0,
      schemeDescription: map["schemeDescription"] ?? "",
      supplier: map["supplier"] ?? "",
      startDate: map["startDate"] ?? 0,
      endDate: map["endDate"] ?? 0,
      type: map["type"] ?? "",
      criteria: map["criteria"] ?? "",
      maxBudget: map["maxBudget"] ?? 0,
      maxTerm: map["maxTerm"] ?? 0,
      programLevel: map["programLevel"] ?? "",
      mustBuyQty: map["mustBuyQty"] ?? 0,
      discountedBatchCode: map["discountedBatchCode"] ?? "",
      programNumber: map['programNumber'] ?? "",
      slabsInfo: map["slabsInfo"] ?? "[]",
      minMaxCond: map["minMaxCond"] ?? "",
      overNAbove: map['overNAbove'] ?? false,
      mustBuyAttributes: map['mustBuyAttributes'] ?? '[]',
      channel: map['channel'] ?? "",
      distributionChannel: map['distributionChannel'] ?? "",
      subChannel: map['subChannel'] ?? "",
      outletType: map['outletType'] ?? "",
      outletCategory: map['outletCategory'] ?? "",
      outletDivision: map['outletDivision'] ?? "",
      outletClass: map['outletClass'] ?? "",
      outletCode: map['outletCode'] ?? "",
      marketId: map['marketId'] ?? "",
      marketName: map['marketName'] ?? "",
      bannerBlob: map['bannerBlob'] ?? "",
      bannerPriority: map['bannerPriority'] ?? 0,
      loginId: map['loginId'] ?? "",
      color: map['color'] ?? "",
      outletExclusionKey: map['outletExclusionKey'] ?? "",
      outletExclusionValues: map['outletExclusionValues'] ?? "",
      itemEach: map['itemEach'] ?? "",
      extendedAttributes: map['extendedAttributes'] ?? "",
      skuCode: map['skuCode'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'discountId': discountId,
      'activeStatus': activeStatus,
      'batchCode': batchCode,
      'priority': priority,
      'schemeDescription': schemeDescription,
      'supplier': supplier,
      'startDate': startDate,
      'endDate': endDate,
      'type': type,
      'criteria': criteria,
      'maxBudget': maxBudget,
      'maxTerm': maxTerm,
      'programLevel': programLevel,
      'mustBuyQty': mustBuyQty,
      'discountedBatchCode': discountedBatchCode,
      'programNumber': programNumber,
      'slabsInfo': slabsInfo,
      'minMaxCond': minMaxCond,
      'overNAbove': overNAbove,
      'mustBuyAttributes': mustBuyAttributes,
      'channel': channel,
      'distributionChannel': distributionChannel,
      'subChannel': subChannel,
      'outletType': outletType,
      'outletCategory': outletCategory,
      'outletDivision': outletDivision,
      'outletClass': outletClass,
      'outletCode': outletCode,
      'marketId': marketId,
      'marketName': marketName,
      'bannerBlob': bannerBlob,
      'bannerPriority': bannerPriority,
      'loginId': loginId,
      'color': color,
      'outletExclusionKey': outletExclusionKey,
      'outletExclusionValues': outletExclusionValues,
      'itemEach': itemEach,
      'extendedAttributes':extendedAttributes,
      'skuCode':skuCode,
    };
  }
}
