// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:salescode_sdk/application/models/application_data_ui.dart';
import 'package:salescode_sdk/db/services/database/database_service_app.dart';

import '../../../db/models/app/application_data.dart';
import '../../../db/models/app/user.dart';
import '../../../db/storage/storage_keys.dart';
import '../../../db/storage/storage_service.dart';
import '../../objectbox.g.dart';
import 'application_repository.dart';

class ApplicationRepositoryApp extends ApplicationRepository {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  @override
  ApplicationDataUiModel? getRecommendationObj() {
    try {
      Store store = databaseService.getStore()!;
      List<ApplicationDataUiModel> applicationDataList = store
          .box<ApplicationDataV1>()
          .getAll()
          .map((e) => ApplicationDataUiModel.fromMap(e.toMap()))
          .toList();

      ApplicationDataUiModel? recommendationObject = applicationDataList
          .firstWhereOrNull((element) => element.name == "recommendation_id");

      return recommendationObject;
    } catch (e) {
      log("Error in getRecommendationObj: $e");
      return null;
    }
  }

  @override
  List<ApplicationDataUiModel> getStorageData() {
    final List<ApplicationDataV1> applicationDataList =
        databaseService.getStore()!.box<ApplicationDataV1>().getAll();
    return applicationDataList
        .map((applicationData) => ApplicationDataUiModel(
              name: applicationData.name,
              value: applicationData.value,
            ))
        .toList();
  }

  @override
  List<ApplicationDataUiModel> readData(String keyName) {
    List<ApplicationDataUiModel> applicationDataList = [];
    Store store = databaseService.getStore()!;
    Box<ApplicationDataV1> outletBox = store.box<ApplicationDataV1>();
    if (keyName.isNotEmpty) {
      QueryBuilder<ApplicationDataV1> queryBuilder = outletBox
          .query(ApplicationDataV1_.name.equals(keyName, caseSensitive: true));
      Query<ApplicationDataV1> query = queryBuilder.build();
      List<ApplicationDataV1> visitStatus = query.find();
      for (ApplicationDataV1 obj in visitStatus) {
        applicationDataList.add(toApplicationDataUI(obj));
      }
    }
    return applicationDataList;
  }

  ApplicationDataUiModel toApplicationDataUI(ApplicationDataV1 e) {
    ApplicationDataUiModel applicationData = ApplicationDataUiModel(
      id: e.id,
      name: e.name,
      value: e.value,
    );
    return applicationData;
  }

  ApplicationDataV1 toApplicationData(ApplicationDataUiModel e) {
    ApplicationDataV1 applicationData =
        ApplicationDataV1(id: e.id, name: e.name, value: e.value);
    return applicationData;
  }

  @override
  Future<void> writeStorageData(ApplicationDataUiModel applicationDataUi) async{
    Store store = databaseService.getStore()!;
    store.box<ApplicationDataV1>().put(toApplicationData(applicationDataUi));
  }

  @override
  Future<void> clearAllStorageData() async {
    databaseService.getStore()!.box<ApplicationDataV1>().removeAll();
  }

  @override
  Future<void> clearStorageData(String keyName) async {
    Store store = databaseService.getStore()!;
    Box<ApplicationDataV1> box = store.box<ApplicationDataV1>();

    if (keyName.isNotEmpty) {
      QueryBuilder<ApplicationDataV1> queryBuilder = box
          .query(ApplicationDataV1_.name.equals(keyName, caseSensitive: true));
      Query<ApplicationDataV1> query = queryBuilder.build();
      List<ApplicationDataV1> entriesToRemove = query.find();

      if (entriesToRemove.isNotEmpty) {
        box.remove(entriesToRemove[0].id);
      }
    }
  }

