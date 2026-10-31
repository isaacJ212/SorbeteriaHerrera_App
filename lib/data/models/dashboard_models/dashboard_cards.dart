class DashboardCards {
  final int pedidosPendientes;
  final int alertasStock;
  final double totalVentasSemana;
  final double crecimientoVentasSemana;

  DashboardCards({
    required this.pedidosPendientes,
    required this.alertasStock,
    required this.totalVentasSemana,
    required this.crecimientoVentasSemana,
  });

  static DashboardCards fromJson(Map<String, dynamic> json) {
    return DashboardCards(
      pedidosPendientes: json['pedidosPendientes'] as int,
      alertasStock: json['alertasStock'] as int,
      totalVentasSemana: (json['totalVentasSemana'] as num).toDouble(),
      crecimientoVentasSemana: (json['crecimientoVentasSemana'] as num)
          .toDouble(),
    );
  }
}
