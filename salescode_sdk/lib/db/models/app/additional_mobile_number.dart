import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class AdditionalMobileNumber {
  @Id()
  int id = 0;

  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String mobileNumber;

  String uid;

  AdditionalMobileNumber({
    this.id = 0,
    required this.mobileNumber,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'mobileNumber': mobileNumber, 'uid': uid};
  }

  factory AdditionalMobileNumber.fromMap(Map<String, dynamic> map) {
    return AdditionalMobileNumber(
        id: map['id'] ?? 0,
        mobileNumber: map['mobileNumber'] ?? '',
        uid: map['uid'] ?? '');
  }
}
