import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class Incentive {
  @Id()
  int id = 0;

  @Index()
  String outletCode;

  @Index()
  String type;

  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  String typeCode;

  int potentialPoints;
  int earnedPoints;
  int availablePoints;

  Incentive(
      {required this.outletCode,
      required this.type,
      required this.potentialPoints,
      required this.earnedPoints})
      : typeCode = "$outletCode@-@$type",
        availablePoints = potentialPoints - earnedPoints;

  Map<String, dynamic> toMap() {
    return {
      'outletCode': outletCode,
      'type': type,
      'typeCode': typeCode,
      'potentialPoints': potentialPoints,
      'earnedPoints': earnedPoints,
      'availablePoints': availablePoints,
    };
  }
}
