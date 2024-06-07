

import '../repository/kpi_repository_app.dart';

abstract class KpiInterface {
  KpiRepositoryApp kpiRepository = KpiRepositoryApp();
  Map<String, String> getHomeScreenData({required String kpiName});
  String getHomeScreenPercentageValue({required String kpiName});
  Map<String, String> getHomeScreenColor();
}
