import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class FaqV1 {
  // Each "Entity" needs a unique integer ID property.
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

  FaqV1({
    this.id = 0,
    required this.question,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }
  factory FaqV1.toFaq(Map<String, dynamic> data) {
    String ans = '';
    if (data?['queryTemplateAssociations'].toString() != '[]') {
      ans = data?['queryTemplateAssociations']?[0]?['templateAttributes']
              ?['answer'] ??
          '';
    }
    FaqV1 faq = FaqV1(question: data['intentText'] ?? '', answer: ans);
    return faq;
  }
// toString() => 'Product{id: $id, name: $name,skuCode:$skuCode }';
}
