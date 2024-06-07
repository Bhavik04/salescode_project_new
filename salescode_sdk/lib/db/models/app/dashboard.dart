// import 'dart:convert';

// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';
// import '../../../models/dashboard_ui.dart';

// @Entity()
// class DashboardV1 {
//   @Id()
//   int id;
//   String creationTime;
//   String lastModifiedTime;
//   double target;
//   String unit;
//   String targetName;
//   String targetResults;
//   String startDate;
//   String endDate;
//   String extendedAttributes;

//   DashboardV1({
//     this.id = 0,
//     required this.creationTime,
//     required this.lastModifiedTime,
//     required this.extendedAttributes,
//     required this.target,
//     required this.unit,
//     required this.targetName,
//     required this.targetResults,
//     required this.startDate,
//     required this.endDate,
//   });

//   TargetDashboardUI toDashboardUI() {
//     return TargetDashboardUI(
//         creationTime: creationTime,
//         lastModifiedTime: lastModifiedTime,
//         extendedAttributes: extendedAttributes,
//         target: target,
//         unit: unit,
//         targetName: targetName,
//         targetResults: targetResults,
//         startDate: startDate,
//         endDate: endDate);
//   }

//   factory DashboardV1.fromMap(Map<String, dynamic> response) {
//     return DashboardV1(
//         creationTime: response["creationTime"],
//         lastModifiedTime: response["lastModifiedTime"],
//         extendedAttributes: jsonEncode(response["extendedAttributes"]),
//         target: response["target"],
//         unit: response["unit"],
//         targetName: response["targetName"],
//         targetResults: jsonEncode(response["targetResults"]),
//         startDate: response["startDate"],
//         endDate: response["endDate"]);
//   }
// }
