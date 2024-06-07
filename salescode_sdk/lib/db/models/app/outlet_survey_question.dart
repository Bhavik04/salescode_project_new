import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletSurveyQuestionModel {
  @Id(assignable: true)
  int id;
  String quesId;
  String question;
  List<String> options;
  String qid;
  String eventId;
  String responseType;
  String eventType;

  OutletSurveyQuestionModel({
    this.id = 0,
    required this.question,
    required this.options,
    required this.quesId,
    required this.qid,
    required this.eventId,
    required this.responseType,
    required this.eventType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quesId': quesId,
      'question': question,
      'options': options,
      'qid': qid,
      'eventId': eventId,
      'responseType': responseType,
      'eventType': eventType,
    };
  }
}
