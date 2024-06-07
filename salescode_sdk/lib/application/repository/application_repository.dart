import 'package:salescode_sdk/application/models/application_data_ui.dart';

abstract class ApplicationRepository {
  ApplicationDataUiModel? getRecommendationObj();

  List<ApplicationDataUiModel> getStorageData();

  List<ApplicationDataUiModel> readData(String keyName);

  Future<void> writeStorageData(ApplicationDataUiModel applicationDataUi);

  Future<void> clearAllStorageData();

  Future<void> clearStorageData(String keyName);
  Future<String> addAll(userDetailsNetworkResponse);
  void addAllWithOrderSequence();
  void addAllWithOrderSequenceFromApi(dynamic lastOrderDetailsNetworkResponse);
  void addAllConsumerPromo(dynamic consumerPromoOutletsNetworkResponse);
}
