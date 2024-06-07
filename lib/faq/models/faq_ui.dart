class FaqUI {
  int id;
  String question;
  String answer;

  FaqUI({
    this.id = 0,
    required this.question,
    required this.answer,
  });

  factory FaqUI.fromMap(Map<String, dynamic> map) {
    return FaqUI(
      id: map['id'] as int,
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }
}
