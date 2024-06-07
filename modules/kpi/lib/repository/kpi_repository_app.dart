import 'dart:convert';

import 'package:salescode_sdk/db/models/app/kpi.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'package:salescode_sdk/salescode_sdk.dart';
import 'package:salescode_sdk/user/services/user_services_app.dart';

import '../models/kpi_productive_ui.dart';
import '../models/kpi_sales_ui.dart';
import 'kpi_repository.dart';

class KpiRepositoryApp extends KpiRepository {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  @override
  List getKpiByName(String kpiName, [String? salesRepId]) {
    UserServicesApp userServices = UserServicesApp();
    String srId = salesRepId ?? userServices.getUserDetails().loginId;

    Store store = databaseService.getStore()!;
    KpiV1? kpi = store
        .box<KpiV1>()
        .query(KpiV1_.refKey.equals("$srId-$kpiName"))
        .build()
        .findFirst();
    List transformedKpi = [];
    if (kpi != null && kpi.data.isNotEmpty) {
      List kpiData = jsonDecode(kpi.data);
      for (var element in kpiData) {
        switch (kpiName) {
          case "kpi_productive_user_period":
            transformedKpi.add(KpiProductiveUserPeriodModel.fromJson(element));
            break;
          case "kpi_sales_value_user":
            transformedKpi.add(KpiReviewSalesValueUser.fromJson(element));
            break;
        }
      }
    }
    return transformedKpi;
  }
}
