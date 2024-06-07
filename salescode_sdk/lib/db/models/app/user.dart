import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class UserV1 {
  @Id()
  int id;
  String lob;
  String userAccountId;
  String loginId;
  String mobile;
  String designation;
  String immediateParent;
  String locationHierarchy;
  String name;
  String dialCode;
  String verified;
  String email;
  String address;
  String status;
  String? orderSeqNumV1;
  String salesRepId;
  List<String> roles;

  UserV1(
      {this.id = 0,
      required this.name,
      required this.immediateParent,
      required this.loginId,
      required this.designation,
      required this.lob,
      required this.locationHierarchy,
      required this.mobile,
      required this.verified,
      required this.dialCode,
      required this.userAccountId,
      required this.email,
      required this.address,
      required this.status,
      this.orderSeqNumV1,
      required this.salesRepId,
      required this.roles});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lob': lob,
      'userAccountId': userAccountId,
      'loginId': loginId,
      'mobile': mobile,
      'designation': designation,
      'immediateParent': immediateParent,
      'locationHierarchy': locationHierarchy,
      'name': name,
      'dialCode': dialCode,
      'address':address,
      'verified': verified,
      'orderSeqNumV1': orderSeqNumV1,
      'salesRepId': salesRepId,
      'roles': roles,
    };
  }

  factory UserV1.fromJson(Map<String, dynamic> json) {
    return UserV1(
        id: json['id'] ?? 0,
        lob: json['lob'] ?? '',
        userAccountId: json['userAccountId'] ?? '',
        loginId: json['loginId'] ?? '',
        mobile: json['mobile'] ?? '',
        designation: json['designation'] ?? '',
        immediateParent: json['immediateParent'] ?? '',
        locationHierarchy: json['locationHierarchy'] ?? '',
        name: json['name'] ?? '',
        dialCode: json['dialCode'] ?? '',
        verified: json['verified'] ?? '',
        email: json['email'] ?? '',
        address: json['address'] ?? '',
        status: json['status'] ?? '',
        orderSeqNumV1: json['orderSeqNumV1'] ?? '',
        roles: (json?['roles'] as List<dynamic>).cast<String>() ?? [],
        salesRepId: json['salesRepId'] ?? '');
  }
}
