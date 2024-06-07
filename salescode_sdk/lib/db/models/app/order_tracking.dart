import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OrderTrackingModelV1 {
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String orderNumber;
  String creationTime;
  String lastModifiedTime;
  String extendedAttributes;
  String lob;
  double billAmount;
  int lineCount;
  double netAmount;
  String referenceNumber;
  String remarks;
  String source;
  double totalAmount;
  double totalInitialAmt;
  double totalInitialQuantity;
  double totalMrp;
  double totalQuantity;
  String type;
  String outletCode;
  String supplier;
  String status;
  String channel;
  double normalizedQuantity;
  double initialNormalizedQuantity;
  String systemTime;
  String loginId;
  String discountInfo;
  double normalizedVolume;
  String processingStatus;
  String supplierName;
  String outletName;
  String outletMobile;
  String orderDetails;
  double totalCaseQuantity;
  double totalPieceQuantity;
  double totalOtherUnitQuantity;
  String orderHistory;
  bool edit;
  String statusReasonV1;
  // @Index()

  OrderTrackingModelV1(
      {this.id = 0,
      this.orderNumber = "",
      required this.creationTime,
      required this.lastModifiedTime,
      required this.extendedAttributes,
      required this.lob,
      required this.billAmount,
      required this.lineCount,
      required this.netAmount,
      required this.referenceNumber,
      required this.remarks,
      required this.source,
      required this.totalAmount,
      required this.totalInitialAmt,
      required this.totalInitialQuantity,
      required this.totalMrp,
      required this.totalQuantity,
      required this.type,
      required this.outletCode,
      required this.supplier,
      required this.status,
      required this.channel,
      required this.normalizedQuantity,
      required this.initialNormalizedQuantity,
      required this.systemTime,
      required this.loginId,
      required this.discountInfo,
      required this.normalizedVolume,
      required this.processingStatus,
      required this.supplierName,
      required this.outletName,
      required this.outletMobile,
      required this.orderDetails,
      required this.totalCaseQuantity,
      required this.totalPieceQuantity,
      required this.totalOtherUnitQuantity,
      required this.orderHistory,
      required this.edit,
      required this.statusReasonV1});
}
