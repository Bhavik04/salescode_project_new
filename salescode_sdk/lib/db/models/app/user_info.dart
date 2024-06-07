import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class UserInfo {
  @Id()
  int id;
  String userAccountId;
  String loginId;
  String mobile;
  String designation;
  String immediateParent;
  String locationHierarchy;
  String name;
  String email;
  UserInfo(
      {this.id = 0,
      required this.name,
      required this.immediateParent,
      required this.loginId,
      required this.designation,
      required this.locationHierarchy,
      required this.mobile,
      required this.userAccountId,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userAccountId': userAccountId,
      'loginId': loginId,
      'mobile': mobile,
      'designation': designation,
      'immediateParent': immediateParent,
      'locationHierarchy': locationHierarchy,
      'name': name,
      'email': email
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        id: json['id'] ?? 0,
        userAccountId: json['userAccountId'] ?? '',
        loginId: json['loginId'] ?? '',
        mobile: json['mobile'] ?? '',
        designation: json['designation'] ?? '',
        immediateParent: json['immediateParent'] ?? '',
        locationHierarchy: json['locationHierarchy'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '');
  }
}
