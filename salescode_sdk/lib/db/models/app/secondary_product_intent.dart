import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SecondaryProductIntentV1 {
  @Id()
  int id;
  String suggestedQtyV1;
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String
      outletCodeWithBatchCodeV1; //value should be in the format of: outletcode~skucode
  @Index()
  String outletCode;

  SecondaryProductIntentV1(
      {this.id = 0,
      required this.suggestedQtyV1,
      required this.outletCodeWithBatchCodeV1,
      required this.outletCode});
}
