import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class DynamicPricingV1 {
  @Id()
  int id;

  String skuCode;
  String? ysur;
  String? ypp0;
  String? ytdn;
  String? ytdr;
  String? yrrd;
  String? yelp;

  DynamicPricingV1({
    this.id = 0,
    required this.skuCode,
    this.ysur,
    this.ypp0,
    this.ytdn,
    this.ytdr,
    this.yrrd,
    this.yelp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skuCode': skuCode,
      'ysur': ysur,
      'ypp0': ypp0,
      'ytdn': ytdn,
      'ytdr': ytdr,
      'yrrd': yrrd,
      'yelp': yelp,
    };
  }

  factory DynamicPricingV1.fromMap(Map<String, dynamic> data) {
    DynamicPricingV1 dynamicPricing = DynamicPricingV1(
      skuCode: data['skuCode'],
      ysur: data['ysur'] != null ? jsonEncode(data["ysur"]) : null,
      ypp0: data['ypp0'] != null ? jsonEncode(data["ypp0"]) : null,
      ytdn: data['ytdn'] != null ? jsonEncode(data["ytdn"]) : null,
      ytdr: data['ytdr'] != null ? jsonEncode(data["ytdr"]) : null,
      yrrd: data['yrrd'] != null ? jsonEncode(data["yrrd"]) : null,
      yelp: data['yelp'] != null ? jsonEncode(data["yelp"]) : null,
    );
    return dynamicPricing;
  }
}
