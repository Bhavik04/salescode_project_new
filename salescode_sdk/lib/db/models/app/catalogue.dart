import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class CatalogueV1 {
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
  // Catalogue({this.text, DateTime? date}) : date = date ?? DateTime.now();
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
  double? basePackPtrV1;
  double? baseCasePtrV1;
  double packMrp;
  int mrp;
  double caseMrp;
  String feature;
  String sellingStory;
  String subCategoryCode;
  int recommendationPriority = 0;
  int customLevel;
  int level;
  int searchIndex;
  String isFavourite;
  String recommendationType;
  bool isRecommended;
  String offers;
  String supplier;
  double tax;
  String marketSkuCode;
  double otherUnitMrp;
  double otherUnitToPieceQuantity;
  double pieceToOtherUnitQuantity;
  double otherUnitPtr;
  String additionalSchemeDescription;
  String otherUnitName;
  String smartBuy;
  int stockQty;
  String groupIdV1;
  String recommendedAttributesV2;
  String maxBenefitStringV1;
  String itemDescV1;
  String uomV1;
  String buttonDescriptionV1;
  int pointsV1;
  String typeV1;
  int bandedMaxQuantityV1;
  int minQtyForEarnPoints;
  String recommendationId;
  String? translation;
  int? incentivePoints;
  String productCode;
  double srp;
  String returnCode;
  double discountMargin;
  bool outOfStock;
  bool isNotify;
  String secondaryProductTag;
  String eb2bCode;

  @Backlink()
  // final productPricing = ToMany<ProductMetadata>();
  CatalogueV1(
      {this.id = 0,
      required this.case2Piece,
      this.translation,
      required this.name,
      String? description,
      this.suggestedQty = 0,
      this.suggestedCaseQty = 0,
      required this.images,
      this.brand = '',
      this.productDescription = '',
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
      this.caseMrp = 0.0,
      this.mrp = 0,
      this.otherUnitMrp = 0.0,
      this.otherUnitToPieceQuantity = 0.0,
      this.pieceToOtherUnitQuantity = 0.0,
      this.otherUnitPtr = 0.0,
      this.otherUnitName = '',
      this.feature = "",
      this.offers = "",
      required this.skuCode,
      this.level = 0,
      this.tax = 0,
      this.customLevel = 0,
      String? batchCode,
      this.marketSkuCode = "",
      required this.lastModified,
      this.sellingStory = "",
      this.isFavourite = "false",
      this.searchIndex = 10000,
      this.recommendationType = '',
      this.isRecommended = false,
      this.subCategoryCode = "",
      this.supplier = "",
      this.additionalSchemeDescription = "",
      this.priority = 0,
      this.recommendationPriority = 0,
      this.stockQty = 0,
      this.groupIdV1 = '',
      required this.smartBuy,
      this.maxBenefitStringV1 = '',
      this.recommendedAttributesV2 = '',
      this.itemDescV1 = '',
      this.uomV1 = '',
      required this.buttonDescriptionV1,
      this.pointsV1 = 0,
      this.typeV1 = 'normal',
      required this.manufacturingDateV1,
      this.bandedMaxQuantityV1 = 99999,
      this.recommendationId = '',
      this.minQtyForEarnPoints = 0,
      this.productCode = '',
      this.incentivePoints,
      this.srp=0.0,
      this.discountMargin=0.0,
      this.eb2bCode = "",
      required this.returnCode,
      required this.secondaryProductTag,
      this.outOfStock = false,
      this.isNotify = false
      })
      : batchCode = batchCode ?? skuCode,
        description = description ?? '';
  toString() => 'Catalogue{id: $id, name: $name,skuCode:$skuCode }';

  factory CatalogueV1.fromMap(Map<String, dynamic> map) {
    return CatalogueV1(
        id: map['id'] ?? 0,
        lastModified: map['lastModified'],
        name: map['name'] ?? '',
        productDescription: map['productDescription'] ?? '',
        description: map['description'] ?? '',
        suggestedQty: map['suggestedQty'] ?? 0.0,
        suggestedCaseQty: map['suggestedCaseQty'] ?? 0.0,
        case2Piece: map['case2Piece'] ?? 0.0,
        images: (map['images'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        category: map['category'] ?? '',
        subCategory: map['subCategory'] ?? '',
        brand: map['brand'] ?? '',
        skuCode: map['skuCode'] ?? '',
        batchCode: map['batchCode'] ?? map['skuCode'] ?? '',
        priority: map['priority'] ?? 0,
        pieceSize: map['pieceSize'] ?? 0,
        pieceSizeDesc: map['pieceSizeDesc'] ?? '',
        suggestionText: map['suggestionText'] ?? '',
        productTag: map['productTag'] ?? '',
        itemClass: map['itemClass'] ?? '',
        packPtr: map['packPtr'] ?? 0.0,
        casePtr: map['casePtr'] ?? 0.0,
        basePackPtrV1: map['basePackPtrV1'],
        baseCasePtrV1: map['baseCasePtrV1'],
        packMrp: map['packMrp'] ?? 0.0,
        caseMrp: map['caseMrp'] ?? 0.0,
        mrp: map['mrp'] ?? 0,
        feature: map['feature'] ?? '',
        sellingStory: map['sellingStory'] ?? '',
        subCategoryCode: map['subCategoryCode'] ?? '',
        level: map['level'] ?? 0,
        searchIndex: map['searchIndex'] ?? 10000,
        isFavourite: map['isFavourite'] ?? 'false',
        recommendationType: map['recommendationType'] ?? '',
        isRecommended: map['isRecommended'] ?? false,
        offers: map['offers'] ?? '',
        supplier: map['supplier'] ?? '',
        recommendationPriority: map['recommendationPriority'] ?? 999,
        marketSkuCode: map['marketSkuCode'] ?? '',
        otherUnitMrp: map['otherUnitMrp'] ?? 0.0,
        otherUnitToPieceQuantity: map['otherUnitToPieceQuantity'] ?? 0.0,
        pieceToOtherUnitQuantity: map['pieceToOtherUnitQuantity'] ?? 0.0,
        otherUnitPtr: map['otherUnitPtr'] ?? 0.0,
        additionalSchemeDescription: map['additionalSchemeDescription'] ?? '',
        otherUnitName: map['otherUnitName'] ?? '',
        smartBuy: map['smartBuy'] ?? '',
        stockQty: map['stockQty'] ?? 0,
        tax: map['tax'] ?? 0.0,
        uomV1: map['uomV1'] ?? '',
        pointsV1: map['pointsV1'] ?? 0,
        buttonDescriptionV1: map['buttonDescriptionV1'] ?? "",
        typeV1: map['typeV1'] ?? "",
        groupIdV1: map['groupIdV1'] ?? '',
        manufacturingDateV1: map['manufacturingDateV1'] ?? "",
        bandedMaxQuantityV1: map['bandedMaxQuantityV1'] ?? "",
        recommendationId: map['recommendationId'] ?? "",
        minQtyForEarnPoints: map['minQtyForEarnPoints'] ?? 0,
        translation: map['translation'],
        incentivePoints: map['incentivePoints'],
        recommendedAttributesV2: map['recommendedAttributesV2'] ?? '',
        productCode: map['productCode'] ?? '',
        itemDescV1: map['itemDescV1'] ?? '',
        srp: map['srp'] ?? 0.0,
        returnCode:map['returnCode'] ?? "",
        discountMargin: map['discountMargin'] ?? 0.0,
        secondaryProductTag:map['secondaryProductTag']??"",
        outOfStock: map['outOfStock'] ?? false,
        isNotify: map['isNotify'] ?? false,
        eb2bCode: map['eb2bCode'] ?? ""
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lastModified': lastModified,
      'name': name,
      'productDescription': productDescription,
      'description': description,
      'suggestedQty': suggestedQty,
      'suggestedCaseQty': suggestedCaseQty,
      'case2Piece': case2Piece,
      'images': images,
      'category': category,
      'subCategory': subCategory,
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
      'basePackPtrV1': basePackPtrV1,
      'baseCasePtrV1': baseCasePtrV1,
      'packMrp': packMrp,
      'mrp': mrp,
      'caseMrp': caseMrp,
      'feature': feature,
      'sellingStory': sellingStory,
      'subCategoryCode': subCategoryCode,
      'level': level,
      'searchIndex': searchIndex,
      'isFavourite': isFavourite,
      'recommendationType': recommendationType,
      'isRecommended': isRecommended,
      'offers': offers,
      'supplier': supplier,
      'marketSkuCode': marketSkuCode,
      'otherUnitMrp': otherUnitMrp,
      'otherUnitToPieceQuantity': otherUnitToPieceQuantity,
      'pieceToOtherUnitQuantity': pieceToOtherUnitQuantity,
      'otherUnitPtr': otherUnitPtr,
      'additionalSchemeDescription': additionalSchemeDescription,
      'otherUnitName': otherUnitName,
      'smartBuy': smartBuy,
      'stockQty': stockQty,
      'recommendationPriority': recommendationPriority,
      'tax': tax,
      'uomV1': uomV1,
      'pointsV1': pointsV1,
      'buttonDescriptionV1': buttonDescriptionV1,
      'typeV1': typeV1,
      'groupIdV1': groupIdV1,
      'manufacturingDateV1': manufacturingDateV1,
      'bandedMaxQuantityV1': bandedMaxQuantityV1,
      'minQtyForEarnPoints': minQtyForEarnPoints,
      'recommendationId': recommendationId,
      'translation': translation,
      'incentivePoints': incentivePoints,
      'recommendedAttributesV2': recommendedAttributesV2,
      'itemDescV1': itemDescV1,
      'productCode': productCode,
      'srp': srp,
      'returnCode' : returnCode,
      'discountMargin': discountMargin,
      'secondaryProductTag':secondaryProductTag,
      'outOfStock': outOfStock,
      'isNotify': isNotify,
      'eb2bCode' : eb2bCode
    };
  }
} // find() returns List<Person>
