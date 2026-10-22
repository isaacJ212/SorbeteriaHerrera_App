class DetalleInventarioModels {
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
  final List<DetailsLote>lotes;

  const DetalleInventarioModels({
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


}


class DetailsLote{
  final String batchCode;
  final String entryDate;
  final String expirationDate;
  final int totalCurrentStock;

  const DetailsLote({
    required this.batchCode,
    required this.entryDate,
    required this.expirationDate,
    required this.totalCurrentStock
  });
 
}