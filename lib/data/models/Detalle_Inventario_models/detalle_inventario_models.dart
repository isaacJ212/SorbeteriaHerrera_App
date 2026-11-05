class DetalleInventarioModel {
  final int productId;
  final String productName;
  final String lineName;
  final String presentationName;
  final String flavorName;
  final double? retailPrice;
  final int totalStock;
  final int availableForSale;
  final int minimumStock;
  final int activeBatchCount;
  final List<DetalleLote> lotes;

  const DetalleInventarioModel({
    required this.productId,
    required this.productName,
    required this.lineName,
    required this.presentationName,
    required this.flavorName,
    required this.retailPrice,
    required this.totalStock,
    required this.availableForSale,
    required this.minimumStock,
    required this.activeBatchCount,
    required this.lotes,
  });

  factory DetalleInventarioModel.fromJson(Map<String, dynamic> json) {
    return DetalleInventarioModel(
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      lineName: json['lineName'] as String,
      presentationName: json['presentationName'] as String,
      flavorName: json['flavorName'] as String,
      retailPrice: (json['retailPrice'] as num?)?.toDouble(),
      totalStock: json['totalStock'] as int,
      availableForSale: json['availableForSale'] as int,
      minimumStock: json['minimumStock'] as int,
      activeBatchCount: json['activeBatchCount'] as int,
      lotes: (json['batches'] as List<dynamic>)
          .map((item) => DetalleLote.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DetalleLote {
  final String batchCode;
  final String? entryDate;
  final String expirationDate;
  final int totalCurrentStock;

  const DetalleLote({
    required this.batchCode,
    required this.entryDate,
    required this.expirationDate,
    required this.totalCurrentStock,
  });

  factory DetalleLote.fromJson(Map<String, dynamic> json) {
    return DetalleLote(
      batchCode: json['batchCode'] as String? ?? 'Sin código',
      entryDate: json['entryDate'] as String?,
      expirationDate: json['expirationDate'] as String,
      totalCurrentStock: json['totalCurrentStock'] as int,
    );
  }
}
