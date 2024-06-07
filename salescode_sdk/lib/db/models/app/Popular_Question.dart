import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class PopularQuestionUIV1 {
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;

  //
  // @Transient() // Make this field ignored, not stored in the database.
  // int? notPersisted;
  //
  // // An empty default constructor is needed but you can use optional args.
  // Product({this.text, DateTime? date}) : date = date ?? DateTime.now();
  // Note: just for logs in the examples below(), not needed by ObjectBox.
  String question;
  String answer;
  String template;
  String url;
  String embedLink;
  String activeStatus;
  String trainingText;
  int? intent;

  PopularQuestionUIV1(
      {this.id = 0,
      required this.question,
      required this.answer,
      required this.template,
      required this.url,
      required this.embedLink,
      required this.activeStatus,
      required this.trainingText,
      this.intent});
// toString() => 'Product{id: $id, name: $name,skuCode:$skuCode }';

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "question": question,
      "answer": answer,
      "template": template,
      "url": url,
      "embedLink": embedLink,
      "activeStatus": activeStatus,
      "trainingText": trainingText,
      "intent": intent
    };
  }

  factory PopularQuestionUIV1.fromMap(Map<String, dynamic> map) {
    return PopularQuestionUIV1(
      id: map['id'] ?? 0,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      template: map['template'] ?? '',
      url: map['url'] ?? '',
      embedLink: map['embedLink'] ?? '',
      activeStatus: map['activeStatus'] ?? '',
      trainingText: map['trainingText'] ?? '',
      intent: map['intent'],
    );
  }
  factory PopularQuestionUIV1.toQues(Map<String, dynamic> data) {
    PopularQuestionUIV1 popularQuestions = PopularQuestionUIV1(
        question: '',
        answer: '',
        template: '',
        url: '',
        embedLink: '',
        activeStatus: '',
        trainingText: '');

    if (data?['queryTemplateAssociations'].toString() != '[]') {
      String template = data['queryTemplateAssociations'][0]['template'] ?? '';
      String ques = data['intentText'] ?? '';
      String url = data['queryTemplateAssociations'][0]['templateAttributes']
              ['URL'] ??
          '';
      String link = data['queryTemplateAssociations'][0]['templateAttributes']
              ['embedLink'] ??
          '';
      String activeStatus = data['activeStatus'] ?? '';
      String trainingText = data['trainingText'] ?? '';
      int? intent = int.tryParse(data['intent']);

      String ans = data['queryTemplateAssociations']?[0]['templateAttributes']
              ?['answer'] ??
          '';
      popularQuestions = PopularQuestionUIV1(
        question: ques,
        answer: ans,
        template: template,
        url: url,
        embedLink: link,
        activeStatus: activeStatus,
        trainingText: trainingText,
        intent: intent ?? 0,
      );
    }

    return popularQuestions;
  }
}
