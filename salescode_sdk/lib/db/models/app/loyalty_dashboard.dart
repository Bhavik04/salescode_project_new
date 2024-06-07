// import 'dart:convert';

// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

// import '../../../models/loyalty_ui.dart';

// @Entity()
// class LoyaltyDashboardV1 {
//   @Id()
//   int id;
//   String lastModifiedTime;
//   String startDate;
//   String endDate;
//   double totalPoints;
//   double openingPoints;
//   double closingPoints;
//   String extendedAttributes;
//   String dashboardTypeV1;

//   LoyaltyDashboardV1(
//       {this.id = 0,
//       required this.lastModifiedTime,
//       required this.startDate,
//       required this.endDate,
//       required this.totalPoints,
//       required this.openingPoints,
//       required this.closingPoints,
//       required this.extendedAttributes,
//       required this.dashboardTypeV1});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'lastModifiedTime': lastModifiedTime,
//       'startDate': startDate,
//       'endDate': endDate,
//       'totalPoints': totalPoints,
//       'openingPoints': openingPoints,
//       'closingPoints': closingPoints,
//       'extendedAttributes': extendedAttributes,
//       'dashboardTypeV1': dashboardTypeV1,
//     };
//   }

//   LoyaltyDataUI toLoyaltyDataUI() {
//     return LoyaltyDataUI(
//       id: id,
//       lastModifiedTime: lastModifiedTime,
//       startDate: startDate,
//       endDate: endDate,
//       totalPoints: totalPoints,
//       openingPoints: openingPoints,
//       closingPoints: closingPoints,
//       extendedAttributes: extendedAttributes,
//       dashboardType: dashboardTypeV1,
//     );
//   }
//   factory LoyaltyDashboardV1.fromMap(
//       Map<String, dynamic> loyaltyDashboardResponse, String dashboardType) {
//     if (dashboardType == "live") {
//       return LoyaltyDashboardV1(
//           lastModifiedTime: loyaltyDashboardResponse["lastModifiedTime"] ?? "",
//           startDate: loyaltyDashboardResponse["startDate"] ?? "",
//           endDate: loyaltyDashboardResponse["endDate"] ?? "",
//           totalPoints: loyaltyDashboardResponse["totalPoints"] ?? 0.0,
//           openingPoints: loyaltyDashboardResponse["openingPoints"] ?? 0.0,
//           closingPoints: loyaltyDashboardResponse["closingPoints"] ?? 0.0,
//           extendedAttributes:
//               jsonEncode(loyaltyDashboardResponse["extendedAttributes"] ?? ""),
//           dashboardTypeV1: dashboardType);
//     } else {
//       return LoyaltyDashboardV1(
//           lastModifiedTime: loyaltyDashboardResponse["lastModifiedTime"],
//           startDate: loyaltyDashboardResponse["startDate"],
//           endDate: loyaltyDashboardResponse["endDate"],
//           totalPoints: loyaltyDashboardResponse["totalPoints"],
//           openingPoints: loyaltyDashboardResponse["openingPoints"],
//           closingPoints: loyaltyDashboardResponse["closingPoints"],
//           extendedAttributes:
//               jsonEncode(loyaltyDashboardResponse["extendedAttributes"]),
//           dashboardTypeV1: dashboardType);
//     }
//   }
// }
