import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class NotificationModelV1 {
  @Id()
  int id = 0;
  @Index()
  String subject;
  @Index()
  String description;
  @Index()
  String blobKey;
  @Index()
  String creationTime;
  @Index()
  bool wasTapped;
  @Unique(onConflict: ConflictStrategy.replace)
  String notificationId;
  String mediaUrl;
  String subCategory;
  String category;
  String productCategory;
  Map<String, dynamic> payload;
  String? selectedSKU;
  String feature;
  String intentV1;
  String intentParamV1;

  NotificationModelV1({
    required this.subject,
    required this.description,
    required this.blobKey,
    required this.creationTime,
    required this.wasTapped,
    required this.notificationId,
    required this.mediaUrl,
    this.subCategory = "",
    required this.category,
    required this.productCategory,
    this.payload = const {},
    required this.selectedSKU,
    required this.feature,
    this.intentV1 = '',
    this.intentParamV1 = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'description': description,
      'blobKey': blobKey,
      'creationTime': creationTime,
      'wasTapped': wasTapped,
      'notificationId': notificationId,
      'mediaUrl': mediaUrl,
      'subCategory': subCategory,
      'category': category,
      'productCategory': productCategory,
      'payload': payload,
      'feature': feature,
      'selectedSKU': selectedSKU,
      'intentV1': intentV1,
      'intentParamV1': intentParamV1
    };
  }

  factory NotificationModelV1.fromMap(Map<String, dynamic> map) {
    return NotificationModelV1(
      subject: map['subject'] ?? "",
      description: map['description'] ?? "",
      blobKey: map['blobKey'] ?? "",
      creationTime: map['creationTime'] ?? "",
      wasTapped: map['wasTapped'] ?? false,
      notificationId: map['notificationId'] ?? "",
      mediaUrl: map['mediaUrl'] ?? "",
      subCategory: map['subCategory'] ?? "",
      category: map['category'] ?? "",
      productCategory: map['productCategory'] ?? "",
      payload: map['payload'] ?? {},
      selectedSKU: map['selectedSKU'] ?? "",
      feature: map['feature'] ?? "",
      intentV1: map['intentV1'] ?? "",
      intentParamV1: map['intentParamV1'] ?? "",
    );
  }
}
