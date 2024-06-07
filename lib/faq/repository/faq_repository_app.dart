import 'package:salescode_sdk/db/models/app/Popular_Question.dart' as db_pop_ques;
import 'package:salescode_sdk/db/models/app/Popular_Question.dart';
import 'package:salescode_sdk/db/models/app/faq.dart';
import 'package:salescode_sdk/objectbox.g.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

import '../models/faq_ui.dart';
import '../models/popular_question_UI.dart';
import 'faq_repository.dart';


class FaqServiceApp implements FaqRepository {
  DBStore dbStore = DBStore();
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  @override
  Future<List<FaqUI>> getFaqData() async {
    Store store = await databaseService.getStore()!;
    return store
        .box<FaqV1>()
        .getAll()
        .map((e) => FaqUI.fromMap(e.toMap()))
        .toList();
  }

  @override
  Future<List<PopularQuestionUI>> getPopQuestins() async {
    Store store = databaseService.getStore()!;
    return store
        .box<db_pop_ques.PopularQuestionUIV1>()
        .getAll()
        .map((e) => PopularQuestionUI.fromMap(e.toMap()))
        .toList();
  }

  @override
  Future<void> addAll(
      List<dynamic> faqList_, List<dynamic> popularQuestionsList_) async {
    Store store = await databaseService.getStore()!;
    store.box<FaqV1>().removeAll();
    List<FaqV1> faqList = [];
    List<PopularQuestionUIV1> popularQuestionsList = [];

    for (int i = 0; i < faqList_.length; i++) {
      faqList.add(FaqV1.toFaq(faqList_[i]));
    }
    for (int i = 0; i < popularQuestionsList_.length; i++) {
      popularQuestionsList
          .add(PopularQuestionUIV1.toQues(popularQuestionsList_[i]));
    }
    store.box<FaqV1>().removeAll();
    store.box<FaqV1>().putMany(faqList);
    store.box<PopularQuestionUIV1>().removeAll();
    store.box<PopularQuestionUIV1>().putMany(popularQuestionsList);
  }
}
