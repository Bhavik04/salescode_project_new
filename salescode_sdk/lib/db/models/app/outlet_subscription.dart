import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletSubscriptionV1 {
  @Id()
  int? id;
  String? activeStatus;
  String? activeStatusReason;
  String? principalLoginId;
  String? principalOutletCode;
  String? targetLob;
  String? targetLoginId;
  String? targetOutletCode;
  String? mobileNumber;

  OutletSubscriptionV1({
    this.id = 0,
    required this.activeStatus,
    required this.activeStatusReason,
    required this.principalLoginId,
    required this.principalOutletCode,
    required this.targetLob,
    required this.targetLoginId,
    required this.targetOutletCode,
    required this.mobileNumber,
  });
  factory OutletSubscriptionV1.fromMap(Map<String, dynamic> data) {
    return OutletSubscriptionV1(
      activeStatus: data['activeStatus'],
      activeStatusReason: data['activeStatusReason'],
      principalLoginId: data['principalLoginId'],
      principalOutletCode: data['principalOutletCode'],
      targetLob: data['targetLob'],
      targetLoginId: data['targetLoginId'],
      targetOutletCode: data['targetOutletCode'],
      mobileNumber: data['mobileNumber'],
    );
  }
}
