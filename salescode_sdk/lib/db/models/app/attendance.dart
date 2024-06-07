import 'dart:convert';

import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class AttendanceModelV1 {
  @Id()
  int id = 0;
  String loginId;
  String date;
  String attendanceType;
  String description;
  String extendedAttributes;
  String status;

  AttendanceModelV1({
    required this.loginId,
    required this.date,
    required this.attendanceType,
    required this.description,
    required this.extendedAttributes,
    required this.status,
  });

  factory AttendanceModelV1.fromMap(Map<String, dynamic> data) {
    String attendancetype = "";
    if (data['attendanceType'] is String) {
      attendancetype = data['attendanceType'];
    } else if (data['attendanceType'] is List) {
      attendancetype = data['attendanceType'][0];
    }
    return AttendanceModelV1(
      loginId: data['loginId'] ?? "",
      date: data['date'] ?? "",
      attendanceType: attendancetype,
      description: data['description'] ?? "",
      extendedAttributes: json.encode(data['extendedAttributes']),
      status: data['status'] ?? "",
    );
  }
}
