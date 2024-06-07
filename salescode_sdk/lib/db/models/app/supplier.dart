import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SupplierV1 {
  @Id()
  int id = 0;
  @Index()
  String supplierId;
  String name;
  String mobile;
  String loginId;
  int min;
  int max;
  String level;
  String type;
  String orderFulfillmentTime;
  String rcsId;
  String sifyId;
  SupplierV1(
      {required this.supplierId,
      required this.name,
      required this.mobile,
      required this.loginId,
      required this.min,
      required this.max,
      required this.level,
      required this.type,
      required this.orderFulfillmentTime,
      required this.rcsId,
      required this.sifyId});
}
