import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletMappingV1 {
  @Id()
  int id = 0;
  String provinceV1;
  String cityV1;
  String districtV1;
  List<String>?
      customerChannel; //come through outletCategory key of outlet Details
  String channelCode; //config Api
  List<String>? customerType; //come through outletClass key of outlet Details
  List<String>? outletType;
  String region;
  String salesTeritory;

  List<String>? state;
  String? city; //state, list of city------------Map<String, List<String>>
  String? district; //city, list of dis------------Map<String, List<String>>
  String?
      cityClassification; //city, list of class------------Map<String, List<String>>
  String?
      cityCluster; //city, list of citycluster------------Map<String, List<String>>
  List<String>? routeName;

  String? aseTerritory;

  List<String>? distributorId;
  List<String>? distributorName;
  OutletMappingV1(
      {this.provinceV1 = "",
      this.cityV1 = "",
      this.districtV1 = "",
      this.customerChannel,
      this.channelCode = "",
      this.region = "",
      this.salesTeritory = "",
      this.state,
      this.city,
      this.district,
      this.cityClassification,
      this.cityCluster,
      this.routeName,
      this.customerType,
      this.aseTerritory,
      this.distributorId,
      this.distributorName,this.outletType});

  Map<String, dynamic> toMap() {
    return {
      'provinceV1': provinceV1,
      'cityV1': cityV1,
      'districtV1': districtV1,
      'customerChannel': customerChannel,
      'channelCode': channelCode,
      'region': region,
      'salesTeritory': salesTeritory,
      'state': state,
      'city': city,
      'district': district,
      'cityClassification': cityClassification,
      'cityCluster': cityCluster,
      'routeName': routeName,
      'customerType': customerType,
      'aseTerritory': aseTerritory,
      'distributorId': distributorId,
      'distributorName': distributorName,
      'outletType': outletType,
    };
  }

  factory OutletMappingV1.fromMap(Map<String, dynamic> json) {
    List<String>? listOfStrings;
    if ((json['state'].runtimeType == String)) {
      Map<String, dynamic> jsonData =
          jsonDecode('{"state": "${json['state']}"}');
      listOfStrings = jsonData.values.map((value) => value.toString()).toList();
    }

    return OutletMappingV1(
      provinceV1: json['state'] ?? "",
      cityV1: json['city'] ?? "",
      districtV1: json['district'] ?? "",
      customerChannel: json['customerChannel'] ?? [],
      channelCode: json['channelCode'] ?? "",
      region: json['region'] ?? "",
      salesTeritory: json['salesTeritory'] ?? "",
      state: (json['state'].runtimeType == String)
          ? listOfStrings
          : json['state'] ?? [],
      city: json['city'] ?? "",
      district: json['district'] ?? "",
      cityClassification: json['cityClassification'] ?? "",
      cityCluster: json['cityCluster'] ?? "",
      routeName: json['routeName'] ?? [],
      customerType: json['customerType'] ?? [],
      aseTerritory: json['aseTerritory'] ?? "",
      distributorId: json['distributorId'] ?? [],
      distributorName: json['distributorName'] ?? [],
    );
  }
}
