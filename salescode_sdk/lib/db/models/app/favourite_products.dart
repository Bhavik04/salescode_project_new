// import 'package:objectbox/objectbox.dart'
//     if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

// import '../../../models/favourite_products_ui.dart';

// @Entity()
// class FavouriteProductV1 {
//   // Each "Entity" needs a unique integer ID property.
//   // Add `@Id()` annotation if its name isn't "id" (case insensitive).
//   @Id()
//   int id = 0;

//   String batchCode;
//   @Index()
//   String outletId;

//   @Unique(onConflict: ConflictStrategy.replace)
//   String uniqueId; //concatination of outletId+batchcode

//   FavouriteProductV1({
//     this.id = 0,
//     required this.batchCode,
//     required this.outletId,
//     required this.uniqueId,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'batchCode': batchCode,
//       'outletId': outletId,
//       'uniqueId': uniqueId,
//     };
//   }

//   factory FavouriteProductV1.fromUIModel(FavouriteProductUI uiModel) {
//     return FavouriteProductV1(
//         batchCode: uiModel.batchCode,
//         outletId: uiModel.outletId,
//         uniqueId: uiModel.uniqueId);
//   }
//   factory FavouriteProductV1.fromMap(Map<String, dynamic> data) {
//     FavouriteProductV1 faq = FavouriteProductV1(
//       outletId: data['outletCode'],
//       batchCode: data['skuCode'],
//       uniqueId: data['outletCode'] + data['skuCode'],
//     );
//     return faq;
//   }
// }
