import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class MoengageV1 {
  @Id()
  int id;
  dynamic payload;

  MoengageV1({this.id = 0, this.payload});
}
