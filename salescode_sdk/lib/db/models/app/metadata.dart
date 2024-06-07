import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class MetadataV1 {
  @Id()
  int id;
  String domainName;
  String domainType;
  String domainValue;

  MetadataV1({
    this.id = 0,
    required this.domainName,
    required this.domainType,
    required this.domainValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'domainName': domainName,
      'domainType': domainType,
      'domainValue': domainValue,
    };
  }

  factory MetadataV1.fromMap(Map<String, dynamic> map) {
    return MetadataV1(
      id: map['id'] as int,
      domainName: map['domainName'] as String,
      domainType: map['domainType'] as String,
      domainValue: map['domainValue'] as String,
    );
  }
  factory MetadataV1.toMetadata(Map<String, dynamic> data) {
    var domainValues = data['domainValues'];
    MetadataV1 banner = MetadataV1(
      domainName: data['domainName'].toString() ?? '',
      domainType: data['domainType'].toString() ?? '',
      domainValue: json.encode(domainValues) ?? '',
    );
    return banner;
  }
}
