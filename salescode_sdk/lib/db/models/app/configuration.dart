import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ConfigurationV1 {
  @Id()
  int id;
  String name;
  String value;
  String role;
  String feature;
  String domainType;

  ConfigurationV1({
    this.id = 0,
    required this.name,
    required this.value,
    required this.role,
    required this.feature,
    required this.domainType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'role': role,
      'feature': feature,
      'domainType': domainType,
    };
  }

  factory ConfigurationV1.fromMap(Map<String, dynamic> map) {
    return ConfigurationV1(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      value: map['value'] ?? '',
      role: map['role'] ?? '',
      feature: map['feature'] ?? '',
      domainType: map['domainType'] ?? '',
    );
  }
}
