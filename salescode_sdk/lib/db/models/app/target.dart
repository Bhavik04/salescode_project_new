import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class TargetModel {
  @Id()
  int id = 0;
  String loginId;
  double target;

  TargetModel({this.id = 0, required this.loginId, required this.target});
}
