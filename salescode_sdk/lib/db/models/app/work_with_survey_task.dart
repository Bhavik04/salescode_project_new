import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class WorkWithSurveyTask {
  @Id(assignable: true)
  int id;
  String taskDescription;
  String taskStatus;
  String outletCode;
  String taskId;
  bool enabled;
  WorkWithSurveyTask({
    this.id = 0,
    required this.taskDescription,
    required this.taskStatus,
    required this.outletCode,
    required this.taskId,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'outletCode': outletCode,
      'taskId': taskId,
      'enabled': enabled
    };
  }
}
