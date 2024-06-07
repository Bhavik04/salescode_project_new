import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class LeaderboardIncentiveModel {
  @Id()
  int id = 0;
  String loginId ;
  String name;
  int previousRank;
  int currentRank;
  double potentialPoints;
  double earnedPoints;

  LeaderboardIncentiveModel({
    required this.loginId,
    required this.name,
    required this.previousRank,
    required this.currentRank,
    required this.potentialPoints,
    required this.earnedPoints,
  });
}
