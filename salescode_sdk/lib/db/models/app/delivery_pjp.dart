import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class DeliveryPjpV1 {
  @Id()
  int id;
  String pjpDate;
  String outletCode;
  String? deliveryPjpDateList;
  String month;
  String year;
  String expiryTime;
  String deliveryDate;
  String shippingAddressList;
  String? type;

  DeliveryPjpV1({this.id = 0, required this.outletCode, required this.pjpDate, this.deliveryPjpDateList, required this.month, required this.year, required this.expiryTime, required this.deliveryDate, required this.shippingAddressList, this.type});
  factory DeliveryPjpV1.fromJson(Map<String, dynamic> dataMap) {
  return DeliveryPjpV1(
      outletCode: dataMap["outletCode"] ?? "",
      pjpDate: dataMap["pjpDate"] ?? "",
      deliveryPjpDateList: dataMap["dayAndFrequency"] != null
          ? jsonEncode(dataMap["dayAndFrequency"])
          : "",
      month: dataMap["month"] ?? "",
      year: dataMap["year"] ?? "",
      expiryTime: dataMap["expiryTime"] ?? "",
      deliveryDate: dataMap["deliveryDate"] ?? "",
      shippingAddressList: dataMap["shippingAddressList"] ?? "",
      type: dataMap["type"] ?? "");
}
}
