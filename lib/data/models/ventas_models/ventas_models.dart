class VentasResponseModel {
  final int id;
  final String saleCode;
  final String saleDate;
  final String custumerName;
  final int saleTypeId;
  final String saleTypeName;
  final int paymentTypeId;
  final String paymentTypeName;
  final int total ;


  const VentasResponseModel({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    required this.custumerName,
    required this.saleTypeId,
    required this.saleTypeName,
    required this.paymentTypeId,
    required this.paymentTypeName,
    required this.total
  });

  static VentasResponseModel fromJson(Map<String, dynamic> json){
    return VentasResponseModel(
      id: json['id'] as int, 
      saleCode: json['saleCode'] as String, 
      saleDate: json['saleDate'] as String, 
      custumerName: json['custumerName'] as String, 
      saleTypeId: json['saleTypeId'] as int, 
      saleTypeName: json['saleTypeName'] as String, 
      paymentTypeId: json['paymentTypeId'] as int, 
      paymentTypeName: json['paymentTypeName'] as String, 
      total: json['total'] as int,
    );
  }


  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'saleCode': saleCode,
      'saleDate': saleDate,
      'custumerName': custumerName,
      'saleTypeId': saleTypeId,
      'saleTypeName': saleTypeName,
      'paymentTypeId': paymentTypeId,
      'paymentTypeName':paymentTypeName,
      'total': total,
    };
  }




}