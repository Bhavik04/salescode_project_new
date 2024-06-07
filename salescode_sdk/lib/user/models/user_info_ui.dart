class UserInfoUI {
  int id = 0;
  String userAccountId;
  String loginId;
  String mobile;
  String designation;
  String immediateParent;
  String locationHierarchy;
  String name;
  String email;

  UserInfoUI(
      {this.id = 0,
      required this.name,
      required this.immediateParent,
      required this.loginId,
      required this.designation,
      required this.locationHierarchy,
      required this.mobile,
      required this.email,
      required this.userAccountId});

  factory UserInfoUI.fromMap(Map<String, dynamic> map) {
    return UserInfoUI(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        immediateParent: map['immediateParent'] ?? '',
        loginId: map['loginId'] ?? '',
        designation: map['designation'] ?? '',
        locationHierarchy: map['locationHierarchy'] ?? '',
        mobile: map['mobile'] ?? '',
        userAccountId: map['userAccountId'] ?? '',
        email: map['email'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userAccountId': userAccountId,
      'loginId': loginId,
      'mobile': mobile,
      'designation': designation,
      'immediateParent': immediateParent,
      'locationHierarchy': locationHierarchy,
      'name': name,
      'email': email,
    };
  }
}
