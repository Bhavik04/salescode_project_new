import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OrderModel {
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String orderNumber;
  String creationTime;
  String extendedAttributes;
  double billAmount;
  int lineCount;
  double netAmount;
  String referenceNumber;
  String remarks;
  String source;
  double totalAmount;
  double totalMrp;
  double totalQuantity;
  String type;
  String outletCode;
  String supplier;
  String status;
  double normalizedQuantity;
  String loginId;
  String discountInfo;
  String supplierName;
  String outletName;
  double totalCaseQuantity;
  double totalPieceQuantity;
  double totalOtherUnitQuantity;
  double couponValue;
  double discountValue;

  OrderModel(
      {this.id = 0,
      required this.orderNumber,
      required this.creationTime,
      required this.extendedAttributes,
      required this.billAmount,
      required this.lineCount,
      required this.netAmount,
      required this.referenceNumber,
      required this.remarks,
      required this.source,
      required this.totalAmount,
      required this.totalMrp,
      required this.totalQuantity,
      required this.type,
      required this.outletCode,
      required this.supplier,
      required this.status,
      required this.normalizedQuantity,
      required this.loginId,
      required this.discountInfo,
      required this.supplierName,
      required this.outletName,
      required this.totalCaseQuantity,
      required this.totalPieceQuantity,
      required this.totalOtherUnitQuantity,
      required this.discountValue,
      required this.couponValue});
}
