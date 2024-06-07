import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class CreditModel {
  @Id()
  int id = 0;
  String outletCode;
  double creditAmount;
  double creditAvailable;
  String creditStatus;

  CreditModel({
    this.id = 0,
    required this.outletCode,
    required this.creditAmount,
    required this.creditAvailable,
    required this.creditStatus
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'outletCode': outletCode,
      'creditAmount': creditAmount,
      'creditAvailable': creditAvailable,
      'creditStatus': creditStatus
    };
  }

  factory CreditModel.fromMap(Map<String, dynamic> map) {
    return CreditModel(
      id: map['id'] ?? 0,
      outletCode: map['outletCode'] ?? '',
      creditAmount: map['creditAmount'] ?? 0.0,
      creditAvailable: map['creditAvailable'] ?? 0.0,
      creditStatus: map['creditStatus'] ?? '0'
    );
  }
}
