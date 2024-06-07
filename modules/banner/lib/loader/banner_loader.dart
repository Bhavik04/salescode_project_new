import 'package:banner/repository/banner_repository_app.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

class BannerLoaderService extends Loader {
  @override
  String get name => "BannerLoaderService";

  NetworkService networkService = NetworkService();
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  DataSyncServiceApp dataSyncServiceApp = DataSyncServiceApp();

  @override
  Future<void> fetchAndSave() async {
    BannerRepositoryApp bannerRepository = BannerRepositoryApp();
    int size = 1000;
    int page = 0;
    List<dynamic> resonseList = [];
    while (true) {
      NetworkResponse<dynamic> bannerNetworkResp =
          await networkService.get<dynamic>(
              '/v1/bannerDistribution?size=$size&page=$page');
      List<dynamic> resonse = bannerNetworkResp.data['features'];
      resonseList.addAll(resonse);
      page++;
      if (resonse.length < size) {
        break;
      }
    }
    await bannerRepository.addAll(resonseList);
  }
}
