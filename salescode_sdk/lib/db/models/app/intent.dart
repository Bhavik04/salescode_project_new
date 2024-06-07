import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class IntentInfoV1 {
  @Id()
  int id;
  String outletCode;
  String intent;
  String suggestions;
  String template;
  String data;
  String templateAttributes;
  String queryName;

  IntentInfoV1(
      {this.id = 0,
      required this.outletCode,
      required this.intent,
      required this.suggestions,
      required this.template,
      required this.data,
      required this.templateAttributes,
      required this.queryName});
}
