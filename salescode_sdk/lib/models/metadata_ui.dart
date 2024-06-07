class MetadataUI {
  int id;
  String domainName;
  String domainType;
  String domainValue;

  MetadataUI({
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

  factory MetadataUI.fromMap(Map<String, dynamic> map) {
    return MetadataUI(
      id: map['id'] as int,
      domainName: map['domainName'] as String,
      domainType: map['domainType'] as String,
      domainValue: map['domainValue'] as String,
    );
  }
}
