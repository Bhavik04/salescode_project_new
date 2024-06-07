import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletMappingLocation {
  @Id()
  int id = 0;
  String? region = "";
  String? salesTeritory = "";
  List<String>? state = [];
  List<String>? city = [];
  String? district = "";
  String? cityClassification = "";
  String? cityCluster = "";
  List<String>? routeName = [];
  OutletMappingLocation(
      {this.region,
      this.salesTeritory,
      this.state,
      this.city,
      this.district,
      this.cityClassification,
      this.cityCluster,
      this.routeName});

  Map<String, dynamic> toMap() {
    return {
      'region': region,
      'salesTeritory': salesTeritory,
      'state': state,
      'city': city,
      'district': district,
      'cityClassification': cityClassification,
      'cityCluster': cityCluster,
      'routeName': routeName
    };
  }
}
