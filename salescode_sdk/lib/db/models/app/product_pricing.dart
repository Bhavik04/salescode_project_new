import 'product.dart';
import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ProductPricingV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  double price;
  double casePrice;
  @Index()
  String type = "outlet";
  @Index()
  String typeValue;
  @Index()
  String skuCode;
  @Index()
  String batchCode;
  @Index()
  int priority = 0;

  final product = ToOne<ProductV1>();

  ProductPricingV1(
      {this.type = "outlet",
      required this.typeValue,
      this.id = 0,
      required this.skuCode,
      String? batchCode,
      this.price = 1,
      this.casePrice = 0,
      required this.lastModified,
      this.priority = 0})
      : batchCode = batchCode ?? skuCode;
  toString() => 'Product{id: $id, name: $batchCode,skuCode:$skuCode }';
} // find() returns List<Person>
