

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../db/models/app/application_data.dart';
import '../../db/models/app/user.dart';
import '../../db/models/app/user_info.dart';
import '../../objectbox.g.dart';
import '../models/user_info_ui.dart';
import '../models/user_ui.dart';
import 'user_services.dart';

class UserServicesApp extends UserServices {

  @override
  List<UserUI> getUserList() {
    Store store = databaseService.getStore()!;
    return store
        .box<UserV1>()
        .getAll()
        .map((e) => UserUI.fromMap(e.toMap()))
        .toList();
  }

  UserUI toUserUI(UserV1 e) {
    UserUI user = UserUI(
      roles: e.roles,
      name: e.name,
      immediateParent: e.immediateParent,
      userAccountId: e.userAccountId,
      dialCode: e.dialCode,
      verified: e.verified,
      mobile: e.mobile,
      locationHierarchy: e.locationHierarchy,
      lob: e.lob,
      designation: e.designation,
      loginId: e.loginId,
      id: e.id,
      email: e.email, address: e.address,
    );
    return user;
  }

  UserInfoUI toUserInfoUI(UserInfo e) {
    UserInfoUI user = UserInfoUI(
        name: e.name,
        immediateParent: e.immediateParent,
        userAccountId: e.userAccountId,
        mobile: e.mobile,
        locationHierarchy: e.locationHierarchy,
        designation: e.designation,
        loginId: e.loginId,
        id: e.id,
        email: e.email);
    return user;
  }

  @override
  String? getOrderSeq() {
    Store store = databaseService.getStore()!;
    List<UserV1> userList = store.box<UserV1>().getAll().toList();
    if (userList.isNotEmpty) {
      return userList.first.orderSeqNumV1;
    } else {
      return null;
    }
  }

  @override
  bool setOrderSeqToNull() {
    try {
      UserUI user = getUserDetails();
      user.orderSeqNum = null;
      UserV1 userModel = UserV1.fromJson(jsonDecode(jsonEncode(user)));
      databaseService.getStore()!.box<UserV1>().removeAll();
      databaseService.getStore()!.box<UserV1>().put(userModel);
      return true;
    } on Exception catch (e) {
      // unawaited(SlackAlertService().alert("Error in setOrderSeqToNull: $e"));
      debugPrint("Error in setOrderSeqToNull: $e");
    }
    return false;
  }

  @override
  bool setOrderSeq({required String orderSeq}) {
    try {
      UserUI user = getUserDetails();
      user.orderSeqNum = orderSeq;
      UserV1 userModel = UserV1.fromJson(jsonDecode(jsonEncode(user)));
      databaseService.getStore()!.box<UserV1>().removeAll();
      databaseService.getStore()!.box<UserV1>().put(userModel);
      return true;
    } on Exception catch (e) {
      // unawaited(SlackAlertService().alert("Error in setOrderSeqToNull: $e"));
      debugPrint("Error in setOrderSeqToNull: $e");
    }
    return false;
  }

  @override
  String setActiveOutletCode(String outletCode) {
    Store store = databaseService.getStore()!;
    ApplicationDataV1 applicationData = ApplicationDataV1(name: "activeOutletCode", value: outletCode);
    store.box<ApplicationDataV1>().put(applicationData);
    return outletCode;
  }

  @override
  List<UserInfoUI> getAllUser() {
    Store store = databaseService.getStore()!;
    return store
        .box<UserInfo>()
        .getAll()
        .map((e) => UserInfoUI.fromMap(e.toMap()))
        .toList();
  }

  @override
  List<UserInfoUI> getSalesReps() {
    Store store = databaseService.getStore()!;
    return store
        .box<UserInfo>()
        .query(UserInfo_.designation.equals("salesrep"))
        .build()
        .find()
        .map((e) => UserInfoUI.fromMap(e.toMap()))
        .toList();
  }

  // @override
  // void setActiveSalesRep({required String salesRepId}) {
  //   Store store = databaseService.getStore()!;
  //   List<UserV1> user = store.box<UserV1>().getAll();
  //   if (user.isNotEmpty) {
  //     user[0].salesRepId = salesRepId;
  //   }
  //   store.box<UserV1>().removeAll();
  //   store.box<UserV1>().putMany(user);
  // }

  // @override
  // String getActiveSalesRep() {
  //   Store store = databaseService.getStore()!;
  //   List<UserV1> user = store.box<UserV1>().getAll();
  //   if (user.isNotEmpty) {
  //     return user.first.salesRepId;
  //   }
  //   return "";
  // }

  @override
  void setUser(UserUI userUi) {
    Store store = databaseService.getStore()!;
    store.box<UserV1>().removeAll();
    UserV1 user = UserV1.fromJson(jsonDecode(jsonEncode(userUi)));
    store.box<UserV1>().put(user);
  }

  @override
  void emptySalesRepList() async {
    Store store = databaseService.getStore()!;
    int value = store
        .box<UserInfo>()
        .query(UserInfo_.designation.equals("salesrep"))
        .build().remove();
    debugPrint("Removed $value salesrep");
  }
  
  @override
  bool showWDcode(UserUI user) {
    if(user.designation.toUpperCase() =='PSR' || user.designation.toUpperCase() =='STOCKIST') {
      return true;
    }
    return false;
  }
}
