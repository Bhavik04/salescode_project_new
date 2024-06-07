import 'package:salescode_sdk/salescode_sdk.dart';


abstract class KpiRepository {
  DatabaseServiceApp databaseService = DatabaseServiceApp();

  List getKpiByName(String kpiName, [String? salesRepId]);
}
