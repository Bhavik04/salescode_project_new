import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class StockQuantityV1 {
  @Id()
  int id;
  @Index()
  String batchCode;
  int qty;
  String supplier;

  StockQuantityV1(
      {this.id = 0,
      required this.batchCode,
      required this.qty,
      required this.supplier});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'batchCode': batchCode,
      'qty': qty,
      'supplier': supplier,
    };
  }

  factory StockQuantityV1.fromMap(Map<String, dynamic> data) {
    int qty = data['qty'].toInt() ?? 0;
    var stockQuantity = StockQuantityV1(
      batchCode: data['batchCode'].toString() ?? '',
      qty: qty < 0 ? 0 : qty,
      supplier: data['supplier'].toString(),
    );
    return stockQuantity;
  }
}
