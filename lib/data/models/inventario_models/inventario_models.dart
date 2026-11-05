class InventarioResponseGeneralModels {
  final int productId;
  final String productName;
  final String lineName;
  final String presentationName;
  final String flavorName;
  final int totalStock;
  final double? retailPrice;

  const InventarioResponseGeneralModels({
    required this.productId,
    required this.productName,
    required this.lineName,
    required this.presentationName,
    required this.flavorName,
    required this.totalStock,
    required this.retailPrice,
  });

  factory InventarioResponseGeneralModels.fromJson(Map<String, dynamic> json) {
    return InventarioResponseGeneralModels(
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      lineName: json['lineName'] as String,
      presentationName: json['presentationName'] as String,
      flavorName: json['flavorName'] as String,
      totalStock: json['totalStock'] as int,
      retailPrice: (json['retailPrice'] as num?)?.toDouble(),
    );
  }
}
