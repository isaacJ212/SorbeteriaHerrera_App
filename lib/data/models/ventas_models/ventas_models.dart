class VentasResponseModel {
  final int id;
  final String saleCode;
  final String saleDate;
  final String customerName;
  final int saleTypeId;
  final String saleTypeName;
  final int paymentTypeId;
  final String paymentTypeName;
  final double total;

  const VentasResponseModel({
    required this.id,
    required this.saleCode,
    required this.saleDate,
    required this.customerName,
    required this.saleTypeId,
    required this.saleTypeName,
    required this.paymentTypeId,
    required this.paymentTypeName,
    required this.total,
  });

  static VentasResponseModel fromJson(Map<String, dynamic> json) {
    return VentasResponseModel(
      id: json['id'] as int,
      saleCode: json['saleCode'] as String,
      saleDate: json['saleDate'] as String,
      customerName: json['customerName'] as String,
      saleTypeId: json['saleTypeId'] as int,
      saleTypeName: json['saleTypeName'] as String,
      paymentTypeId: json['paymentTypeId'] as int,
      paymentTypeName: json['paymentTypeName'] as String,
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'saleCode': saleCode,
      'saleDate': saleDate,
      'customerName': customerName,
      'saleTypeId': saleTypeId,
      'saleTypeName': saleTypeName,
      'paymentTypeId': paymentTypeId,
      'paymentTypeName': paymentTypeName,
      'total': total,
    };
  }
}

class VentaDetalleModel {
  final int id;
  final String saleCode;
  final String? saleDate;
  final String customerName;
  final String paymentStatusName;
  final String paymentTypeName;
  final String saleTypeName;
  final double total;
  final List<VentaDetalleItemModel> details;

  const VentaDetalleModel({required this.id, required this.saleCode, required this.saleDate, required this.customerName, required this.paymentStatusName, required this.paymentTypeName, required this.saleTypeName, required this.total, required this.details});

  factory VentaDetalleModel.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'];
    final rawDetails = json['details'] as List? ?? [];
    return VentaDetalleModel(
      id: json['id'] as int,
      saleCode: json['saleCode'] as String? ?? '',
      saleDate: json['saleDate'] as String?,
      customerName: customer is Map<String, dynamic> ? (customer['name'] ?? customer['customerName'] ?? 'Consumidor final').toString() : 'Consumidor final',
      paymentStatusName: json['paymentStatusName'] as String? ?? 'Completada',
      paymentTypeName: json['paymentTypeName'] as String? ?? 'Sin especificar',
      saleTypeName: json['saleTypeName'] as String? ?? 'Venta',
      total: (json['total'] as num?)?.toDouble() ?? 0,
      details: rawDetails.map((item) => VentaDetalleItemModel.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class VentaDetalleItemModel {
  final String productName;
  final double quantity;
  final double unitPrice;
  final double lineSubtotal;
  const VentaDetalleItemModel({required this.productName, required this.quantity, required this.unitPrice, required this.lineSubtotal});
  factory VentaDetalleItemModel.fromJson(Map<String, dynamic> json) => VentaDetalleItemModel(
    productName: json['productName'] as String? ?? 'Producto',
    quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
    lineSubtotal: (json['lineSubtotal'] as num?)?.toDouble() ?? 0,
  );
}
