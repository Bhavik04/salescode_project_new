import '../../configuration/configuration_service.dart';
import '../../configuration/configuration_service_app.dart';
import '../../network/network_services.dart';
import 'loader.dart';


class MetadataLoader extends Loader {
  NetworkService networkService = NetworkService();
  @override
  String get name => "MetadataLoader";
  @override
  Future<void> fetchAndSave() async {
    int size = 1000;
    int page = 0;
    List<dynamic> metadataList = [];
    while (true) {
      List<dynamic> metadataList_ = [];
      NetworkResponse<
          dynamic> metadataNetworkResponse = await networkService.get<
              dynamic>(
          '/metadata/schemeIdentifier-1?minimalResponse=true&size=$size&page=$page');
      dynamic metadataResp = metadataNetworkResponse.data['features'];
      for (int i = 0; i < metadataResp.length; i++) {
        metadataList_.add(metadataResp[i]);
      }
      metadataList.addAll(metadataList_);
      page++;
      if (metadataList_.length < size) {
        break;
      }
    }
    ConfigurationServiceApp configurationService =
        ConfigurationServiceApp();
    await configurationService.addAllMetaData(metadataList);
  }
}
