// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import '../../../constants/global_variables.dart';
// import '../../../db/models/web/banner.dart' as banner_web;
// import '../../../db/models/web/catalogue.dart';
// import '../../../models/banner_ui.dart';
// import '../../../models/catalogue_ui.dart';
// import '../../../services/slack/slack_alert_service.dart';
// import '../../../models/product.dart';
// import 'banner_service.dart';

// @Singleton(as: BannerService, env: ["web"])
// class BannerServiceWeb extends BannerService {
//   BannerServiceWeb(
//       super.catalogueServices,
//       super.notificationsService,
//       super.databaseService,
//       super.offersService,
//       super.bannerRepository,
//       super.configurationService);

//   // product catalogue page main function
//   @override
//   List<ProductUI> getDataFromBannerObj(BannerUI bannerObj, [bool? isScheme]) {
//     finalData = [];
//     List<Catalogue> temp = [];
//     catalogueList = [];
//     temp = GlobalVariables.webCatalogueList.toList();
//     for (int i = 0; i < temp.length; i++) {
//       catalogueList.add(CatalogueUI.fromMap(temp[i].toMap()));
//     }
//     Map<String, dynamic> bannerObjData = {};
//     try {
//       bannerObjData = bannerObj.elementComponents.isNotEmpty && bannerObj.elementComponents!="null"
//           ? jsonDecode(bannerObj.elementComponents)
//           : {};
//       // ignore: avoid_catches_without_on_clauses
//     } catch (e) {
//       bannerObjData = {};
//     }
//     // iterate over bannerObj
//     for (int i = 0; i < bannerObjData.keys.length; i++) {
//       // make a temp pair so to first validate the data and then add it to final list
//       Pair tempBannerData = Pair(
//           convertNewKeysToOld(bannerObjData.keys.elementAt(i)),
//           bannerObjData.values.elementAt(i));
//       if (tempBannerData.parent!.toLowerCase() == "piecesize") {
//         tempBannerData.children =
//             bannerObjData[bannerObjData.keys.elementAt(i)];
//         finalProductData = pieceSizeFilter(tempBannerData);
//         return finalProductData;
//       }
//       // iteraate on every children of tempBannerData
//       for (int j = 0; j < tempBannerData.children.length; j++) {
//         // remove parent before adding tempBannerData to finalData
//         for (int k = finalData.length - 1; k >= 0; k--) {
//           String parentToBefound = findTheSearchParent(
//               tempBannerData.children[j],
//               tempBannerData.parent,
//               finalData[k].parent);
//           if (finalData[k].children.contains(parentToBefound)) {
//             finalData[k].children.remove(parentToBefound);
//           }
//         }
//       }
//       finalData.add(tempBannerData);
//     }
//     bool shouldContinue = validateLastFilter();
//     if (shouldContinue) {
//       finalProductData = populateFinalData(isScheme);
//     }
//     return finalProductData;
//   }

//   @override
//   Future<List<BannerUI>> getBannerData(String bannerTemplate,
//       [bool productMappingCheck = true, String? bannerType]) async {
//     try {
//       List<BannerUI> bannerList = [];
//       List<banner_web.Banner> temp = [];

//       Box<banner_web.Banner> bannerBox = databaseService
//           .getStore<banner_web.Banner>('bannerBox')! as Box<banner_web.Banner>;

//       temp = bannerBox.values
//           .where((element) => element.bannerTemplate == bannerTemplate)
//           .toList();
//       for (int i = 0; i < temp.length; i++) {
//         bannerList.add(BannerUI.fromMap(temp[i].toMap()));
//       }
//       bannerList
//           .sort((a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
//       bannerList = bannerList.reversed.toList();
//       String bannerName = templateBannerMapping(bannerTemplate);
//       bannerList = await multiPurposeBannerFilter(bannerList, bannerName);
//       return bannerList;
//     } on Exception catch (e) {
//       unawaited(SlackAlertService()
//           .alert('Some error gathering banner data ', extraInfo: e));
//       rethrow;
//     }
//   }

//   @override
//   List<BannerUI> getBannerTemplateFromBannerId(
//       String bannerId, BuildContext context) {
//     try {
//       List<BannerUI> bannerList = [];
//       List<banner_web.Banner> temp = [];
//       Box<banner_web.Banner> bannerBox = databaseService
//           .getStore<banner_web.Banner>('bannerBox')! as Box<banner_web.Banner>;
//       temp = bannerBox.values
//           .where((element) => element.bannerParentId == bannerId)
//           .toList();
//       for (int i = 0; i < temp.length; i++) {
//         bannerList.add(BannerUI.fromMap(temp[i].toMap()));
//       }
//       bannerList
//           .sort((a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
//       bannerList = bannerList.reversed.toList();

//       List<BannerUI> tempBannerList = bannerList;
//       int i = 0;
//       Locale currentAppLocale = Localizations.localeOf(context) ?? Locale('en');
//       while (i < tempBannerList.length) {
//         if (tempBannerList[i].extendedAttributes != "null") {
//           Map extendedAttributesObj =
//               jsonDecode(tempBannerList[i].extendedAttributes) as Map;
//           if (extendedAttributesObj.containsKey("languageCode")) {
//             if (extendedAttributesObj['languageCode']
//                     .toString()
//                     .toLowerCase() !=
//                 currentAppLocale.languageCode.toLowerCase()) {
//               tempBannerList.removeAt(i);
//             } else {
//               i++;
//             }
//           } else {
//             i++;
//           }
//         } else {
//           i++;
//         }
//       }

//       if (tempBannerList.isEmpty) {
//         while (i < bannerList.length) {
//           if (bannerList[i].extendedAttributes != "null") {
//             Map extendedAttributesObj =
//                 jsonDecode(bannerList[i].extendedAttributes) as Map;
//             if (extendedAttributesObj.containsKey("languageCode")) {
//               if (extendedAttributesObj['languageCode']
//                       .toString()
//                       .toLowerCase() !=
//                   "en") {
//                 bannerList.removeAt(i);
//               } else {
//                 i++;
//               }
//             } else {
//               i++;
//             }
//           } else {
//             i++;
//           }
//         }
//       } else {
//         bannerList = tempBannerList;
//       }

//       return bannerList;
//     } on Exception catch (error) {
//       unawaited(SlackAlertService().alert("Some error gathering banner data"));
//       rethrow;
//     }
//   }

//   @override
//   BannerUI? fetchByBannerId(String bannerId) {
//     Box<banner_web.Banner> bannerBox = databaseService
//         .getStore<banner_web.Banner>('bannerBox')! as Box<banner_web.Banner>;
//     banner_web.Banner? banner = bannerBox.values
//         .toList()
//         .firstWhereOrNull((element) => element.bannerId == bannerId);
//     return banner == null ? null : BannerUI.fromMap(banner.toMap());
//   }
// }
