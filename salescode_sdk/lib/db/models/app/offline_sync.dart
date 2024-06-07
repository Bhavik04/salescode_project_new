import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OfflineSyncV1 {
  @Id()
  int id = 0;
  String requestBodyV1;
  String api;
  String method;
  DateTime lastModifiedTimeV1;
  String status;
  @Unique(onConflict: ConflictStrategy.replace)
  String transactionIdV1;
  String referenceNumberV1;
  int attempts;
  String response;
  int responseStatus;
  String loginId;
  String outletId;
  String featureV1;
  DateTime creationTime;
  bool editV1;
  int orderSeqNum;

  OfflineSyncV1({
    this.id = 0,
    required this.requestBodyV1,
    required this.api,
    required this.method,
    required this.lastModifiedTimeV1,
    required this.status,
    required this.transactionIdV1,
    required this.referenceNumberV1,
    required this.attempts,
    required this.response,
    required this.responseStatus,
    required this.loginId,
    required this.outletId,
    required this.featureV1,
    required this.creationTime,
    required this.editV1,
    required this.orderSeqNum
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requestBodyV1': requestBodyV1,
      'api': api,
      'method': method,
      'lastModifiedTimeV1': lastModifiedTimeV1.toIso8601String(),
      'status': status,
      'transactionIdV1': transactionIdV1,
      'referenceNumberV1': referenceNumberV1,
      'attempts': attempts,
      'response': response,
      'responseStatus': responseStatus,
      'loginId': loginId,
      'outletId': outletId,
      'featureV1': featureV1,
      'creationTime': creationTime.toIso8601String(),
      'editV1': editV1,
      'orderSeqNum': orderSeqNum
    };
  }

  factory OfflineSyncV1.fromMap(Map<String, dynamic> map) {
    return OfflineSyncV1(
      id: map['id'] as int,
      requestBodyV1: map['requestBodyV1'] as String,
      api: map['api'] as String,
      method: map['method'] as String,
      lastModifiedTimeV1: DateTime.parse(map['lastModifiedTimeV1'] as String),
      status: map['status'] as String,
      transactionIdV1: map['transactionIdV1'] as String,
      referenceNumberV1: map['referenceNumberV1'] as String,
      attempts: map['attempts'] as int,
      response: map['response'] as String,
      responseStatus: map['responseStatus'] as int,
      loginId: map['loginId'] as String,
      outletId: map['outletId'] as String,
      featureV1: map['featureV1'] as String,
      creationTime: DateTime.parse(map['creationTime'] as String),
      editV1: map['editV1'] as bool,
        orderSeqNum: map['orderSeqNum'] ?? -1
    );
  }
}
