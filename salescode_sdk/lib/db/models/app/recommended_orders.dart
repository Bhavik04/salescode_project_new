import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class RecommendedOrdersV1 {
  @Id()
  int id;
  bool isFavourite;
  @Index()
  String batchCode;
  @Index()
  String skuCode;
  int pieceQuantity;
  int caseQuantity;
  String skuPriority;
  @Index()
  String outletCode;
  @Index()
  String recommendationType;
  String underperformanceAttr;
  double suggestQty;
  @Index()
  int priority;
  double totalAmount;
  String supportKPI;
  String extendedAttributesV1;
  double skuProbabilityV1;

  int startDateV1;
  int endDateV1;
  String activeStatusV1;
  String recommendationId;
  String recommendationTag;
  String basketId;

  RecommendedOrdersV1(
      {this.id = 0,
      required this.isFavourite,
      required this.batchCode,
      required this.skuCode,
      required this.pieceQuantity,
      required this.caseQuantity,
      required this.skuPriority,
      required this.outletCode,
      required this.recommendationType,
      required this.underperformanceAttr,
      required this.totalAmount,
      required this.supportKPI,
      this.suggestQty = 0.0,
      this.priority = 0,
      this.extendedAttributesV1 = "",
      this.skuProbabilityV1 = 0.0,
      this.startDateV1 = -1,
      this.endDateV1 = -1,
      this.activeStatusV1 = '',
      this.recommendationId = '',
      this.recommendationTag = '',
      this.basketId = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isFavourite': isFavourite,
      'batchCode': batchCode,
      'skuCode': skuCode,
      'pieceQuantity': pieceQuantity,
      'caseQuantity': caseQuantity,
      'skuPriority': skuPriority,
      'outletCode': outletCode,
      'recommendationType': recommendationType,
      'underperformanceAttr': underperformanceAttr,
      'suggestQty': suggestQty,
      'priority': priority,
      'totalAmount': totalAmount,
      'supportKPI': supportKPI,
      'extendedAttributesV1': extendedAttributesV1,
      'skuProbabilityV1': skuProbabilityV1,
      'startDateV1': startDateV1,
      'endDateV1': endDateV1,
      'activeStatusV1': activeStatusV1,
      'recommendationId': recommendationId,
      'recommendationTag': recommendationTag,
      'basketId': basketId,
    };
  }

  // Create a constructor that takes a map and creates an instance
  factory RecommendedOrdersV1.fromMap(Map<String, dynamic> map) {
    return RecommendedOrdersV1(
        id: map['id'] ?? 0,
        isFavourite: map['isFavourite'] ?? false,
        batchCode: map['batchCode'] ?? '',
        skuCode: map['skuCode'] ?? '',
        pieceQuantity: map['pieceQuantity'] ?? 0,
        caseQuantity: map['caseQuantity'] ?? 0,
        skuPriority: map['skuPriority'] ?? '',
        outletCode: map['outletCode'] ?? '',
        recommendationType: map['recommendationType'] ?? '',
        underperformanceAttr: map['underperformanceAttr'] ?? '',
        suggestQty: map['suggestQty'] ?? 0.0,
        priority: map['priority'] ?? 0,
        totalAmount: map['totalAmount'] ?? 0.0,
        supportKPI: map['supportKPI'] ?? '',
        skuProbabilityV1: map['skuProbability'] ?? 0.0,
        extendedAttributesV1: map['extendedAttributes'] ?? "",
        startDateV1: map['startDate'] ?? -1,
        endDateV1: map['endDate'] ?? -1,
        activeStatusV1: map['activeStatus'] ?? '',
        recommendationId: map['recommendationId'] ?? '',
        recommendationTag: map['recommendationTag'] ?? '',
        basketId: map['basketId'] ?? '');
  }
}
