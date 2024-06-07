// import '../../../db/services/database/database_service.dart';
// import '../../offer/model/offers_ui.dart';

import 'package:salescode_sdk/salescode_sdk.dart';

abstract class BannerRepository {
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  
  Future<void> addAll(List<dynamic> resonse);
  // List<OffersUI> getAllCoupons();
}
