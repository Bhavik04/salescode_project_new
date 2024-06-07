import 'package:objectbox/objectbox.dart'
if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class BackInStock{
  @Id()
  int id = 0;
  String skuCode;
  bool productPurchased;
  String date;

  BackInStock({
    this.id = 0,
    required this.skuCode,
    required this.productPurchased,
    this.date = ''
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skuCode': skuCode,
      'productPurchased': productPurchased,
      'date': date
    };
  }

  factory BackInStock.fromMap(Map<String, dynamic> map) {
    return BackInStock(
      id: map['id'] ?? 0,
      skuCode: map['skuCode'] ?? '',
      productPurchased: map['productPurchased'] ?? '',
      date: map['date'] ?? ''
    );
  }
}
