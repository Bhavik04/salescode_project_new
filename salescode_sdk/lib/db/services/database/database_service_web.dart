// // ignore_for_file: avoid_catches_without_on_clauses

// import 'dart:async';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:injectable/injectable.dart';

// import '../../../dart_js_stubs.dart' if (dart.library.html) 'dart:js_util';
// import '../../../dart_js_stubs.dart'
//     if (dart.library.html) 'package:js/js.dart';
// import '../../../dart_js_stubs.dart' if (dart.library.html) 'dart:js';

// import '../../../services/slack/slack_alert_service.dart';
// import '../../models/web/additional_mobile_number.dart';
// import '../../models/web/application_data.dart';
// import '../../models/web/banded_pricing.dart';
// import '../../models/web/banner.dart';
// import '../../models/web/cart.dart';
// import '../../models/web/catalogue.dart';
// import '../../models/web/configuration.dart';
// import '../../models/web/coupons.dart';
// import '../../models/web/consumer_catalog.dart';
// import '../../models/web/dashboard.dart';
// import '../../models/web/data_sync.dart';
// import '../../models/web/delivery_pjp.dart';
// import '../../models/web/dynamic_pricing.dart';
// import '../../models/web/faq.dart';
// import '../../models/web/favourite_products.dart';
// import '../../models/web/locate_me.dart';
// import '../../models/web/loyalty_dashboard.dart';
// import '../../models/web/loyalty_visibility.dart';
// import '../../models/web/metadata.dart';
// import '../../models/web/moenage.dart';
// import '../../models/web/notifications.dart';
// import '../../models/web/outlet.dart';
// import '../../models/web/popular_question.dart';
// import '../../models/web/product.dart';
// import '../../models/web/product_filter.dart';
// import '../../models/web/product_metadata.dart';
// import '../../models/web/product_pricing.dart';
// import '../../models/web/recomended_orders.dart';
// import '../../models/web/return.dart';
// import '../../models/web/rewards_disbursment.dart';
// import '../../models/web/schemes.dart';
// import '../../models/web/salesrep_outlet_model.dart';
// import '../../models/web/search_history_model.dart';
// import '../../models/web/secondary_product_model.dart';
// import '../../models/web/sku_description.dart';
// import '../../models/web/supplier.dart';
// import '../../models/web/user.dart';
// import 'database_service.dart';

// @JS()
// external clearTable(String dbName);

// @JS()
// external deleteDatabase(String dbName);

// @JS()
// external fetchDbList();

// @Singleton(as: DatabaseService, env: ["web"])
// class DatabaseServiceWeb implements DatabaseService {
//   @override
//   Box<T> getStore<T>([String boxName = ""]) {
//     return Hive.box<T>(boxName);
//   }

//   @override
//   Future<void> init([String env = "prod", int attemptNumber = 1]) async {
//     try {
//       await Hive.openBox<DataSync>('dataSyncBox');
//       await Hive.openBox<Configuration>('configurationBox');
//       await Hive.openBox<Metadata>('metadataBox');
//       await Hive.openBox<Banner>('bannerBox');
//       await Hive.openBox<Faq>('faqBox');
//       await Hive.openBox<PopularQuestionUI>('popularQuestionBox');
//       await Hive.openBox<FavouriteProduct>('favoriteProductBox');
//       await Hive.openBox<NotificationModel>('notificationModelbox');
//       await Hive.openBox<Schemes>('schemesBox');
//       await Hive.openBox<Coupons>('couponsBox');
//       await Hive.openBox<ProductPricing>('productPricingBox');
//       await Hive.openBox<Product>('productBox');
//       await Hive.openBox<ProductMetadata>('productMetadataBox');
//       await Hive.openBox<RecommendedOrders>('recommendedOrderBox');
//       await Hive.openBox<Supplier>('supplierBox');
//       await Hive.openBox<Outlet>('outletBox');
//       await Hive.openBox<ProductFilters>('productFilterBox');
//       await Hive.openBox<SecondaryProduct>('secondaryBox');
//       await Hive.openBox<User>('userBox');
//       await Hive.openBox<Catalogue>("catalogueBox");
//       await Hive.openBox<Cart>("cartBox");
//       await Hive.openBox<SearchHistoryModel>("searchHistoryBox");
//       await Hive.openBox<Dashboard>("dashboardBox");
//       await Hive.openBox<LoyaltyDashboard>("loyaltyDashboardBox");
//       await Hive.openBox<LoyaltyVisibility>("loyaltyVisibilityBox");
//       await Hive.openBox<Moengage>("moengageBox");
//       await Hive.openBox<BandedPricing>("bandedPricingBox");
//       await Hive.openBox<DynamicPricing>("dynamicPricingBox");
//       await Hive.openBox<SalesRepOutlets>("outletBoxSalesRep");
//       await Hive.openBox<LocateMe>("locateMeBox");
//       await Hive.openBox<SkuDescription>("skuDescriptionBox");
//       await Hive.openBox<RewardsDisbursment>("rewardsDisbursmentBox");
//       await Hive.openBox<DeliveryPjp>("deliveryPjpBox");
//       await Hive.openBox<AdditionalMobileNumber>("additionalMobileNumberBox");
//       // await Hive.openBox<OutletSurveyQuestionModel>("OutletSurveyQuestionModelBox");
//       // await Hive.openBox<OutletSurveyResponseModel>("OutletSurveyResponseModelBox");
//       await Hive.openBox<ApplicationData>("applicationDataBox");
//       await Hive.openBox<ConsumerCatalog>("consumerCatalogBox");
//       await Hive.openBox<ReturnModel>("returnBox");
//     } catch (e, stack) {
//       if (attemptNumber < 3) {
//         await Hive.close();
//         await deleteAllDatabases();
//         await init(env, attemptNumber + 1);
//       } else {
//         print(stack);
//         unawaited(SlackAlertService()
//             .alert("Error in opening hive boxes", extraInfo: e));
//       }
//     }
//   }

//   @override
//   void clearOldStoreCache() {
//     // TODO: implement clearOldStoreCache
//   }

//   @override
//   void closeStore() {
//     // TODO: implement closeStore
//   }

//   @override
//   void setStore(store) {
//     // TODO: implement setStore
//   }

//   @override
//   Future clearBox<T>(String dbName, {Box<T>? boxInstance}) async {
//     try {
//       if (boxInstance != null) {
//         final result = await promiseToFuture(clearTable(dbName));
//         print("RESULT >> $result");
//         await boxInstance.close();
//         await Hive.openBox<T>(dbName);
//         return getStore<T>(dbName);
//       }
//     } catch (error) {
//       print('An error occurred: $error');
//       if (boxInstance != null) {
//         await boxInstance.clear();
//         return boxInstance;
//       }
//     }
//   }

//   @override
//   Future<void> deleteAllDatabases() async {
//     try {
//       final dbList = await promiseToFuture(fetchDbList()) as List;
//       for (int i = 0; i < dbList.length; i++) {
//         print(dbList[i]);
//         final result = await promiseToFuture(deleteDatabase(dbList[i]));
//         print("RESULT >> $result");
//       }
//     } catch (error) {
//       print('An error occurred: $error');
//     }
//   }
// }
