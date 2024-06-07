import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class MonthlyIncentiveModel {
  @Id()
  int id = 0;
  String taskName;
  String period;
  double potentialPoints;
  double earnedPoints;

  MonthlyIncentiveModel({
    required this.taskName,
    required this.period,
    required this.potentialPoints,
    required this.earnedPoints,
  });
}
