import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class MslTasksModel {
  @Id()
  int id = 0;
  String channel;
  String outletCode;
  String productCode;
  String skuCode;
  String suggestedQty;

  MslTasksModel({
    required this.channel,
    required this.outletCode,
    required this.productCode,
    required this.skuCode,
    required this.suggestedQty
  });
}