import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletSurveyResponseModel {
  @Id(assignable: true)
  int id;
  String outletCode;
  String answerId;
  List<String> answer;
  String responseType;
  String lastModifiedTime;

  OutletSurveyResponseModel(
      {this.id = 0,
      required this.outletCode,
      required this.answerId,
      required this.answer,
      required this.responseType,
      required this.lastModifiedTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'outletCode': outletCode,
      'answerId': answerId,
      'answer': answer,
      'responseType': responseType,
      'lastModifiedTime': lastModifiedTime
    };
  }
}
