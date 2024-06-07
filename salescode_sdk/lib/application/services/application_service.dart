import 'package:salescode_sdk/application/models/application_data_ui.dart';

import '../repository/application_repository.dart';

class ApplicationService {
  late ApplicationRepository applicationRepository;
  ApplicationService(this.applicationRepository);

  ApplicationDataUiModel? getRecommendationObj() =>
      applicationRepository.getRecommendationObj();
}
