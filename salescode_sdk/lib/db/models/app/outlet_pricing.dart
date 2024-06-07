import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletPricing {
  @Id()
  int id = 0;
  String outletCode;
  String productInfo;
  OutletPricing({
    this.id = 0,
    required this.outletCode,
    required this.productInfo,
  });
// toString() => 'Product{id: $id, name: $name,skuCode:$skuCode }';
}
