import 'package:flutter/material.dart';

class DetallePedidoResponseModels { //detalle general / ebcabezado
  final int id;
  final String saleCode;
  final String saleDate; 
  final String? orderCode;
  final Custumer custumer;
  final List<DetalleItems> details;
  final List<PaymentDetails> payment;

  const DetallePedidoResponseModels({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    this.orderCode,
    required this.custumer,
    required this.details,
    required this.payment
  });

}

class Custumer {
  final String fullName;
  final String departamentName;
  final String municipalityName;
  final String? pointOfSale;

  const Custumer({
    required this.fullName,
    required this.departamentName,
    required this.municipalityName,
    this.pointOfSale
  });
}

// detalle de los items 

class DetalleItems {
  final String productName;
  final int quuantity;
  final double unitPrice;
  final double lineSubTotal;

  const DetalleItems({
    required this.productName,
    required this.quuantity,
    required this.unitPrice,
    required this.lineSubTotal,
  });
}


class PaymentDetails{
  final double amount;
  final String paymentMethodName;
  final String registraredByUserName;


  const PaymentDetails({
    required this.amount,
    required this.paymentMethodName,
    required this.registraredByUserName,


  });
}
