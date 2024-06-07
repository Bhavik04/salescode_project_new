import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class InventoryModelV1 {
  @Id()
  int id = 0;
  String skuCode;
  String outletCode;
  int index;
  String csQty;
  String pcQty;
  String batchCode;
  String expiryDateV1;
  String remainingShelfLifeV1;
  String mrpV1;

  InventoryModelV1({
    required this.skuCode,
    required this.outletCode,
    required this.index,
    required this.csQty,
    required this.pcQty,
    required this.batchCode,
    required this.expiryDateV1,
    required this.remainingShelfLifeV1,
    required this.mrpV1,
  });
}
