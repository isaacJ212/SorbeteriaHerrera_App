import 'package:flutter/material.dart';

class DetallePedidoResponseModel { //detalle general / ebcabezado
  final int id;
  final String saleCode;
  final String saleDate; 
  final String? orderCode;
  final Customer custumer;
  final List<DetallePedidoItem> details;
  final List<PaymentDetail> payment;

  const DetallePedidoResponseModel({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    this.orderCode,
    required this.custumer,
    required this.details,
    required this.payment
  });

  static DetallePedidoResponseModel fromJson(Map<String, dynamic> json){
    return DetallePedidoResponseModel(
      id: json['id'] as  int, 
      saleCode: json['saleCode'] as String, 
      saleDate: json['saleDate'] as String,
      orderCode: json['orderCode'] as String?, 
      custumer: Customer.fromJson(json['custumer'] as Map<String, dynamic>),
      details: (json['details'] as List).map((items) => DetallePedidoItem.fromJson(items as Map<String, dynamic>)).toList(),
      payment: (json['payment'] as List).map((payments) => PaymentDetail.fromJson(payments as Map<String, dynamic>)).toList(),
    );
  }
}

class Customer {
  final String fullName;
  final String departamentName;
  final String municipalityName;
  final String? pointOfSale;

  const Customer({
    required this.fullName,
    required this.departamentName,
    required this.municipalityName,
    this.pointOfSale
  });

  static Customer fromJson(Map<String, dynamic> json){
    return Customer(
      fullName: json['fullName'] as String, 
      departamentName: json['departamentName'] as String, 
      municipalityName: json['municipalityName'] as String,
      pointOfSale: json['pointOfSale'] as String?
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'fullName': fullName, 
      'departamentName': departamentName, 
      'municipalityName': municipalityName,
      'pointOfSale': pointOfSale,
    };
  }
}

// detalle de los items 

class DetallePedidoItem {
  final String productName;
  final int quantity;
  final double unitPrice;
  final double lineSubTotal;

  const DetallePedidoItem({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.lineSubTotal,
  });

  static DetallePedidoItem fromJson(Map<String, dynamic> json){
    return DetallePedidoItem(
      productName: json['productName'] as String, 
      quantity: json['quantity'] as int, 
      unitPrice: json['unitPrice'] as double, 
      lineSubTotal: json['lineSubTotal'] as double
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'productName': productName, 
      'quantity': quantity, 
      'unitPrice': unitPrice, 
      'lineSubTotal': lineSubTotal
    };
  }
}


class PaymentDetail{
  final double amount;
  final String paymentMethodName;
  final String registraredByUserName;


  const PaymentDetail({
    required this.amount,
    required this.paymentMethodName,
    required this.registraredByUserName,
  });

  static PaymentDetail fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
      amount: json['amount'] as double, 
      paymentMethodName: json['paymentMethodName'] as String, 
      registraredByUserName: json['registraredByUserName'] as String,
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'amount': amount, 
      'paymentMethodName': paymentMethodName, 
      'registraredByUserName': registraredByUserName
    };
  }
}
