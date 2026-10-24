class DetalleVentaResponseModel {
  final int id;
  final String saleCode;
  final String saleDate;
  final DetalleVentaCustomerModel customer;
  final double total;
  final String createdByUserName;
  final String paymentTypeName;
  final List<DetalleVentaItemModel> details;
  final List<DetalleVentaPaymentModel> payment;

  const DetalleVentaResponseModel({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    required this.customer,
    required this.total,
    required this.createdByUserName,
    required this.paymentTypeName,
    required this.details,
    required this.payment,
  });

  static DetalleVentaResponseModel fromJson(Map<String, dynamic> json){
    return DetalleVentaResponseModel(
      id: json['id'] as int, 
      saleCode: json['saleCode'] as String, 
      saleDate: json['saleDate'] as String , 
      customer: DetalleVentaCustomerModel.fromJson(json['custumer'] as Map<String, dynamic>), 
      total: json['total'] as double, 
      createdByUserName: json['createdByUserName'] as String, 
      paymentTypeName: json['paymentTypeName'] as String, 
      details: (json['details'] as List).map((items) => DetalleVentaItemModel.fromJson(items as Map<String, dynamic>)).toList(), 
      payment: (json['payments'] as List).map((payments) => DetalleVentaPaymentModel.fromJson(payments as Map<String, dynamic>)).toList(),
    );
  }
}




class DetalleVentaCustomerModel {
  final String fullName;

  const DetalleVentaCustomerModel({
    required this.fullName,
  });

  static DetalleVentaCustomerModel fromJson(Map<String, dynamic> json){
    return DetalleVentaCustomerModel(
      fullName: json['fullName'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'fullName': fullName,
    };
  }
}


class DetalleVentaItemModel {
  final String productName;
  final int quantity;
  final double unitPrice;
  final double lineSubtotal;

  const DetalleVentaItemModel({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.lineSubtotal,
  });

  static DetalleVentaItemModel fromJson(Map<String, dynamic> json){
    return DetalleVentaItemModel(
      productName: json['productName'] as String, 
      quantity: json['quantity'] as int, 
      unitPrice: json['unitPrice'] as double, 
      lineSubtotal: json['lineSubtotal'] as double,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'productName': productName, 
      'quantity': quantity, 
      'unitPrice': unitPrice, 
      'lineSubtotal': lineSubtotal
    };
  }
}



class DetalleVentaPaymentModel {
  final double amount;
  final String paymentMethodName;
  final DateTime paymentDate;

  const DetalleVentaPaymentModel({
    required this.amount,
    required this.paymentMethodName,
    required this.paymentDate,
  });


  static DetalleVentaPaymentModel fromJson(Map<String, dynamic> json){
    return DetalleVentaPaymentModel(
      amount: json['amount'] as double, 
      paymentMethodName: ['paymentMethodName'] as String, 
      paymentDate: json['paymentDate'] as DateTime
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'amount': amount, 
      'paymentMethodName': paymentMethodName, 
      'paymentDate': paymentDate,
    };
  }
}


