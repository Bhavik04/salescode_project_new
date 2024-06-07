// ignore_for_file: avoid_catches_without_on_clauses, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:salescode_sdk/db/services/database/database_service_app.dart';
import '../../../models/data_sync_ui.dart';

enum Status { pending, success, failure, running }

Map<String, List<String>> featureToServiceMapping = {
  "order": [
    describeEnum(Services.ProductMetadataService),
    describeEnum(Services.ProductService)
  ],
  "secondaryproduct": [describeEnum(Services.SecondaryProductLoader)],
  "offers": [describeEnum(Services.OffersLoaderService)],
  "banner": [describeEnum(Services.BannerLoaderService)],
  "outlets": [
    describeEnum(Services.SuppliersLoader),
    describeEnum(Services.OutletsLoader),
  ],
  "faq": [describeEnum(Services.FaqService)],
  "deliverypjp": [describeEnum(Services.DeliveryPjpService)],
  "productfilter": [describeEnum(Services.ProductFilterLoader)],
  "recommendation": [
    describeEnum(Services.RecommendedOrdersService),
  ],
  "favouriteskus": [describeEnum(Services.FavouriteProductService)],
  "dashboard": [
    describeEnum(Services.DashboardFactory),
    describeEnum(Services.LoyaltyDashboardFactory),
    describeEnum(Services.LoyaltyVisibilityFactory)
  ],
  "outletsurveyloader": [describeEnum(Services.OutletSurveyLoader)],
  "stockquantity": [describeEnum(Services.StockQuantityLoader)],
  "attendance": [describeEnum(Services.AttendanceLoader)],
  "salesrep": [describeEnum(Services.SalesRepLoader)],
  "bandedpricing": [describeEnum(Services.BandedPricingLoaderService)],
  "dynamicpricing": [describeEnum(Services.DynamicPricingLoaderService)],
  "locateme": [describeEnum(Services.LocateMeLoader)],
  "rewardsdisbursment": [describeEnum(Services.RewardsDisbursmentLoader)],
  "outletactivity": [describeEnum(Services.OutletActivityLoader)],
  "storeinventory": [describeEnum(Services.StoreInventoryLoader)],
  "additionalmobilenumbers": [
    describeEnum(Services.AdditionalMobileNumberLoader)
  ],
  "incentive": [
    describeEnum(Services.IncentiveLoader),
    describeEnum(Services.IncentiveDashboardLoader)
  ],
  "metadata": [describeEnum(Services.MetadataLoader)],
  "outletwisepricing": [
    describeEnum(Services.ProductDetails),
    describeEnum(Services.ProductOutletPricingLoader),
  ],
  "userinfo": [describeEnum(Services.UserInfoLoader)],
  "productdetails": [describeEnum(Services.ProductDetails)],
  "ordertracking": [
    describeEnum(Services.OrderLoader),
    describeEnum(Services.OrderTrackingLoader)
  ],
  "kpi": [
    describeEnum(Services.KpiLoader),
  ],
  "pjp": [
    describeEnum(Services.DeliveryPjpLoader),
  ],
  "locationloader": [describeEnum(Services.LocationLoader)],
  "credit": [describeEnum(Services.CreditLoader)],
  "target": [describeEnum(Services.TargetLoader)],
  "outletmapping": [describeEnum(Services.OutletMappingLoader)],
  "consumercatalog": [describeEnum(Services.ConsumerCatalogLoader)],
  "npd": [describeEnum(Services.NpdLoader)]
};

Map<String, List<String>> autoSyncMapping = {
  "catalogue": [
    "ProductService",
    "ProductMetadataService",
    "RecommendedOrdersService",
    "SecondaryProductLoader",
    "BandedPricingLoaderService",
    "DynamicPricingLoaderService"
  ],
  "banner": ["BannerLoaderService"],
  "offers": ["OffersLoaderService"],
  "rangeprogram": ["OffersLoaderService"],
  "schemedefination": ["OffersLoaderService"],
  "metadata": ["ConfigurationLoader", "MetadataLoader"],
  "secondaryproduct": ["SecondaryProductLoader"],
  "targets": [
    "DashboardFactory",
    "LoyaltyDashboardFactory",
    "LoyaltyVisibilityFactory"
  ],
  "outletdetails": ["OutletsLoader", "IntentLoader"],
  "user": ["UserLoaderService"],
  "faq": ["FaqService"],
  "scoredetails": ['LoyaltyDashboardFactory'],
  "rewardsdisbursment": ['RewardsDisbursmentLoader'],
  "outletSurveyLoader": ["OutletSurveyLoader"]
};

