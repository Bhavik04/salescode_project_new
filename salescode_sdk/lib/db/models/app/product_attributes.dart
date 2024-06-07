import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ProductAttributes {
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  List<String> productTypes;

  ProductAttributes({
    this.id = 0,
    required this.productTypes,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "productTypes": productTypes,
    };
  }

  factory ProductAttributes.fromMap(Map<String, dynamic> map) {
    return ProductAttributes(
      id: map['id'] ?? 0,
      productTypes: map['productTypes'] ?? [],
    );
  }
}
