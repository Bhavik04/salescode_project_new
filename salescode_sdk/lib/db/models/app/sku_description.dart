import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SkuDescriptionV1 {
  @Id()
  int id;

  @Index()
  String skuCode;
  String skuDescription;

  SkuDescriptionV1({
    this.id = 0,
    required this.skuCode,
    this.skuDescription = "",
  });
}
