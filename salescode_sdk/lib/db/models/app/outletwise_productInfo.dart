import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletWiseProductInfo {
  @Id()
  int id = 0;
  String outletCode;
  String productInfo;

  OutletWiseProductInfo(
      {this.id = 0, required this.outletCode, required this.productInfo});
  factory OutletWiseProductInfo.fromMap(Map<String, dynamic> data) {
    var outletProductData = OutletWiseProductInfo(
        outletCode: data["outletCode"],
        productInfo: jsonEncode(data["productInfo"]));
    return outletProductData;
  }
}
