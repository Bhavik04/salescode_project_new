class BannerUI {
  int id;
  String bannerName;
  String bannerDesc;
  String bannerId;
  int bannerSequence;
  String bannerType;
  String bannerTemplate;
  String mediaUrl;
  String mediaName;
  String fileName;
  String blobKey;
  int? bannerPriority;
  List<String> batchCode;
  String elementComponents;
  String extendedAttributes;
  String? bankName;
  String lastModifiedTime;
  String? bannerParentId;

  BannerUI({
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
    this.bannerPriority,
    required this.batchCode,
    required this.elementComponents,
    required this.extendedAttributes,
    this.bankName,
    this.bannerParentId,
    required this.lastModifiedTime,
  });

  factory BannerUI.fromMap(Map<String, dynamic> map) {
    return BannerUI(
        id: map['id'] as int,
        bannerName: map['bannerName'] as String,
        bannerDesc: map['bannerDesc'] as String,
        bannerId: map['bannerId'] as String,
        bannerSequence: map['bannerSequence'] as int,
        bannerType: map['bannerType'] as String,
        bannerTemplate: map['bannerTemplate'] as String,
        mediaUrl: map['mediaUrl'] as String,
        mediaName: map['mediaName'] as String,
        fileName: map['fileName'] as String,
        blobKey: map['blobKey'] as String,
        bannerPriority: map['bannerPriority'] ,
        batchCode: (map['batchCode'] as List<dynamic>).cast<String>(),
        elementComponents: map['elementComponents'] as String,
        bankName: map['bankName'] as String?,
        lastModifiedTime: map['lastModifiedTime'] as String,
        bannerParentId: map['bannerParentId'] as String?,
        extendedAttributes: map['extendedAttributes'] as String);
  }
}
