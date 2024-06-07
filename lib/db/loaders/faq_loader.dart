


import 'package:salescode_sdk/salescode_sdk.dart';

import '../../faq/repository/faq_repository_app.dart';

class FaqService extends Loader {
  NetworkService networkService = NetworkService();
  @override
  String get name => "FaqService";

  @override
  Future<void> fetchAndSave() async {
    int size = 1000;
    int page = 0;
    List<dynamic> faqList = [];
    List<dynamic> popularQuestionsList = [];
    while (true) {
      NetworkResponse<dynamic> quesNetworkRepsonse =
          await networkService.get<dynamic>(
              '/v1/sellina/ai/queries?size=$size&page=$page');
      dynamic ques = quesNetworkRepsonse.data['features'];
      for (int i = 0; i < ques.length; i++) {
        faqList.add(ques[i]);
      }

      faqList = faqList
          .where((element) =>
              element['queryTemplateAssociations']?[0]?['templateAttributes']
                      ?['answer']!=null  &&element['queryTemplateAssociations']?[0]?['templateAttributes']
                      ?['answer'].isNotEmpty &&
              element['intentText']?.isNotEmpty)
          .toList();

      for (int i = 0; i < ques.length; i++) {
        popularQuestionsList.add(ques[i]);
      }
      popularQuestionsList = popularQuestionsList
          .where((element) =>
              element['queryTemplateAssociations']?[0]['templateAttributes']
                      ?['answer']!=null && 
                  element['queryTemplateAssociations']?[0]['templateAttributes']
                      ?['answer'].isNotEmpty &&
              element['intentText'].isNotEmpty)
          .toList();

      page++;
      if (faqList.length < size) {
        break;
      }
      if (popularQuestionsList.length < size) {
        break;
      }
    }
    FaqServiceApp faqRepository = FaqServiceApp();
    await faqRepository.addAll(faqList, popularQuestionsList);
  }
}
