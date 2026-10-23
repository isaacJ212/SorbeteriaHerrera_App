class InventarioResponseGeneralModels {
  final int id;
  final String productName;
  final String imageUrl;
  final int totalStock;
  final int? retailStock;

  const InventarioResponseGeneralModels({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.totalStock,
    this.retailStock

  });

}