class PopularQuestionUI {
  int id = 0;
  String question;
  String answer;
  String template;
  String url;
  String embedLink;
  String activeStatus;
  String trainingText;
  int? intent;

  PopularQuestionUI({
    this.id = 0,
    required this.question,
    required this.answer,
    required this.template,
    required this.url,
    required this.embedLink,
    required this.activeStatus,
    required this.trainingText,
    this.intent,
  });

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

  factory PopularQuestionUI.fromMap(Map<String, dynamic> map) {
    return PopularQuestionUI(
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
}
