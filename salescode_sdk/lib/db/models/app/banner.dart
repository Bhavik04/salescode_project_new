import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class BannerV1 {
  @Id()
  int id;
  String bannerName;
  String bannerDesc;
  @Unique(onConflict: ConflictStrategy.replace)
  String bannerId;
  int bannerSequence;
  String bannerType;
  String bannerTemplate;
  String mediaUrl;
  String mediaName;
  String fileName;
  String blobKey;
  List<String> batchCode;
  String elementComponents;
  String? bankName;
  String lastModifiedTime;
  String? bannerParentId;
  String extendedAttributesV2;
  int? bannerPriority;
  BannerV1({
    this.id = 0,
    required this.bannerName,
    required this.bannerDesc,
    required this.bannerId,
    required this.bannerSequence,
    required this.bannerType,
    required this.mediaName,
    required this.mediaUrl,
    required this.bannerTemplate,
    required this.fileName,
    required this.blobKey,
    required this.batchCode,
    required this.elementComponents,
    required this.extendedAttributesV2,
    this.bankName,
    this.bannerParentId,
    this.bannerPriority,
    required this.lastModifiedTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bannerName': bannerName,
      'bannerDesc': bannerDesc,
      'bannerId': bannerId,
      'bannerSequence': bannerSequence,
      'bannerType': bannerType,
      'mediaName': mediaName,
      'mediaUrl': mediaUrl,
      'bannerTemplate': bannerTemplate,
      'fileName': fileName,
      'blobKey': blobKey,
      'bannerPriority': bannerPriority,
      'batchCode': batchCode,
      'elementComponents': elementComponents,
      'bankName': bankName,
      'bannerParentId': bannerParentId,
      'lastModifiedTime': lastModifiedTime,
      'extendedAttributes': extendedAttributesV2
    };
  }

  factory BannerV1.fromMap(
      Map<String, dynamic> bannerObj, Map<String, dynamic> bannerTemplateObj) {
    return BannerV1(
        bannerName: bannerTemplateObj['bannerName'],
        bannerDesc: bannerTemplateObj['bannerDescription'],
        fileName: bannerObj['fileName'] ?? "",
        blobKey: bannerObj['blobKey'] ?? "",
        batchCode: [],
        bannerPriority: bannerObj['extendedAttributes']?['bannerPriority'] !=
                null
            ? int.tryParse(bannerObj['extendedAttributes']?['bannerPriority'])
            : null,
        bannerType: bannerObj['elementType'],
        bannerSequence:
            int.tryParse(bannerObj['elementNumber'].toString()) ?? 0,
        bannerId: bannerObj['id'],
        bannerTemplate: bannerTemplateObj['bannerType'],
        mediaUrl: bannerObj['mediaUrl'] ?? "",
        mediaName: bannerObj['mediaName'] ?? "",
        elementComponents: bannerObj['elementComponents'] != null ? jsonEncode(bannerObj['elementComponents']) : 'null',
        extendedAttributesV2:bannerObj['extendedAttributes'] !=null ? jsonEncode(bannerObj['extendedAttributes']) : '',
        bankName: bannerTemplateObj['extendedAttributes']?['bankName'] ?? '',
        bannerParentId: bannerTemplateObj['id'] ?? '',
        lastModifiedTime: bannerObj['lastModifiedTime'] ?? '');
  }
}
