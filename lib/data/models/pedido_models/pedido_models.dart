class PedidoModels {
  final int id;
  final String saleCode;
  final String saleDate;
  final String paymentTypeName;
  final double total;

  const PedidoModels({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    required this.paymentTypeName,
    required this.total
  });


  static PedidoModels fromJson(Map<String, dynamic> json){
    return PedidoModels(
      id: json['id'] as int, 
      saleCode: json['saleCode'] as String, 
      saleDate: json['saleDate'] as String, 
      paymentTypeName: json['paymentTypeName'] as String, 
      total: json['total'] as double,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'saleCode': saleCode,
      'saleDate': saleDate,
      'paymentTypeName': paymentTypeName,
      'total': total,
    };
  }




}