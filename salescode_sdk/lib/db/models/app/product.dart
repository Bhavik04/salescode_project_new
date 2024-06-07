import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';


@Entity()
class ProductV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  //
  // @Transient() // Make this field ignored, not stored in the database.
  // int? notPersisted;
  //
  // // An empty default constructor is needed but you can use optional args.
  // Product({this.text, DateTime? date}) : date = date ?? DateTime.now();
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @Index()
  String name;
  String description;
  String productDescription;
  double suggestedQty;
  double suggestedCaseQty;
  double case2Piece;
  List<String> images;
  @Index()
  String category;
  @Index()
  String subCategory;
  String subCategoryCode;

  @Index()
  String brand = "";
  @Index()
  String skuCode;
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String batchCode;
  @Index()
  int priority = 0;
  @Index()
  int pieceSize;
  String pieceSizeDesc;
  @Index()
  String suggestionText;
  @Index()
  String productTag;
  @Index()
  String itemClass;
  double packPtr;
  double casePtr;
  double packMrp;
  int mrp;
  double caseMrp;
  String skuPriority;
  String supplier;
  double tax;
  String marketSkuCode;
  double otherUnitMrp;
  double otherUnitToPieceQuantity;
  double pieceToOtherUnitQuantity;
  double otherUnitPtr;
  String otherUnitName;
  String smartBuy;
  String groupIdV1;
  String itemDescV1;
  String uomV1;
  DateTime manufacturingDateV1;
  String buttonDescriptionV1;
  double? basePackPtrV1;
  double? baseCasePtrV1;
  String translation;
  String productType;
  String productCode;
  double srp;
  String returnCode;
  double discountMargin;
  String eb2bCode;

  @Backlink()
  // final productPricing = ToMany<ProductMetadata>();
  ProductV1(
      {this.id = 0,
      this.productType = "",
      this.productDescription = "",
      this.productCode = "",
      required this.case2Piece,
      required this.name,
      String? description,
      this.suggestedQty = 0,
      this.suggestedCaseQty = 0,
      required this.images,
      this.brand = '',
      this.category = '',
      this.subCategory = '',
      this.pieceSize = 0,
      this.pieceSizeDesc = '',
      this.suggestionText = '',
      this.productTag = '',
      this.itemClass = '',
      this.packPtr = 0.0,
      this.casePtr = 0.0,
      this.basePackPtrV1,
      this.baseCasePtrV1,
      this.packMrp = 0.0,
      this.mrp = 0,
      this.caseMrp = 0.0,
      this.otherUnitMrp = 0.0,
      this.otherUnitToPieceQuantity = 0.0,
      this.pieceToOtherUnitQuantity = 0.0,
      this.otherUnitPtr = 0.0,
      this.otherUnitName = '',
      this.skuPriority = '',
      this.marketSkuCode = '',
      required this.skuCode,
      this.supplier = "",
      required this.smartBuy,
      String? batchCode,
      required this.lastModified,
      this.priority = 0,
      this.tax = 0,
      this.uomV1 = '',
      this.groupIdV1 = '',
      required this.subCategoryCode,
      required this.itemDescV1,
      required this.buttonDescriptionV1,
      required this.manufacturingDateV1,
      required this.translation,
      this.discountMargin=0.0,
      this.srp=0.0,
      required this.returnCode,
      this.eb2bCode =""})
      : batchCode = batchCode ?? skuCode,
        description = description ?? '';
  toString() => 'Product{id: $id, name: $name,skuCode:$skuCode }';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productDescription': productDescription,
      'lastModified': lastModified.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'suggestedQty': suggestedQty,
      'suggestedCaseQty': suggestedCaseQty,
      'case2Piece': case2Piece,
      'images': images,
      'category': category,
      'subCategory': subCategory,
      'subCategoryCode': subCategoryCode,
      'brand': brand,
      'skuCode': skuCode,
      'batchCode': batchCode,
      'priority': priority,
      'pieceSize': pieceSize,
      'pieceSizeDesc': pieceSizeDesc,
      'suggestionText': suggestionText,
      'productTag': productTag,
      'itemClass': itemClass,
      'packPtr': packPtr,
      'casePtr': casePtr,
      'packMrp': packMrp,
      'mrp': mrp,
      'caseMrp': caseMrp,
      'skuPriority': skuPriority,
      'supplier': supplier,
      'marketSkuCode': marketSkuCode,
      'otherUnitMrp': otherUnitMrp,
      'otherUnitToPieceQuantity': otherUnitToPieceQuantity,
      'pieceToOtherUnitQuantity': pieceToOtherUnitQuantity,
      'otherUnitPtr': otherUnitPtr,
      'otherUnitName': otherUnitName,
      'smartBuy': smartBuy,
      'tax': tax,
      'groupIdV1': groupIdV1,
      'uomV1': uomV1,
      'manufacturingDateV1': manufacturingDateV1,
      'buttonDescriptionV1': buttonDescriptionV1,
      'basePackPtrV1': basePackPtrV1,
      'baseCasePtrV1': baseCasePtrV1,
      'translation': translation,
      'productType': productType,
      'itemDescV1': itemDescV1,
      'productCode': productCode,
      'srp': srp,
      'discountMargin': discountMargin,
      'eb2bCode' : eb2bCode,
      'returnCode': returnCode
    };
  }

  factory ProductV1.fromMap(dynamic data) {
    String skuDescription = data['skuDescription'] ?? "";
    DateTime now = DateTime.now();
    // if (ConfigurationDictionary
    //         .catalogueConfiguration.skuDescriptionCustomization ==
    //     "true") {
    //   skuDescription =
    //       "${data['skuDescription']} (${data['caseToPieceQuantity'].toInt()} X ${getPieceSizeLabel(data['pieceSize'].toString())})";
    // }
    var product = ProductV1(
      productType: data?["categoryCode"] ?? "",
      productCode: data?["productCode"] ?? "",
      skuCode: data['skuCode'] ?? '',
      name: data['skuName'] ?? '',
      description: skuDescription,
      suggestedQty: 0,
      images: [data['blobKey'] ?? 'assets/images/unknown.png'] ?? [],
      category: data['category'] ?? "",
      brand: data['brand'] ?? "",
      subCategory: data['subCategory'] ?? "",
      pieceSize: int.tryParse(data['pieceSize'] ?? "0") ?? 0,
      pieceSizeDesc: data['pieceSizeDesc'] ?? "",
      suggestionText: data['suggestionText'] ?? data['skuDescription'] ?? "",
      productTag: "",
      skuPriority: "0",
      // uomV1:
      //     ConfigurationDictionary.catalogueConfiguration.orderUomCheck != "null"
      //         ? data['uom'] ?? "ALL"
      //         : "ALL",
      uomV1: "ALL",
      itemClass: data['itemClass'] ?? "",
      lastModified: DateTime.now(),
      case2Piece: data['caseToPieceQuantity'] ?? 0,
      subCategoryCode: data["subCategoryCode"] ?? '',
      marketSkuCode: data['marketSkuCode'] ?? "",
      otherUnitToPieceQuantity: data['otherUnitToPieceQuantity'] ?? 0,
      pieceToOtherUnitQuantity: data['pieceToOtherUnitQuantity'] ?? 0,
      otherUnitName: data['otherUnitName'] ?? '',
      smartBuy: data['smartBuy'] ?? '',
      priority: data['priority'] == 0 || data['priority'] == null
          ? 999999
          : data['priority'],
      itemDescV1: data["itemDesc"] ?? "",
      buttonDescriptionV1: "",
      translation: jsonEncode(data['translation']),
      manufacturingDateV1: DateTime(now.year, now.month, now.day),
      srp: data["srp"] ?? 0.0,
      returnCode: data['returnCode'] ?? "",
      discountMargin: data["discountMargin"] ?? 0.0,
      eb2bCode: data['eb2bCode'] ?? ""
    );
    return product;
  }
  

  factory ProductV1.toProduct(
      dynamic pm, dynamic data) {

    List<String> getImageBlobs(dynamic data) {
      List<String> imageBlobs = [
        'blobKey',
        'blobKey_a',
        'blobKey_b',
        'blobKey_c',
        'blobKey_f',
        'blobKey_l',
      ];

      imageBlobs = [
        for (var key in imageBlobs) data.containsKey(key) ? (data?[key]) : '',
      ]..removeWhere((blob) => blob == '');

      if (imageBlobs.isEmpty) {
        imageBlobs = ['assets/images/unknown.png'];
      }

      return imageBlobs;
    }

    String skuDescription = data['skuDescription'] ?? "";
    if (data?['skuDescription'] == null || data?['skuDescription'] == '') {
      skuDescription = data['skuName'] ?? '';
    }
    // if (ConfigurationDictionary
    //         .catalogueConfiguration.skuDescriptionCustomization ==
    //     "true") {
    //   skuDescription =
    //       "${data['skuDescription']} (${data['caseToPieceQuantity'].toInt()} X ${getPieceSizeLabel(data['pieceSize'].toString())})";
    // }
    // if (ConfigurationDictionary.orderConfiguration.enableDynamicPrices ==
    //     "true") {
    //   if (bandedPricingService
    //       .checkIfBandedPricingExistForProduct(data['batchCode'])) {
    //     doBandedCalculations = true;
    //   }
    // }

    int caseToPieceQuantity = pm.caseToPieceQuantity;
    int pieceToOtherUnitQuantity = pm.pieceToOtherUnitQuantity;
    int otherUnitToPieceQuantity = pm.otherUnitToPieceQuantity;
    List<String> imageBlobs=getImageBlobs(data);

    var product = ProductV1(
      productDescription: data?["productDescription"] ?? "",
      productType: data?["categoryCode"] ?? "",
      productCode: data?["productCode"] ?? "",
      srp: pm.srp ?? 0.0,
      discountMargin:pm.discountMargin??0.0,
      skuCode: data['skuCode'] ?? '',
      name: data['skuName'] ?? '',
      description: skuDescription,
      suggestedQty: 0,
      // packPtr: doBandedCalculations
      //     ? bandedPricingService.baseCalculationForSingleProduct(
      //         data['batchCode'], pm.packPtr, 0)
      //     : pm.packPtr,
      packPtr: pm.packPtr,
      // casePtr: doBandedCalculations
      //     ? bandedPricingService.baseCalculationForSingleProduct(
      //         data['batchCode'], pm.casePtr, 0)
      //     : pm.casePtr,
      casePtr: pm.casePtr,
      packMrp: pm.packMrp,
      mrp: pm.packMrp.toInt(),
      caseMrp: pm.caseMrp,
      baseCasePtrV1: pm.casePtr,
      basePackPtrV1: pm.packPtr,
      images: imageBlobs,
      // images: [data['blobKey'] ?? 'assets/images/unknown.png'] ?? [],
      category: data['category'] ?? "",
      brand: data['brand'] ?? "",
      subCategory: data['subCategory'] ?? "",
      pieceSize: int.tryParse(data['pieceSize'] ?? "0") ?? 0,
      pieceSizeDesc: data['pieceSizeDesc'] ?? "",
      suggestionText: data['suggestionText'] ?? data['skuDescription'] ?? "",
      productTag: "",
      skuPriority: "0",
      // uomV1:
      //     ConfigurationDictionary.catalogueConfiguration.orderUomCheck != "null"
      //         ? data['uom'] ?? "ALL"
      //         : "ALL",
      uomV1: "ALL",
      itemClass: data['itemClass'] ?? "",
      lastModified: DateTime.now(),
      case2Piece: caseToPieceQuantity > 0
          ? caseToPieceQuantity.toDouble()
          : (data['caseToPieceQuantity'] ?? 0),
      subCategoryCode: data["subCategoryCode"] ?? '',
      tax: pm.tax,
      marketSkuCode: data['marketSkuCode'] ?? "",
      // supplier: pm.supplier != ""
      //     ? pm.supplier
      //     : supplierList.isNotEmpty
      //         ? supplierList.first.supplierId
      //         : "",
      supplier: "",
      otherUnitMrp: pm.otherUnitMrp,
      otherUnitToPieceQuantity: otherUnitToPieceQuantity > 0
          ? otherUnitToPieceQuantity.toDouble()
          : (data['otherUnitToPieceQuantity'] ?? 0.0),
      pieceToOtherUnitQuantity: pieceToOtherUnitQuantity > 0
          ? pieceToOtherUnitQuantity.toDouble()
          : (data['pieceToOtherUnitQuantity'] ?? 0),
      otherUnitPtr: pm.otherUnitPtr,
      otherUnitName: data['otherUnitName'] ?? '',
      smartBuy: data['smartBuy'] ?? '',
      groupIdV1: data['groupId'] ?? pm.groupIdV1 ?? '',
      priority: data['priority'] == 0 || data['priority'] == null
          ? 999999
          : data['priority'],
      itemDescV1: data["itemDesc"] ?? "",
      manufacturingDateV1: pm.manufacturingDateV1,
      buttonDescriptionV1: pm.buttonDescriptionV1,
      translation: jsonEncode(data['translation'],),
      eb2bCode: data['eb2bCode']??'',
      returnCode: data['returnCode'] ?? ""
    );
    return product;
    
  }

    
}
