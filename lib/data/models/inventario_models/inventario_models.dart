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


  static InventarioResponseGeneralModels fromJson(Map<String, dynamic> json){
    return InventarioResponseGeneralModels(
      id: json['id'] as int, 
      productName: json['productName'] as String, 
      imageUrl: json['imageUrl'] as String, 
      totalStock: json['totalStock'] as int,
      retailStock: json['retailStock'] as int,
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'id': id, 
      'productName': productName, 
      'imageUrl': imageUrl, 
      'totalStock': totalStock,
      'retailStock': retailStock,
    };
  }
}