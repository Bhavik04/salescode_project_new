import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ConsumerCatalogV1 {
  @Id()
  int id;
  String skuOrdered;
  String skuSelected;

  ConsumerCatalogV1({this.id = 0, this.skuOrdered ='', this.skuSelected =''});
}
