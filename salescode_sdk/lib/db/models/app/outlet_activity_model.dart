// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';
// import 'package:intl/intl.dart';

// @Entity()
// class OutletActivityModel {
//   @Id()
//   int id = 0;
//   @Unique(onConflict: ConflictStrategy.replace)
//   String outletCode;
//   DateTime lastModifiedTime;
//   String noVisitResponse;
//   String noOrderResponse;
//   String othersResponse;

//   OutletActivityModel(
//       {required this.id,
//       required this.outletCode,
//       required this.lastModifiedTime,
//       required this.noVisitResponse,
//       required this.noOrderResponse,
//       required this.othersResponse});
//   factory OutletActivityModel.fromMap(Map<String, dynamic> data) {
//     var extAttr = data['extendedAttributes'];
//     OutletActivityModel outletActivityModel;
//     if (extAttr["feedbackType"] == "No Visit") {
//       outletActivityModel = OutletActivityModel(
//           id: 0,
//           outletCode: data["outletCode"],
//           lastModifiedTime:
//               DateFormat('yyyy-MM-dd HH:mm:ss').parse(data["startTime"]),
//           noVisitResponse: extAttr["response"],
//           noOrderResponse: '',
//           othersResponse: extAttr["othersResponse"] ?? "");
//     } else {
//       outletActivityModel = OutletActivityModel(
//           id: 0,
//           outletCode: data["outletCode"],
//           lastModifiedTime:
//               DateFormat('yyyy-MM-dd HH:mm:ss').parse(data["startTime"]),
//           noVisitResponse: '',
//           noOrderResponse: extAttr["response"],
//           othersResponse: extAttr["othersResponse"] ?? "");
//     }
//     return outletActivityModel;
//   }
// }
