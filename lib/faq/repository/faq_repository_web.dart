// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import '../../../db/models/web/faq.dart';
// import '../../../db/models/web/popular_question.dart';
// import '../../../db/services/database/database_service.dart';
// import '../../../db/services/database/dbstore.dart';
// import '../../../models/faq_ui.dart';
// import 'faq_repository.dart';

// @Singleton(as: FaqRepository, env: ["web"])
// class FaqServiceWeb implements FaqRepository {
//   late DBStore dbStore;
//   late DatabaseService databaseService;

//   FaqServiceWeb(this.dbStore, this.databaseService);

//   @override
//   Future<List<FaqUI>> getFaqData() async {
//     Box<Faq> faqBox = databaseService.getStore<Faq>("faqBox")! as Box<Faq>;
//     return faqBox.values.map((e) => FaqUI.fromMap(e.toMap())).toList();
//   }

//   @override
//   Future<List<PopularQuestionUI>> getPopQuestins() async {
//     Box<PopularQuestionUI> popularQuestionBox =
//         databaseService.getStore<PopularQuestionUI>("popularQuestionBox")!
//             as Box<PopularQuestionUI>;
//     return popularQuestionBox.values.toList();
//   }

//   @override
//   Future<void> addAll(List faqList_, List popularQuestionsList_) async {
//     Box<Faq> faqBox = databaseService.getStore<Faq>("faqBox")! as Box<Faq>;
//     Box<PopularQuestionUI> popularQuestionBox =
//         databaseService.getStore<PopularQuestionUI>("popularQuestionBox")!
//             as Box<PopularQuestionUI>;
//     faqBox = await databaseService.clearBox<Faq>("faqBox", boxInstance: faqBox);

//     List<Faq> faqList = [];
//     List<PopularQuestionUI> popularQuestionsList = [];

//     for (int i = 0; i < faqList_.length; i++) {
//       faqList.add(Faq.toFaq(faqList_[i]));
//     }
//     for (int i = 0; i < popularQuestionsList_.length; i++) {
//       popularQuestionsList
//           .add(PopularQuestionUI.toQues(popularQuestionsList_[i]));
//     }
//     await faqBox.clear();
//     await faqBox.addAll(faqList);
//     await popularQuestionBox.clear();
//     await popularQuestionBox.addAll(popularQuestionsList);
//   }
// }
