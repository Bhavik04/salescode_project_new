import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class NpdV1 {
  @Id()
  int id;
  String questionsList;

  NpdV1({this.id = 0, required this.questionsList});
  factory NpdV1.toNpdV1(List<dynamic> npdRes) {
    NpdV1 npdV1 = NpdV1(
        id: 0, questionsList: npdRes.isNotEmpty ? jsonEncode(npdRes) : "");
    return npdV1;
  }
}
