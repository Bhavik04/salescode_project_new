// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

// import 'package:intl/intl.dart';

// @Entity()
// class OutletVisitStatus {
//   @Id()
//   int id = 0;
//   String outletCode;
//   DateTime storeInTime;
//   DateTime storeOutTime;
//   String status;
//   @Unique(onConflict: ConflictStrategy.replace)
//   String transactionId;
//   DateTime lastModifiedTime;
//   bool inRange;
//   String referenceNumber;

//   OutletVisitStatus(
//       {required this.id,
//       required this.outletCode,
//       required this.storeInTime,
//       required this.storeOutTime,
//       required this.status,
//       required this.transactionId,
//       required this.lastModifiedTime,
//       required this.inRange, 
//       required this.referenceNumber});

//   factory OutletVisitStatus.fromMap(Map<String, dynamic> data) {
//     var extAttr = data['extendedAttributes'];
//     bool inRange = true;
//     if (extAttr["inRange"] != null && extAttr["inRange"] == "No") {
//       inRange = false;
//     }
//     OutletVisitStatus outletVisitStatus = OutletVisitStatus(
//         id: 0,
//         outletCode: data["outletCode"],
//         storeInTime: DateTime.tryParse(data["startTime"]) ?? DateTime.now(),
//         status: extAttr["status"] ?? "NOT VISITED",
//         storeOutTime:
//             DateTime.tryParse(data["endTime"] ?? "") ?? DateTime.now(),
//         transactionId: DateFormat("yyyy-MM-dd")
//                 .format(DateTime.parse(data["lastModifiedTime"])) +
//             data["outletCode"],
//         lastModifiedTime:
//             DateTime.tryParse(data["lastModifiedTime"]) ?? DateTime.now(),
//         inRange: inRange,
//         referenceNumber: data['referenceNumber'] ?? '');
//     return outletVisitStatus;
//   }
// }
