class ReporteInventarioModel {
  //endpoitn de /api/Inventory/stats
  //parte general
  final int totalProducts;
  final int lowStockProducts;
  final double inventaryValue;

  //productos en riesgos
  final List<ProductoRiesgo> productosRiesgo;

  const ReporteInventarioModel({
    required this.totalProducts,
    required this.lowStockProducts,
    required this.inventaryValue,
    required this.productosRiesgo,
  });

  static ReporteInventarioModel fromJson(Map<String, dynamic> json){
    return ReporteInventarioModel(
      totalProducts: json['totalProducts']as int, 
      lowStockProducts: json['lowStockProducts']as int, 
      inventaryValue: json['inventaryValue'] as double, 
      productosRiesgo: (json['productosRiesgo'] as List).map((items) => ProductoRiesgo.fromJson(items as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'totalProducts': totalProducts, 
      'lowStockProducts': lowStockProducts, 
      'inventaryValue': inventaryValue, 
      'productosRiesgo': productosRiesgo}
    ;
  }




}

class ProductoRiesgo{
  final String productName;
  final String presentationName;
  final String flavorName;
  final String? imageUrl;
  final int currentStock;
  final int minimunStock;
  final bool? isOutOfStock;
  final String?  status;

  const ProductoRiesgo({
    required this.productName,
    required this.presentationName,
    required this.flavorName,
    this.imageUrl,
    required this.currentStock,
    required this.minimunStock,
    this.isOutOfStock,
    this.status,
  });


  static ProductoRiesgo fromJson(Map<String, dynamic> json){
    return ProductoRiesgo(
      productName: json['productName']as String, 
      presentationName: json['presentationName']as String, 
      flavorName: json['flavorName']as String, 
      imageUrl:json['imageUrl'] as String,
      currentStock: json['currentStock']as int, 
      minimunStock: json['minimunStock']as int,
      isOutOfStock: json['isOutOfStock'] as bool,
      status: json['status']as String,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'productName': productName, 
      'presentationName': presentationName, 
      'flavorName': flavorName,
      'imageUrl': imageUrl, 
      'currentStock': currentStock, 
      'minimunStock': minimunStock,
      'isOutOfStock': isOutOfStock,
      'status': status,
    };
  }


}