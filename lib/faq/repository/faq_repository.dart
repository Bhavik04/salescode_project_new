import '../models/faq_ui.dart';

abstract class FaqRepository {
  Future<List<FaqUI>> getFaqData();
  Future<void> addAll(
      List<dynamic> faqList, List<dynamic> popularQuestionsList);
  Future<dynamic> getPopQuestins();
}
