// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import '../../../db/models/web/banner.dart';
// import '../../../db/models/web/coupons.dart';
// import '../../offer/model/offers_ui.dart';
// import 'banner_repository.dart';

// @Singleton(as: BannerRepository, env: ["web"])
// class BannerRepositoryWeb extends BannerRepository {
//   BannerRepositoryWeb(super.databaseService);

//   @override
//   List<OffersUI> getAllCoupons() {
//     List<Coupons> coupons = [];
//     Box<Coupons> couponsBox =
//         databaseService.getStore<Coupons>('couponsBox')! as Box<Coupons>;
//     coupons.addAll(couponsBox.values.toList());
//     return coupons.map((e) => OffersUI.fromMap(e.toMap())).toList();
//   }

//   @override
//   Future<void> addAll(List resonse) async {
//     Box<Banner> bannerBox =
//         databaseService.getStore<Banner>("bannerBox")! as Box<Banner>;
//     bannerBox = await databaseService.clearBox<Banner>("bannerBox",
//         boxInstance: bannerBox);
//     List<Banner> bannerList = [];
//     for (int i = 0; i < resonse.length; i++) {
//       for (int j = 0; j < resonse[i]['bannerElements'].length; j++) {
//         bannerList
//             .add(Banner.fromMap(resonse[i]['bannerElements'][j], resonse[i]));
//       }
//     }
//     await bannerBox.addAll(bannerList);
//   }
// }
