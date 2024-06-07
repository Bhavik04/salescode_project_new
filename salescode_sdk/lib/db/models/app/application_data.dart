import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class ApplicationDataV1 {
  @Id()
  int id;
  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String name;
  String value;

  ApplicationDataV1({this.id = 0, required this.name, required this.value});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'value': value};
  }

  factory ApplicationDataV1.fromMap(Map<String, dynamic> map) {
    return ApplicationDataV1(
        id: map['id'] ?? 0, name: map['name'] ?? '', value: map['value'] ?? '');
  }
}
