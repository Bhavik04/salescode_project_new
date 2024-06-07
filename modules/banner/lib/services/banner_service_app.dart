

import 'package:banner/models/banner_ui.dart';
import 'package:banner/services/banner_service.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'package:salescode_sdk/salescode_sdk.dart';
import 'package:salescode_sdk/db/models/app/banner.dart' as banner;

class BannerServiceApp extends BannerService {
  // BannerServiceApp(
  //     super.catalogueServices,
  //     super.notificationsService,
  //     super.databaseService,
  //     super.offersService,
  //     super.bannerRepository,
  //     super.configurationService);

  // product catalogue page main function
  DatabaseServiceApp databaseService = DatabaseServiceApp();


  @override
  Future<List<BannerUI>> getBannerData(String bannerTemplate,
      [bool productMappingCheck = true, String? bannerType]) async {
    try {
      List<BannerUI> bannerList = [];
      List<banner.BannerV1> temp = [];
      Store store = databaseService.getStore()!;
      Box<banner.BannerV1> bannerBox = store.box<banner.BannerV1>();
      QueryBuilder<banner.BannerV1> queryBuilder =
          bannerBox.query(BannerV1_.bannerTemplate.equals(bannerTemplate));
      Query<banner.BannerV1> query = queryBuilder.build();
      temp = query.find();
      for (int i = 0; i < temp.length; i++) {
        bannerList.add(BannerUI.fromMap(temp[i].toMap()));
      }
      bannerList
          .sort((a, b) => a.lastModifiedTime.compareTo(b.lastModifiedTime));
      bannerList = bannerList.reversed.toList();
      String bannerName = templateBannerMapping(bannerTemplate);
      bannerList = await multiPurposeBannerFilter(bannerList, bannerName);
      return bannerList;
    } on Exception catch (error, stack) {
      // unawaited(errorLoggerService.logError(
      //     errorCode: ErrorType.banner_data_error,
      //     error: error.toString(),
      //     stackTrace: stack,
      //     message: "error in getBannerData",
      //     severity: Severity.medium,
      //     feature: Feature.banner));
      // rethrow;
      return [];
    }
  }
}
