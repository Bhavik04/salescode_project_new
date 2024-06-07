import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ProductMetadataV1 {
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
  String name;
  double packPtr;
  double casePtr;
  double packMrp;
  double caseMrp;
  double srp;
  String description;
  double quantity;
  double case2Piece;
  String supplier;
  String activeStatus;
  double otherUnitMrp;
  double otherUnitPtr;
  String? groupIdV1;
  String buttonDescriptionV1;
  double discountMargin;

  @Index()
  String skuCode;
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String batchCode;
  String outletCode;
  double tax;
  double specialPrice;
  int caseToPieceQuantity;
  int caseToOtherUnitQuantity;
  int otherUnitToPieceQuantity;
  int pieceToOtherUnitQuantity;

  @Backlink()
  ProductMetadataV1(
      {this.id = 0,
      this.discountMargin=0.0,
      this.case2Piece = 1,
      required this.name,
      String? description,
      this.quantity = 0,
      required this.skuCode,
      String? batchCode,
      required this.lastModified,
      required this.casePtr,
      required this.packPtr,
      required this.caseMrp,
      required this.packMrp,
      required this.supplier,
      this.tax = 0,
      required this.activeStatus,
      required this.otherUnitMrp,
      required this.otherUnitPtr,
      required this.manufacturingDateV1,
      this.groupIdV1,
      required this.buttonDescriptionV1,
      required this.outletCode,
      required this.specialPrice,
      required this.caseToPieceQuantity,
      required this.caseToOtherUnitQuantity,
      required this.otherUnitToPieceQuantity,
      required this.pieceToOtherUnitQuantity,
      this.srp =0.0})
      : batchCode = batchCode ?? skuCode,
        description = description ?? '';

  factory ProductMetadataV1.fromMap(Map<String, dynamic> data) {
    var productMetadata = ProductMetadataV1(
      discountMargin:double.parse(data?['extendedAttributes']?['m']??"0.0"),
      specialPrice: 0.0,
      skuCode: data['skuCode'] ?? '',
      name: '',
      description: '',
      quantity: 1,
      lastModified: DateTime.now(),
      casePtr: data['casePtr'] ?? 0.0,
      packPtr: data['packPtr'] ?? 0.0,
      caseMrp: data['caseMrp'] ?? 0.0,
      packMrp: data['mrp'] ?? 0.0,
      supplier: data['supplier'] ?? '',
      activeStatus: 'active',
      tax: data['tax'] != null ? double.parse(data['tax']) : 0,
      otherUnitMrp: (data['otherUnitMrp']) ?? 0.0,
      otherUnitPtr: data['otherUnitPtr'].toDouble() ?? 0.0,
      groupIdV1: data['extendedAttributes']?['GroupName'] ?? "",
      buttonDescriptionV1:
          data['extendedAttributes']?['ButtonDescription'] ?? '',
      manufacturingDateV1: DateTime.parse(
          data['extendedAttributes']?['manufacturingDate'] ?? "1199-02-27"),
      outletCode: data["outletCode"] ?? "",
      caseToPieceQuantity: (data['caseToPieceQuantity'] ?? 0).toInt(),
      caseToOtherUnitQuantity: (data['caseToOtherUnitQuantity'] ?? 0).toInt(),
      otherUnitToPieceQuantity: (data['otherUnitToPieceQuantity'] ?? 0).toInt(),
      pieceToOtherUnitQuantity: (data['pieceToOtherUnitQuantity'] ?? 0).toInt(),
      srp: data['ssp'] ?? 0.0,
    );
    return productMetadata;
  }
}
