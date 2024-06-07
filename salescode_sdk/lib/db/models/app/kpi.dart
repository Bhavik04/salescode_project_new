import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class KpiV1 {
  @Id()
  int id;
  @Index()
  String kpiName;
  String data;
  String userId;
  String userDesignation;
  @Unique(onConflict: ConflictStrategy.replace)
  String refKey;

  KpiV1(
      {this.id = 0,
      required this.kpiName,
      required this.data,
      required this.userId,
      required this.userDesignation,
      required this.refKey});
}
