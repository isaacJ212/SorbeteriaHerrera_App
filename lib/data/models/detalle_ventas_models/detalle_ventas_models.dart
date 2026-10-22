class DetalleVentaResponseModel {
  final int id;
  final String saleCode;
  final DateTime saleDate;
  final DetalleVentaCustomerModel customer;
  final double total;
  final String createdByUserName;
  final String paymentTypeName;
  final List<DetalleVentaItemModel> details;
  final List<DetalleVentaPaymentModel> payments;

  const DetalleVentaResponseModel({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    required this.customer,
    required this.total,
    required this.createdByUserName,
    required this.paymentTypeName,
    required this.details,
    required this.payments,
  });
}

class DetalleVentaCustomerModel {
  final String fullName;

  const DetalleVentaCustomerModel({
    required this.fullName,
  });
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
}


