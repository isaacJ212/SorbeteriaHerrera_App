class VentasReponseModels {
  final int id;
  final String saleCode;
  final String saleDate;
  final String custumerName;
  final int saleTypeId;
  final String saleTypeName;
  final int paymentTypeId;
  final String paymentTypeName;
  final int total ;


  const VentasReponseModels({
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
}