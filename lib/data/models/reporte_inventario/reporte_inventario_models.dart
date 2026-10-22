class ReporteInventarioModels {
  //endpoitn de /api/Inventory/stats
  //parte general
  final int totalProducts;
  final int lowStockProducts;
  final double inventaryValue;

  //productos en riesgos
  final List<ProductosRiesgo> productosRiesgo;

  const ReporteInventarioModels({
    required this.totalProducts,
    required this.lowStockProducts,
    required this.inventaryValue,
    required this.productosRiesgo,
  });




}

class ProductosRiesgo{
  final String productName;
  final String presentationName;
  final String flavorName;
  final String? imageUrl;
  final int currentStock;
  final int minimunStock;
  final bool? isOutOfStock;
  final String?  status;

  const ProductosRiesgo({
    required this.productName,
    required this.presentationName,
    required this.flavorName,
    this.imageUrl,
    required this.currentStock,
    required this.minimunStock,
    this.isOutOfStock,
    this.status,
  });


}