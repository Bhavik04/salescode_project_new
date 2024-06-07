import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class LocateMeV1 {
  @Id()
  int id;
  String latitude;
  String longitude;
  String address;
  String pincode;
  String landmark;
  String locality;
  String loginId;

  LocateMeV1(
      {this.id = 0,
      this.latitude = "",
      this.longitude = "",
      this.address = "",
      this.pincode = "",
      this.landmark = "",
      this.locality = "",
      this.loginId = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'pincode': pincode,
      'landmark': landmark,
      'locality': locality,
      'loginId': loginId,
    };
  }

  factory LocateMeV1.fromMap(Map<String, dynamic> map) {
    return LocateMeV1(
      id: map['id'] ?? 0,
      latitude: map['latitude'] != null ? map['latitude'] as String : "",
      longitude: map['longitude'] != null ? map['longitude'] as String : "",
      address: map['address'] != null ? map['address'] as String : "",
      pincode: map['pincode'] != null ? map['pincode'] as String : "",
      landmark: map['landmark'] != null ? map['landmark'] as String : "",
      locality: map['locality'] != null ? map['locality'] as String : "",
      loginId: map['loginId'] != null ? map['loginId'] as String : "",
    );
  }
}
