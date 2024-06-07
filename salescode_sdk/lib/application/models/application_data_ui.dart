class ApplicationDataUiModel {
  int id;
  String name;
  String value;

  ApplicationDataUiModel({
    this.id = 0,
    required this.name,
    required this.value,
  });

  factory ApplicationDataUiModel.fromMap(Map<String, dynamic> map) {
    return ApplicationDataUiModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      value: map['value'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }
}
