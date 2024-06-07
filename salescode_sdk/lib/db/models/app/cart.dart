// ignore_for_file: unnecessary_this

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class CartV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  DateTime manufacturingDateV1;
  //
  // @Transient() // Make this field ignored, not stored in the database.
  // int? notPersisted;
  //
  // // An empty default constructor is needed but you can use optional args.
  // Product({this.text, DateTime? date}) : date = date ?? DateTime.now();
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String refId;
  @Index()
  String batchCode;
  @Index()
  String outletCode;
  int pieceQuantity;
  int caseQuantity;
  int otherUnitQuantity;
  String qtyUnit;
  double amount;
  double price;
  double margin;
  double netPtr;
  double maxDiscount;
  double volume;
  double savings;
  String skuDesc;
  List<String> visitedOffers;
  String supplier;
  String itemDescV1;
  int stockQtyV1;
  String typeV1;
  String buttonDescriptionV1;
  int creditQty;
  double ssp;
  double discountMargin;

  @Backlink()
  CartV1(
      {this.id = 0,
      this.refId = "",
      this.savings = 0,
      this.volume = 0,
      this.maxDiscount = 0,
      this.netPtr = 0,
      this.margin = 0,
      this.amount = 0,
      this.price = 0,
      this.qtyUnit = '',
      this.caseQuantity = 0,
      this.outletCode = '',
      this.batchCode = '',
      this.pieceQuantity = 0,
      this.otherUnitQuantity = 0,
      this.skuDesc = '',
      required this.lastModified,
      required this.visitedOffers,
      required this.supplier,
      this.stockQtyV1 = 0,
      required this.itemDescV1,
      this.typeV1 = '',
      required this.buttonDescriptionV1,
      required this.manufacturingDateV1,
      this.creditQty = 0,
      this.ssp=0.0,
      this.discountMargin=0.0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lastModified': lastModified,
      'refId': refId,
      'batchCode': batchCode,
      'outletCode': outletCode,
      'pieceQuantity': pieceQuantity,
      'caseQuantity': caseQuantity,
      'otherUnitQuantity': otherUnitQuantity,
      'qtyUnit': qtyUnit,
      'amount': amount,
      'price': price,
      'margin': margin,
      'netPtr': netPtr,
      'maxDiscount': maxDiscount,
      'volume': volume,
      'savings': savings,
      'skuDesc': skuDesc,
      'visitedOffers': visitedOffers,
      'supplier': supplier,
      'type': typeV1,
      'manufacturingDate': manufacturingDateV1,
      'buttonDescription': buttonDescriptionV1,
      'creditQty': creditQty,
      'ssp': ssp,
      'discountMargin': discountMargin
    };
  }
}
