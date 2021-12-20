import 'dart:convert';

// ? Stock Model

// * ---------------------------RESPONSE--------------------------
//           {
//             "_id": "60ef41ffc52f4931b44dc0e6",
//             "stock": -24,
//             "operationNumber": 1
//           },
// * ----------------------------------------------------------------------
class Stock {
  final String stockId;
  final int stock;
  final int operationNumber;
  Stock({
    required this.stockId,
    required this.stock,
    required this.operationNumber,
  });

  Stock copyWith({
    String? stockId,
    int? stock,
    int? operationNumber,
  }) {
    return Stock(
      stockId: stockId ?? this.stockId,
      stock: stock ?? this.stock,
      operationNumber: operationNumber ?? this.operationNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stockId': stockId,
      'stock': stock,
      'operationNumber': operationNumber,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      stockId: map['_id'],
      stock: map['stock'],
      operationNumber: map['operationNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Stock.fromJson(String source) => Stock.fromMap(json.decode(source));

  @override
  String toString() => 'Stock(stockId: $stockId, stock: $stock, operationNumber: $operationNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stock &&
        other.stockId == stockId &&
        other.stock == stock &&
        other.operationNumber == operationNumber;
  }

  @override
  int get hashCode => stockId.hashCode ^ stock.hashCode ^ operationNumber.hashCode;
}
