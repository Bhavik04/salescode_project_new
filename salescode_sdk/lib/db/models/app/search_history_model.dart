import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SearchHistoryModelV1 {
  @Id()
  int id;
  String searchHistory;

  SearchHistoryModelV1({this.id = 0, required this.searchHistory});
}