  @override
  Future<String> addAll(userDetailsNetworkResponse) async {
    Store store = databaseService.getStore()!;
    // StorageService prefs = GetIt.instance.get<StorageService>();
    StorageService prefs = StorageService();
    List<UserV1> userList = [];
    if (userDetailsNetworkResponse.status == 200) {
      userList.add(fromMap(userDetailsNetworkResponse.data));
      await prefs.setString(StorageKey.loginId,
          userDetailsNetworkResponse.data['loginId'].toString());
    }
    // UserServices userServices = GetIt.instance.get<UserServices>();
    // if (userServices.getUserDetails().orderSeqNum != null) {
    //   ApplicationDataV1 applicationData = ApplicationDataV1(
    //       name: "orderSeqNo",
    //       value: userServices.getUserDetails().orderSeqNum!);
    //   store.box<ApplicationDataV1>().put(applicationData);
    //   UserUI user = userServices.getUserDetails();
    //   user.orderSeqNum = null;
    //   userServices.setUser(user);
    // }
    store.box<UserV1>().removeAll();
    store.box<UserV1>().putMany(userList);
    return userList.isEmpty ? "" : userList[0].designation;
  }

  UserV1 fromMap(Map<String, dynamic> data) {
    // String designation = selectDesignation(data);
    // Extracting roles
    List<String> roles = [];
    for (var role in data["roles"]) {
      roles.add(role?["name"]);
    }
    var user = UserV1(
      roles: roles,
      name: data['name'].toString(),
      immediateParent: data['immediateParent'].toString(),
      loginId: data['loginId'].toString(),
      designation: "",
      lob: data['lob'].toString(),
      verified: data['verified'].toString(),
      locationHierarchy: data['locationHierarchy'].toString(),
      mobile: data['mobile'].toString(),
      dialCode: data['dialCode'].toString(),
      userAccountId: data['userAccountId'].toString(),
      email: data['email'] ?? "",
      status: "active",
      address: data['address'] ?? '',
      salesRepId: data['loginId'],
    );
    return user;
  }

  // String selectDesignation(Map<String, dynamic> data) {
  //   StorageService prefs = GetIt.instance.get<StorageService>();
  //   String designation = '';
  //   if (data['designation'] != null && data['designation']!.isNotEmpty) {
  //     designation = data['designation']?[0] ?? '';
  //     for (var tempDesignation in data['designation']) {
  //       if (configurationService.isConfigPresent(tempDesignation)) {
  //         designation = tempDesignation;
  //         break;
  //       }
  //     }
  //     if (prefs.getString(StorageKey.userType) != null &&
  //         prefs.getString(StorageKey.userType) == "consumer") {
  //       designation = "consumer";
  //     }
  //     return designation;
  //   } else {
  //     return designation;
  //   }
  // }

  @override
  void addAllWithOrderSequence() {
    Store store = databaseService.getStore()!;
    // StorageService prefs = GetIt.instance.get<StorageService>();
    StorageService prefs = StorageService();
    ApplicationDataV1 applicationData = ApplicationDataV1(
        name: "orderSeqNo",
        value: prefs.getString(StorageKey.orderSeqNo) ?? "");
    store.box<ApplicationDataV1>().put(applicationData);
  }

  @override
  void addAllWithOrderSequenceFromApi(dynamic lastOrderDetailsNetworkResponse) {
    Store store = databaseService.getStore()!;
    if (lastOrderDetailsNetworkResponse.status == 200) {
      if (lastOrderDetailsNetworkResponse.data != null &&
          lastOrderDetailsNetworkResponse.data["orderNumber"] != null) {
        String orderNumber =
            lastOrderDetailsNetworkResponse.data["orderNumber"].toString();
        String orderSeqNo = orderNumber.substring(orderNumber.length - 7);
        // userList.first.orderSeqNum = orderSeqNo.toString();
        ApplicationDataV1 applicationData =
            ApplicationDataV1(name: "orderSeqNo", value: orderSeqNo.toString());
        store.box<ApplicationDataV1>().put(applicationData);
      }
    }
  }

  @override
  void addAllConsumerPromo(dynamic consumerPromoOutletsNetworkResponse) {
    Store store = databaseService.getStore()!;
    List<dynamic> outletsList = consumerPromoOutletsNetworkResponse.data;
    store.box<ApplicationDataV1>().put(ApplicationDataV1(
        name: 'consumerPromoOutlets', value: jsonEncode(outletsList)));
  }
}
