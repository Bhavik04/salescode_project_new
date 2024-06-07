// import '../../../db/models/app/banner.dart';
// import '../../../db/models/app/coupons.dart';
// import '../../../objectbox.g.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';
// import '../../offer/model/offers_ui.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import 'banner_repository.dart';

class BannerRepositoryApp extends BannerRepository {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  // @override
  // List<OffersUI> getAllCoupons() {
  //   Store store = databaseService.getStore()!;
  //   Box<Coupons> box = store.box<Coupons>();
  //   List<Coupons> coupons = [];
  //   final query = box.query();
  //   coupons = query.build().find();
  //   return coupons.map((e) => OffersUI.fromMap(e.toMap())).toList();
  // }

  @override
  Future<void> addAll(List<dynamic> resonse) async {
    Store store = await databaseService.getStore()!;
    store.box<BannerV1>().removeAll();

    List<BannerV1> bannerList = [];
    for (int i = 0; i < resonse.length; i++) {
      for (int j = 0; j < resonse[i]['bannerElements'].length; j++) {
        bannerList
            .add(BannerV1.fromMap(resonse[i]['bannerElements'][j], resonse[i]));
      }
    }
    store.box<BannerV1>().putMany(bannerList);
  }
}
