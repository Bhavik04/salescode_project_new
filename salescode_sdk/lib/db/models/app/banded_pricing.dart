import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class BandedPricingV1 {
  @Id()
  int id;

  String batchCode;
  String? bandedGroupId;
  String? yd00;
  String? yd01;
  String? yd02;
  String? yt01;

  BandedPricingV1({
    this.id = 0,
    required this.batchCode,
    this.bandedGroupId,
    this.yd00,
    this.yd01,
    this.yd02,
    this.yt01,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'batchCode': batchCode,
      'bandedGroupId': bandedGroupId,
      'yd00': yd00,
      'yd01': yd01,
      'yd02': yd02,
      'yt01': yt01,
    };
  }

  factory BandedPricingV1.fromMap(Map<String, dynamic> data) {
    BandedPricingV1 bandedPricing = BandedPricingV1(
        batchCode: data['skuCode'],
        bandedGroupId: data['schemeIdYd01'],
        yd00: data['yd00'] != null ? jsonEncode(data["yd00"]) : null,
        yd01: data['yd01'] != null ? jsonEncode(data["yd01"]) : null,
        yd02: data['yd02'] != null ? jsonEncode(data["yd02"]) : null,
        yt01: data['yt01'] != null ? jsonEncode(data["yt01"]) : null);
    return bandedPricing;
  }
}
