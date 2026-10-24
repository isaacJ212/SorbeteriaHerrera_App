class DetalleInventarioModel {
  //infor del producto
  final int id;
  final String productName;
  final String imageUrl;
  final String lineName;
  final String presentationName;
  final String flavorName;

  //resumen stcok

  final int availableStock;
  final int minimunStock;

  //lotes
  final List<DetalleLote>lotes;

  const DetalleInventarioModel({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.lineName,
    required this.presentationName,
    required this.flavorName, 
    required this.availableStock,
    required this.minimunStock,
    required this.lotes
  });



  static DetalleInventarioModel fromJson(Map<String, dynamic> json){
    return DetalleInventarioModel(
      id: json['id'] as int, 
      productName: json['productName'] as String, 
      imageUrl: json['imageUrl'] as String, 
      lineName: json['lineName'] as String, 
      presentationName: json['presentationName'] as String, 
      flavorName: json['flavorName'] as String, 
      availableStock: json['availableStock'] as int, 
      minimunStock: json['minimunStock'] as int, 
      lotes: (json['batches'] as List).map((item) => DetalleLote.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }


}


class DetalleLote{
  final String batchCode;
  final String entryDate;
  final String expirationDate;
  final int totalCurrentStock;

  const DetalleLote({
    required this.batchCode,
    required this.entryDate,
    required this.expirationDate,
    required this.totalCurrentStock
  });

  static DetalleLote fromJson(Map<String, dynamic> json){
    return DetalleLote(
      batchCode: json['batchCode'] as String, 
      entryDate: json['entryDate'] as String, 
      expirationDate: json['expirationDate'] as String, 
      totalCurrentStock: json['totalCurrentStock'] as int,
    );
  }
 
}