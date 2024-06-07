import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class InventoryStatus {
  @Id()
  int id = 0;
  String skuCode;
  String outletCode;
  String lastInvDate;
  String lastInvQty;
  InventoryStatus({
    required this.skuCode,
    required this.outletCode,
    required this.lastInvDate,
    required this.lastInvQty,
  });
}
