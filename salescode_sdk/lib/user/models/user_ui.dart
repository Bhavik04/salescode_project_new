class UserUI {
  int id = 0;
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
  String? orderSeqNum;
  String? salesRepId;
  List<String> roles;

  UserUI(
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
      required this.email,
      required this.userAccountId,
      required this.roles,
      required this.address,
      this.orderSeqNum,
      this.salesRepId});

  factory UserUI.fromMap(Map<String, dynamic> map) {
    return UserUI(
        id: map['id'] ?? 0,
        roles: map["roles"] ?? [],
        name: map['name'] ?? '',
        immediateParent: map['immediateParent'] ?? '',
        loginId: map['loginId'] ?? '',
        designation: map['designation'] ?? '',
        lob: map['lob'] ?? '',
        locationHierarchy: map['locationHierarchy'] ?? '',
        mobile: map['mobile'] ?? '',
        verified: map['verified'] ?? '',
        dialCode: map['dialCode'] ?? '',
        userAccountId: map['userAccountId'] ?? '',
        email: map['email'] ?? '',
        address:map['address'] ?? '',
        orderSeqNum: map['orderSeqNum'],
        salesRepId: map['salesRepId'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roles': roles,
      'lob': lob,
      'userAccountId': userAccountId,
      'loginId': loginId,
      'mobile': mobile,
      'designation': designation,
      'immediateParent': immediateParent,
      'locationHierarchy': locationHierarchy,
      'name': name,
      'dialCode': dialCode,
      'verified': verified,
      'email': email,
      'address':address,
      'orderSeqNum': orderSeqNum,
      'salesRepId': salesRepId
    };
  }
}
