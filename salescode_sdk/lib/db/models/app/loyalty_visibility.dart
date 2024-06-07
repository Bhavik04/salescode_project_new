// import 'dart:convert';

// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

// import '../../../models/loyalty_visibility_ui.dart';

// @Entity()
// class LoyaltyVisibilityV1 {
//   @Id()
//   int id;
//   String startDate;
//   String endDate;
//   String extendedAttributes;

//   LoyaltyVisibilityV1(
//       {this.id = 0,
//       required this.startDate,
//       required this.endDate,
//       required this.extendedAttributes});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'startDate': startDate,
//       'endDate': endDate,
//       'extendedAttributes': extendedAttributes,
//     };
//   }

//   LoyaltyVisibilityUI toLoyaltyVisibiltyUI() {
//     return LoyaltyVisibilityUI(
//         startDate: startDate,
//         endDate: endDate,
//         extendedAttributes: extendedAttributes);
//   }

//   factory LoyaltyVisibilityV1.fromMap(Map<String, dynamic> response) {
//     String startDate = response["startDate"];
//     String endDate = response["endDate"];
//     String extendedAttributes = jsonEncode(response["extendedAttributes"]);
//     return LoyaltyVisibilityV1(
//         startDate: startDate,
//         endDate: endDate,
//         extendedAttributes: extendedAttributes);
//   }
// }
