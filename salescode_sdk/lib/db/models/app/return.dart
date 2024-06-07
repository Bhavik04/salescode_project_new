import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ReturnModelV1 {
  @Id()
  int id = 0;
  String skuCode;
  String outletCode;
  String reasonIdV1;
  String reasonV1;
  String otherReasonV1;
  String csQty;
  String pcQty;
  String invoiceV1;
  String mrpV1;

  ReturnModelV1({
    required this.skuCode,
    required this.outletCode,
    required this.reasonIdV1,
    required this.reasonV1,
    required this.otherReasonV1,
    required this.csQty,
    required this.pcQty,
    required this.invoiceV1,
    required this.mrpV1,
  });
}
