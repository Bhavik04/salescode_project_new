import 'dart:convert';

class ConfigurationUI {
  int id;
  String name;
  String value;
  String role;
  String feature;
  String domainType;

  ConfigurationUI({
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

  factory ConfigurationUI.fromMap(Map<String, dynamic> map) {
    return ConfigurationUI(
      id: map['id'] as int,
      name: map['name'] as String,
      value: map['value'] as String,
      role: map['role'] as String,
      feature: map['feature'] as String,
      domainType: map['domainType'] as String,
    );
  }
  factory ConfigurationUI.toConfiguration(
      Map<String, dynamic> data, String feature) {
    dynamic value;
    if (data['value'] is List<dynamic>) {
      value = jsonEncode(data['value']);
    } else {
      value = data['value'].toString();
    }

    var configuration = ConfigurationUI(
        name: data['name'],
        value: data['value'] is List || data['value'] is Map
            ? jsonEncode(data['value'])
            : data['value'].toString(),
        role: data['role'] ?? "ALL",
        domainType: data['domainType'] ?? "",
        feature: feature);
    return configuration;
  }
}