enum Services {
  ProductMetadataService,
  ProductService,
  RecommendedOrdersService,
  ProductFilterLoader,
  SecondaryProductLoader,
  OffersLoaderService,
  BannerLoaderService,
  OutletsLoader,
  OutletSurveyLoader,
  FaqService,
  DeliveryPjpService,
  FavouriteProductService,
  ConfigurationLoader,
  DashboardFactory,
  LoyaltyDashboardFactory,
  IntentLoader,
  LoyaltyVisibilityFactory,
  ExecuteLoader,
  OutletMappingLoader,
  StockQuantityLoader,
  DeliveryPjpLoader,
  OrderTrackingLoader,
  SuppliersLoader,
  AttendanceLoader,
  SalesRepLoader,
  BandedPricingLoaderService,
  DynamicPricingLoaderService,
  LocateMeLoader,
  KpiLoader,
  RewardsDisbursmentLoader,
  OutletActivityLoader,
  StoreInventoryLoader,
  IncentiveLoader,
  MetadataLoader,
  ProductOutletPricingLoader,
  ProductDetails,
  UserInfoLoader,
  OrderLoader,
  CreditLoader,
  LocationLoader,
  TargetLoader,
  AdditionalMobileNumberLoader,
  NpdLoader,
  IncentiveDashboardLoader,
  ConsumerCatalogLoader
}

abstract class DataSyncService {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  List<DataSyncUI> getAll();

  List<DataSyncUI> getRunningInstances();

  int getServiceSuccessCount();

  Future<DataSyncUI> getSyncInfo(
      {required String name, String type = "full", int validityPeriod = 1});

  Future<int> deleteSyncInfo({required String name, String type = "full"});

  Future<DataSyncUI> save(DataSyncUI dsObject, String status);

  // Future<void> syncServices(List<String> services) async {
  //   for (String serviceName in services) {
  //     if (isServiceSubscribedForUser(serviceName)) {
  //       await ServiceRegistry.getService(serviceName).load();
  //     }
  //   }
  // }

  bool isServiceSubscribedForUser(String service) {
    // if (ConfigurationDictionary.appFeatureConfiguration.featureConfig !=
    //     "null") {
    //   List<String> serviceList = [];
    //   List<dynamic> features = jsonDecode(
    //       ConfigurationDictionary.appFeatureConfiguration.featureConfig);
    //   List<String> featureList =
    //       features.map((e) => e['name'] as String).toList();
    //   String featureToLoader =
    //       configurationService.getConfigByName("featureToLoader");
    //   Map<String, dynamic> featureToLoaderMap =
    //       jsonDecode(featureToLoader == "null" ? "{}" : featureToLoader);
    //   for (String feature in featureList) {
    //     List<String> services =
    //         featureToLoaderMap[feature.toLowerCase()]?.cast<String>() ??
    //             featureToServiceMapping[feature.toLowerCase()] ??
    //             [];
    //     serviceList.addAll(services);
    //   }
    //   if (serviceList.contains(service)) {
    //     return true;
    //   }
    // }
    // return false;
    return true;
  }

  bool isFeatureSubscribedForUser(String feature) {
    // if (ConfigurationDictionary.appFeatureConfiguration.featureConfig !=
    //     "null") {
    //   List<dynamic> features = jsonDecode(
    //       ConfigurationDictionary.appFeatureConfiguration.featureConfig);
    //   List<String> featureList =
    //       features.map((e) => e['name'] as String).toList();
    //   if (featureList.contains(feature)) {
    //     return true;
    //   }
    // }
    // return false;
    return true;
  }

  Future<bool> isServiceAlreadyInitialised(String name) async {
    DataSyncUI ds = await getSyncInfo(name: name);
    if (ds.status == "success") {
      return !isServiceExpired(ds);
    }
    return false;
  }

  bool isServiceExpired(DataSyncUI ds) {
    return ds.expiryTime.compareTo(DateTime.now()) <= 0;
  }

  Future<void> createDataSyncEntry(DataSyncUI dataSyncUI);

  Future<void> cleanSyncData();

  dynamic getFailedLoaders();

  // Future<void> setSyncReloadTime() async {
  //   StorageService prefs = GetIt.instance.get<StorageService>();
  //   ConfigurationService configurationService =
  //       GetIt.instance.get<ConfigurationService>();
  //   DateTime now = DateTime.now();
  //   late DateTime reloadTime;
  //   String serviceReloadOnResumeIntervalConfig =
  //       configurationService.getConfigByName("serviceReloadOnResumeInterval");
  //   if (serviceReloadOnResumeIntervalConfig != "null") {
  //     Map<String, dynamic> serviceReloadOnResumeInterval =
  //         jsonDecode(serviceReloadOnResumeIntervalConfig);
  //     Expiry expiry = Expiry.fromJSON(serviceReloadOnResumeInterval);
  //     if (expiry.expiryType == ExpiryType.hourly) {
  //       reloadTime = now.add(Duration(hours: expiry.expiryValue));
  //     } else if (expiry.expiryType == ExpiryType.daily) {
  //       reloadTime =
  //           DateTime(now.year, now.month, now.day, expiry.expiryHour ?? 6)
  //               .add(Duration(days: expiry.expiryValue));
  //     } else {
  //       reloadTime = now.add(const Duration(hours: 2));
  //     }
  //   } else {
  //     reloadTime = now.add(const Duration(hours: 2));
  //   }
  //   await prefs.setString(
  //       StorageKey.syncReloadTime, reloadTime.toIso8601String());
  // }
}
