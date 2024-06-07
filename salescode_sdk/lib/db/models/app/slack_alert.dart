import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class LoggerV1 {
  @Id()
  int id = 0;

  String? info;

  String? type;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? logTime;

  LoggerV1(
      {this.id = 0,
      required this.info,
      required this.type,
      required this.logTime});
}
