import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OrderDetails {
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String referenceNumber;
  String extendedAttributes;
  double billAmount;
  double netAmount;
  String batchCode;
  String outletCode;
  String supplier;
  double normalizedQuantity;
  double initialAmount;
  double initialQuantity;
  double mrp;
  double price;
  double casePrice;
  String productInfo;
  String loginId;
  String discountInfo;
  double caseQuantity;
  double pieceQuantity;
  double otherUnitQuantity;
  double couponValue;
  double discountValue;
  String orderNumber;

  OrderDetails(
      {this.id = 0,
      required this.extendedAttributes,
      required this.billAmount,
      required this.netAmount,
      required this.referenceNumber,
      required this.batchCode,
      required this.initialAmount,
      required this.initialQuantity,
      required this.mrp,
      required this.price,
      required this.casePrice,
      required this.productInfo,
      required this.outletCode,
      required this.supplier,
      required this.normalizedQuantity,
      required this.loginId,
      required this.discountInfo,
      required this.caseQuantity,
      required this.pieceQuantity,
      required this.otherUnitQuantity,
      required this.discountValue,
      required this.couponValue,
      required this.orderNumber});
}
