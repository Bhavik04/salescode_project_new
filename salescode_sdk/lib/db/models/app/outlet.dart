import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletV1 {
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  @Index()
  String outletName;
  @Index()
  String activeStatus;
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String outletCode;
  @Index()
  String beatName;
  @Index()
  String beat;
  String address;
  @Index()
  String contactno;
  String displayAddress;
  @Index()
  String channel;
  String location;
  String hierarchy;
  String subChannel;
  String immediateParent;
  String userName;
  String lastOrderDate;
  String outletType;
  String mapped;
  String latitude;
  String longitude;
  String ownerName;
  String dob;
  String doa;
  String outletClass;
  String foodsTier;
  String blobkey;
  String recommendationData;
  bool pjp;
  bool crossSell;
  bool recover;
  bool mustOrder;
  bool focusProduct;
  String searchableString;
  String branch;
  String supplier;
  String outletCategory;
  String outletProbabilityV1;
  String marketIdV1;
  String payoutSmsLink;
  String expiryDate;
  String? ondcProvider;
  String outletDivision;
  String clientBe;
  String acoholCheck;
  String distributionChannel;
  int? incentivePoints;
  String salesRep;
  double availableCredit;
  double totalCredit;
  String creditStatus;
  String? customerType;
  String? deliveryplant;
  String? srName;
  String? srId;
  String? emtDiscount;

  OutletV1(
      {required this.hierarchy,
      required this.lastModified,
      required this.outletName,
      required this.outletCode,
      required this.immediateParent,
      required this.activeStatus,
      required this.address,
      required this.beat,
      required this.beatName,
      String? displayAddress,
      required this.contactno,
      required this.channel,
      required this.subChannel,
      required this.location,
      required this.userName,
      required this.lastOrderDate,
      required this.outletType,
      required this.mapped,
      required this.latitude,
      required this.longitude,
      required this.ownerName,
      required this.dob,
      required this.doa,
      required this.outletClass,
      required this.foodsTier,
      required this.blobkey,
      required this.recommendationData,
      required this.pjp,
      required this.crossSell,
      required this.recover,
      required this.searchableString,
      required this.mustOrder,
      required this.focusProduct,
      required this.branch,
      required this.supplier,
      required this.outletCategory,
      required this.marketIdV1,
      this.outletProbabilityV1 = '',
      this.payoutSmsLink = '',
      this.expiryDate = '',
      this.ondcProvider,
      this.clientBe = '',
      this.acoholCheck = '',
      this.distributionChannel = '',
      required this.outletDivision,
      this.incentivePoints,
      required this.salesRep,
      this.availableCredit = 0,
      this.totalCredit = 0,
      this.creditStatus = '0',
      this.customerType = '',
      this.deliveryplant,
      this.srName,
      this.srId,
      this.emtDiscount = ''})
      : this.displayAddress = displayAddress ??= address;

  Map<String, dynamic> toMap() {
    return {
      'hierarchy': hierarchy,
      'lastModified': lastModified,
      'outletName': outletName,
      'outletCode': outletCode,
      'immediateParent': immediateParent,
      'activeStatus': activeStatus,
      'address': address,
      'beat': beat,
      'beatName': beatName,
      'displayAddress': displayAddress,
      'contactno': contactno,
      'channel': channel,
      'subChannel': subChannel,
      'location': location,
      'userName': userName,
      'lastOrderDate': lastOrderDate,
      'outletType': outletType,
      'mapped': mapped,
      'latitude': latitude,
      'longitude': longitude,
      'ownerName': ownerName,
      'dob': dob,
      'doa': doa,
      'outletClass': outletClass,
      'foodsTier': foodsTier,
      'blobkey': blobkey,
      'recommendationData': recommendationData,
      'pjp': pjp,
      'crossSell': crossSell,
      'recover': recover,
      'searchableString': searchableString,
      'mustOrder': mustOrder,
      'focusProduct': focusProduct,
      'branch': branch,
      'supplier': supplier,
      'outletCategory': outletCategory,
      'outletProbability': outletProbabilityV1,
      'payoutSmsLink': payoutSmsLink,
      'expiryDate': expiryDate,
      'ondcProvider': ondcProvider,
      'outletDivision': outletDivision,
      'acoholCheck': acoholCheck,
      'clientBe': clientBe,
      'distributionChannel': distributionChannel,
      'incentivePoints': incentivePoints,
      'salesRep': salesRep,
      'availableCredit': availableCredit,
      'totalCredit': totalCredit,
      'creditStatus': creditStatus,
      'customerType': customerType,
      'deliveryplant': deliveryplant,
      'srName': srName,
      'srId': srId,
      'emtDiscount': emtDiscount
    };
  }

  factory OutletV1.fromMap(Map<String, dynamic> data) {
    var extendedAttr = data['extendedAttributes'];
    OutletV1 outlet = OutletV1(
        clientBe: extendedAttr?["clientebe"] ?? '',
        acoholCheck: extendedAttr?["venta_alcohol"] ?? '',
        immediateParent: data['immediateParent'] ?? '',
        beat: data['beat'] ?? '',
        beatName: data['beatName'] ?? '',
        userName: data['contactName'] ?? '',
        lastOrderDate: data['lastOrderDate'] ?? '',
        outletType: data['outletType'] ?? '',
        mapped: data['mapped'].toString() ?? '',
        latitude: data['latitude'].toString() ?? '',
        longitude: data['longitude'].toString() ?? '',
        outletClass: data['outletClass'] ?? '',
        contactno: data['contactno'] ?? '',
        location: jsonEncode(data['location'] ?? ''),
        hierarchy: data['hierarchy'] ?? '',
        address: data['address'] ?? '',
        outletName: data['outletName'] ?? '',
        outletDivision: data['outletDivision'] ?? '',
        outletCode: data['outletCode'] ?? '',
        activeStatus: data['activeStatus'] ?? '',
        channel: data['channel'] ?? "",
        subChannel: data['subChannel'] ?? "",
        lastModified: DateTime.now(),
        ownerName: data['contactName'] ?? '',
        dob: extendedAttr?['dob'] ?? '',
        doa: extendedAttr?['doa'] ?? '',
        foodsTier: extendedAttr?['foodsTier'] ?? '',
        blobkey: extendedAttr?['blobkey'] ?? '',
        recommendationData: "",
        branch: (extendedAttr?['supplier'] != null &&
                extendedAttr?['supplier']?.toList().isNotEmpty)
            ? extendedAttr['supplier'][0]
            : '',
        supplier: (extendedAttr?['supplier'] != null &&
                extendedAttr?['supplier']?.toList().isNotEmpty)
            ? extendedAttr['supplier'][0]
            : '',
        pjp: false,
        crossSell: false,
        recover: false,
        searchableString: "",
        mustOrder: false,
        focusProduct: false,
        outletCategory: data["outletCategory"] ?? "",
        marketIdV1: data["marketId"] ?? "",
        payoutSmsLink: (extendedAttr?['PayoutSMSLinkDetails'] != null &&
                extendedAttr?['PayoutSMSLinkDetails'].isNotEmpty)
            ? extendedAttr['PayoutSMSLinkDetails']['PWALink']
            : '',
        expiryDate: (extendedAttr?['PayoutSMSLinkDetails'] != null &&
                extendedAttr?['PayoutSMSLinkDetails'].isNotEmpty)
            ? extendedAttr['PayoutSMSLinkDetails']['expiryDate']
            : '',
        distributionChannel: data['distributionChannel'] ?? "",
        salesRep: '31214',
        ondcProvider: extendedAttr['ONDCProvider'],
        availableCredit: data['availableCredit'] ?? 0,
        totalCredit: data['totalCredit'] ?? 0,
        creditStatus: data['creditStatus'] ?? '0',
        customerType: data['source'] ?? "",
        deliveryplant: data['marketId'] ?? '',
        srName: extendedAttr?['srname'] ?? '',
        srId: extendedAttr?['srid'] ?? '',
        emtDiscount: extendedAttr?['emt'] ?? '');
    return outlet;
  }
}
