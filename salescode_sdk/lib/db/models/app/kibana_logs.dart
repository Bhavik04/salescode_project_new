import 'dart:math';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class KibanaLog {
  @Id()
  int id = 0;

  String uid;

  String loginid;

  String error;

  String stacktrace;

  String message;

  String severity;

  String feature;

  DateTime timestamp;

  KibanaLog(
      {required this.loginid,
      required this.error,
      required this.stacktrace,
      required this.message,
      required this.feature,
      required this.severity})
      : timestamp = DateTime.now(),
        uid = _generateRandomString(10);
}

String _generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
