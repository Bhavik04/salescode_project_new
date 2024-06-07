import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class SalesRepOutletsV1 {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  @Id()
  int id = 0;
  String outletCode;
  String loginId;
  String outletName;
  String name;
  String contactNo;
  String? currentPJPUsersV1;
  String totalClicked;
  String todayClicked;
  String? lastOrderDateV1;
  String appLink;
  String totalOrder;
  String todayOrder;
  String registered;
  SalesRepOutletsV1(
      {this.id = 0,
      required this.outletCode,
      required this.loginId,
      required this.outletName,
      required this.name,
      required this.contactNo,
      required this.currentPJPUsersV1,
      required this.totalClicked,
      required this.todayClicked,
      required this.lastOrderDateV1,
      required this.appLink,
      required this.totalOrder,
      required this.todayOrder,
      required this.registered});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'outletCode': outletCode,
      'loginId': loginId,
      'outletName': outletName,
      'name': name,
      'contactNo': contactNo,
      'currentPJPUsersV1': currentPJPUsersV1,
      'totalClicked': totalClicked,
      'todayClicked': todayClicked,
      'lastOrderDateV1': lastOrderDateV1,
      'appLink': appLink,
      'totalOrder': totalOrder,
      'todayOrder': todayOrder,
      'registered': registered
    };
  }

  factory SalesRepOutletsV1.getEachOutlets(
      Map<String, dynamic> outletData, String registered) {
    SalesRepOutletsV1 outLet = SalesRepOutletsV1(
        outletCode: outletData['outletCode'],
        loginId: outletData['loginId'],
        outletName: outletData['outletName'],
        name: outletData['name'],
        contactNo: outletData['contactno'],
        currentPJPUsersV1: outletData['currentPJPUsers'].toString(),
        totalClicked: outletData['totalClicked'],
        todayClicked: outletData['todayClicked'],
        lastOrderDateV1: outletData['lastOrderDate'].toString(),
        appLink: outletData['appLink'],
        totalOrder: outletData['totalOrder'],
        todayOrder: outletData['todayOrder'],
        registered: registered);
    return outLet;
  }
}
