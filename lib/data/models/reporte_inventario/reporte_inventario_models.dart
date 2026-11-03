class ReporteInventarioModel {
  final int totalProducts;
  final int lowStockProducts;
  final double inventoryValue;
  final SaborMasVendido? bestSellingFlavor;
  final List<ProductoRiesgo> productosRiesgo;

  const ReporteInventarioModel({
    required this.totalProducts,
    required this.lowStockProducts,
    required this.inventoryValue,
    required this.bestSellingFlavor,
    required this.productosRiesgo,
  });

  factory ReporteInventarioModel.fromJson(Map<String, dynamic> json) {
    return ReporteInventarioModel(
      totalProducts: json['totalProducts'] as int,
      lowStockProducts: json['lowStockProducts'] as int,
      inventoryValue: (json['inventoryValue'] as num).toDouble(),
      bestSellingFlavor: json['bestSellingFlavor'] == null
          ? null
          : SaborMasVendido.fromJson(
              json['bestSellingFlavor'] as Map<String, dynamic>,
            ),
      productosRiesgo: (json['productsInRisk'] as List<dynamic>? ?? const [])
          .map((item) => ProductoRiesgo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SaborMasVendido {
  final String flavorName;
  final int quantitySold;
  final String period;

  const SaborMasVendido({
    required this.flavorName,
    required this.quantitySold,
    required this.period,
  });

  factory SaborMasVendido.fromJson(Map<String, dynamic> json) {
    return SaborMasVendido(
      flavorName: json['flavorName'] as String,
      quantitySold: json['quantitySold'] as int,
      period: json['period'] as String,
    );
  }
}

class ProductoRiesgo {
  final String productName;
  final String presentationName;
  final String flavorName;
  final String? imageUrl;
  final int currentStock;
  final int minimumStock;
  final bool isOutOfStock;
  final String status;

  const ProductoRiesgo({
    required this.productName,
    required this.presentationName,
    required this.flavorName,
    this.imageUrl,
    required this.currentStock,
    required this.minimumStock,
    required this.isOutOfStock,
    required this.status,
  });

  factory ProductoRiesgo.fromJson(Map<String, dynamic> json) {
    return ProductoRiesgo(
      productName: json['productName'] as String,
      presentationName: json['presentationName'] as String,
      flavorName: json['flavorName'] as String,
      imageUrl: json['imageUrl'] as String?,
      currentStock: json['currentStock'] as int,
      minimumStock: json['minimumStock'] as int,
      isOutOfStock: json['isOutOfStock'] as bool,
      status: json['status'] as String,
    );
  }
}
