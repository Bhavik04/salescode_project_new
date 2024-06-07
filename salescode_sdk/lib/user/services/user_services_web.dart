// import 'dart:convert';

// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import '../../../db/models/web/user.dart';
// import '../../../models/user_info_ui.dart';
// import '../../../models/user_ui.dart';
// import 'user_services.dart';

// @Singleton(as: UserServices, env: ["web"])
// class UserServicesWeb extends UserServices {
//   UserServicesWeb(super.databaseService, super.authState);

//   @override
//   List<UserUI> getUserList() {
//     try {
//       Box<User> userBox =
//           databaseService.getStore<User>('userBox')! as Box<User>;
//       return userBox.values.map((e) => UserUI.fromMap(e.toMap())).toList();
//     } catch (e) {
//       return [];
//     }
//   }

//   UserUI toUserUI(User e) {
//     UserUI user = UserUI(
//         roles: e.roles,
//         name: e.name,
//         immediateParent: e.immediateParent,
//         userAccountId: e.userAccountId,
//         dialCode: e.dialCode,
//         verified: e.verified,
//         mobile: e.mobile,
//         locationHierarchy: e.locationHierarchy,
//         lob: e.lob,
//         designation: e.designation,
//         loginId: e.loginId,
//         id: e.id,
//         email: e.email, address: e.address);
//     return user;
//   }

//   @override
//   String? getOrderSeq() {
//     // TODO: implement getOrderSeq
//     return null;
//   }

//   @override
//   bool setOrderSeqToNull() {
//     return false;
//   }

//   @override
//   bool setOrderSeq({required String orderSeq}) {
//     // TODO: implement setOrderSeq
//     return false;
//   }

//   @override
//   String setActiveOutletCode(String outletCode) {
//     // TODO: implement setActiveOutletCode
//     return "";
//   }

//   @override
//   List<UserInfoUI> getAllUser() {
//     // TODO: implement getAllUser
//     return [];
//   }

//   @override
//   List<UserInfoUI> getSalesReps() {
//     // TODO: implement getSalesReps
//     return [];
//   }

//   @override
//   void setActiveSalesRep({required String salesRepId}) {
//     // TODO: implement setActiveSalesRep
//   }

//   @override
//   String getActiveSalesRep() {
//     // TODO: implement getActiveSalesRep
//     return "";
//   }

//   @override
//   Future<void> setUser(UserUI userUi) async {
//     Box<User> userbox =
//     databaseService.getStore<User>('userBox')! as Box<User>;
//     await userbox.clear();
//     User user = User.fromMap(jsonDecode(jsonEncode(userUi)));
//     await userbox.addAll([user]);
//   }

//   @override
//   void emptySalesRepList() {
//   }
  
//   @override
//   bool showWDcode(UserUI user) {
//     // TODO: implement getWDcode
//     return false;
//   }
// }
