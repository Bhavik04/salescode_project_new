// import 'package:get_it/get_it.dart';
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import '../../../db/models/web/application_data.dart';
// import '../../../db/models/web/user.dart';
// import '../../../db/services/database/database_service.dart';
// import '../../../db/storage/storage_keys.dart';
// import '../../../db/storage/storage_service.dart';
// import '../../../models/application_data_ui.dart';
// import '../../order/services/order_utils.dart';
// import 'application_repository.dart';

// class ApplicationRepositoryWeb extends ApplicationRepository {
//   late DatabaseService databaseService;
//   ApplicationRepositoryWeb(this.databaseService);

//   @override
//   ApplicationDataUiModel? getRecommendationObj() {
//     // TODO: implement getRecommendationObj
//     return null;
//   }

//   @override
//   List<ApplicationDataUiModel> getStorageData() {
//     Box<ApplicationData> applicationDataBox =
//         databaseService.getStore<ApplicationData>('applicationDataBox')!
//             as Box<ApplicationData>;
//     final List<ApplicationData> applicationDataList =
//         applicationDataBox.values.toList();
//     return applicationDataList
//         .map((applicationData) => ApplicationDataUiModel(
//             name: applicationData.name, value: applicationData.value))
//         .toList();
//   }

//   @override
//   List<ApplicationDataUiModel> readData(String keyName) {
//     Box<ApplicationData> applicationDataBox =
//         databaseService.getStore<ApplicationData>('applicationDataBox')!
//             as Box<ApplicationData>;
//     List<ApplicationData> applicationData = applicationDataBox.values.toList();
//     int objectIndex =
//         applicationData.indexWhere((element) => element.name == keyName);
//     if (objectIndex != -1) {
//       ApplicationData objectToUpdate = applicationData[objectIndex];
//       ApplicationDataUiModel applicationDataUI = ApplicationDataUiModel(
//         name: objectToUpdate.name,
//         value: objectToUpdate.value,
//       );
//       List<ApplicationDataUiModel> applicationDataList = [];
//       applicationDataList.add(applicationDataUI);
//       return applicationDataList;
//     }
//     return [];
//   }

//   @override
//   Future<void> writeStorageData(ApplicationDataUiModel applicationDataUi) async{
//     Box<ApplicationData> applicationDataBox =
//         databaseService.getStore<ApplicationData>('applicationDataBox')!
//             as Box<ApplicationData>;
//     ApplicationData applicationData = ApplicationData(
//         name: applicationDataUi.name, value: applicationDataUi.value);
//     List<ApplicationDataUiModel> applicationDataList = readData(applicationDataUi.name);
//     if(applicationDataList.isEmpty){
//       await applicationDataBox.add(applicationData);
//     }else{
//       await clearStorageData(applicationDataUi.name);
//       await applicationDataBox.add(applicationData);
//     }
//   }
   

//   @override
//   Future<void> clearAllStorageData() async {
//     Box<ApplicationData> applicationDataBox =
//         databaseService.getStore<ApplicationData>('applicationDataBox')!
//             as Box<ApplicationData>;
//     applicationDataBox = await databaseService.clearBox<ApplicationData>(
//         "applicationDataBox",
//         boxInstance: applicationDataBox);
//   }

//   @override
//   Future<void> clearStorageData(String keyName) async {
//     Box<ApplicationData> applicationDataBox =
//         databaseService.getStore<ApplicationData>('applicationDataBox')!
//             as Box<ApplicationData>;
//     if (keyName.isNotEmpty) {
//       Map<dynamic, ApplicationData> applicationDataMap =
//           applicationDataBox.toMap();
//       for (var entry in applicationDataMap.entries) {
//         if (entry.value.name == keyName) {
//           await applicationDataBox.delete(entry.key);
//         }
//       }
//     }
//   }

//   @override
//   Future<String> addAll(userDetailsNetworkResponse) async {
//     Box<User> userBox = databaseService.getStore<User>('userBox')! as Box<User>;
//     StorageService prefs = GetIt.instance.get<StorageService>();
//     List<User> userList = [];
//     if (userDetailsNetworkResponse.status == 200) {
//       userList.add(toUser(userDetailsNetworkResponse.data));
//       await prefs.setString(StorageKey.loginId,
//           userDetailsNetworkResponse.data['loginId'].toString());
//     }
//     userBox =
//         await databaseService.clearBox<User>("userBox", boxInstance: userBox);
//     await userBox.addAll(userList);
//     return "";
//   }

//   @override
//   void addAllConsumerPromo(consumerPromoOutletsNetworkResponse) {
//     // TODO: implement addAllConsumerPromo
//   }

//   @override
//   void addAllWithOrderSequence() {
//     // TODO: implement addAllWithOrderSequence
//   }

//   @override
//   void addAllWithOrderSequenceFromApi(lastOrderDetailsNetworkResponse) {
//     // TODO: implement addAllWithOrderSequenceFromApi
//   }
//   User toUser(Map<String, dynamic> data) {
//     String designation = selectDesignation(data);
//     // Extracting roles
//     List<String> roles = [];
//     for (var role in data["roles"]) {
//       roles.add(role?["name"]);
//     }
//     var user = User(
//         roles: roles,
//         name: data['name'].toString(),
//         immediateParent: data['immediateParent'].toString(),
//         loginId: data['loginId'].toString(),
//         designation: designation,
//         lob: data['lob'].toString(),
//         verified: data['verified'].toString(),
//         locationHierarchy: data['locationHierarchy'].toString(),
//         mobile: data['mobile'].toString(),
//         dialCode: data['dialCode'].toString(),
//         userAccountId: data['userAccountId'].toString(),
//         address: data['address'] ?? '',
//         email: data['email'] ?? "",
//         status: "active");
//     return user;
//   }

//   String selectDesignation(Map<String, dynamic> data) {
//     StorageService prefs = GetIt.instance.get<StorageService>();
//     String designation = '';
//     if (data['designation'] != null && data['designation']!.isNotEmpty) {
//       designation = data['designation']?[0] ?? '';
//       for (var tempDesignation in data['designation']) {
//         if (configurationService.isConfigPresent(tempDesignation)) {
//           designation = tempDesignation;
//           break;
//         }
//       }
//       if (prefs.getString(StorageKey.userType) != null &&
//           prefs.getString(StorageKey.userType) == "consumer") {
//         designation = "consumer";
//       }
//       return designation;
//     } else {
//       return designation;
//     }
//   }
// }
