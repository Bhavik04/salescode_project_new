import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ProductFiltersV1 {
  @Id()
  int id;
  String filters;

  ProductFiltersV1({
    this.id = 0,
    required this.filters,
  });
  factory ProductFiltersV1.fromMap(Map<String, dynamic> data) {
    var productFilter = ProductFiltersV1(
      filters: json.encode(data) ?? '',
    );
    return productFilter;
  }
}
