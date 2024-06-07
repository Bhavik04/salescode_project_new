import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SecondaryProductV1 {
  @Id()
  int id;
  @Index()
  String batchCode;
  @Index()
  String skuCode;
  String brand;
  @Index()
  String feature;
  String channel;
  bool tagVisibility;
  double quantity;
  int minQtyForEarnPoints;
  String secondaryProductTag;
  SecondaryProductV1({
    this.id = 0,
    required this.batchCode,
    required this.skuCode,
    required this.brand,
    required this.feature,
    required this.channel,
    required this.tagVisibility,
    required this.quantity,
    required this.minQtyForEarnPoints,
    required this.secondaryProductTag
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skuCode': skuCode,
      'batchCode': batchCode,
      'brand': brand,
      'channel': channel,
      'feature': feature,
      'quantity': quantity,
      "minQtyForEarnPoints": minQtyForEarnPoints,
      "secondaryProductTag" : secondaryProductTag
    };
  }
}
