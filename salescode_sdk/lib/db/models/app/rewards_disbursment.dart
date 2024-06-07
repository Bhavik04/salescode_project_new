import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class RewardsDisbursmentV1 {
  @Id()
  int id = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime lastModified;
  String amount;
  String tds;
  String total;
  String invoiceNumber;
  int monthNumber;
  int payoutYear;
  String transactionID;
  String bankName;

  RewardsDisbursmentV1({
    required this.lastModified,
    required this.amount,
    required this.tds,
    required this.total,
    required this.invoiceNumber,
    required this.monthNumber,
    required this.transactionID,
    required this.bankName,
    required this.payoutYear,
  });

  factory RewardsDisbursmentV1.fromMap(Map<String, dynamic> map) {
    return RewardsDisbursmentV1(
      lastModified: map['lastModified'],
      amount: map['amount'],
      tds: map['tds'],
      total: map['total'],
      invoiceNumber: map['invoiceNumber'],
      monthNumber: map['monthNumber'],
      transactionID: map['transactionID'],
      bankName: map['bankName'],
      payoutYear: map['payoutYear'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastModified': lastModified,
      'amount': amount,
      'tds': tds,
      'total': total,
      'invoiceNumber': invoiceNumber,
      'monthNumber': monthNumber,
      'transactionID': transactionID,
      'bankName': bankName,
      'payoutYear': payoutYear,
    };
  }
}
