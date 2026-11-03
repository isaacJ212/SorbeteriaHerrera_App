import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/presentation/providers/ventas_provider.dart';
import 'package:herrera_app/presentation/routes/app_routes.dart';
import 'package:herrera_app/presentation/screens/ventas/widgets/metrica_venta_card.dart';
import 'package:herrera_app/presentation/screens/ventas/widgets/venta_reciente_card.dart';
import 'package:herrera_app/presentation/theme/app_colors.dart';
import 'package:herrera_app/presentation/widgets/app_bar.dart';
import 'package:herrera_app/presentation/widgets/bottom_navbar.dart';
import 'package:herrera_app/presentation/widgets/error_retry_message.dart';
import 'package:provider/provider.dart';

class VentaScreen extends StatefulWidget { const VentaScreen({super.key}); @override State<VentaScreen> createState() => _VentaScreenState(); }
class _VentaScreenState extends State<VentaScreen> {
  int _tabActual = 1;
  @override void initState() { super.initState(); WidgetsBinding.instance.addPostFrameCallback((_) => context.read<VentasProvider>().cargarVentas()); }
  @override Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    appBar: AppAppBar(title: 'Ventas', actions: [IconButton(tooltip: 'Actualizar', onPressed: () => context.read<VentasProvider>().cargarVentas(), icon: const Icon(Icons.refresh, color: AppColors.primaryText))]),
    body: Consumer<VentasProvider>(builder: (_, ventas, _) {
      if (ventas.status == VentasViewStatus.loading) return const Center(child: CircularProgressIndicator());
      if (ventas.status == VentasViewStatus.error) return ErrorRetryMessage(message: ventas.errorMessage, onRetry: ventas.cargarVentas);
      final total = ventas.ventas.fold<double>(0, (sum, item) => sum + item.total);
      final promedio = ventas.ventas.isEmpty ? 0 : total / ventas.ventas.length;
      return ListView(padding: const EdgeInsets.all(16), children: [
        const Text('RESUMEN DE VENTAS', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 11)),
        const SizedBox(height: 12),
        Row(children: [Expanded(child: MetricaVentaCard(titulo: 'VENTAS', valor: 'C\$ ${total.toStringAsFixed(2)}', descripcion: 'Total listado', icono: Icons.point_of_sale_outlined)), const SizedBox(width: 12), Expanded(child: MetricaVentaCard(titulo: 'TICKETS', valor: '${ventas.ventas.length}', descripcion: 'Ventas registradas', icono: Icons.receipt_long_outlined))]),
        const SizedBox(height: 12),
        MetricaVentaCard(titulo: 'PROMEDIO', valor: 'C\$ ${promedio.toStringAsFixed(2)}', descripcion: 'Por venta', icono: Icons.calculate_outlined),
        const SizedBox(height: 22),
        Text('Ventas recientes (${ventas.ventas.length})', style: const TextStyle(color: AppColors.primaryText, fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        if (ventas.ventas.isEmpty) const Center(child: Padding(padding: EdgeInsets.all(24), child: Text('No hay ventas registradas')))
        else ...ventas.ventas.map((venta) => Padding(padding: const EdgeInsets.only(bottom: 10), child: _ventaCard(venta))),
      ]);
    }),
    bottomNavigationBar: BottomNavbar(currentIndex: _tabActual, onTap: _navegarTab),
  );
  Widget _ventaCard(VentasResponseModel venta) {
    final fecha = DateTime.tryParse(venta.saleDate)?.toLocal();
    final hora = fecha == null ? '-' : '${fecha.hour.toString().padLeft(2, '0')}:${fecha.minute.toString().padLeft(2, '0')}';
    return VentaRecienteCard(numero: '#${venta.id}', factura: venta.saleCode, hora: hora, cliente: venta.customerName, total: 'C\$ ${venta.total.toStringAsFixed(2)}', estado: 'Completada', vendedor: venta.saleTypeName, metodoPago: venta.paymentTypeName, iconoPago: Icons.payments_outlined, onTap: () => Navigator.pushNamed(context, AppRoutes.detalleVenta, arguments: venta.id));
  }
  void _navegarTab(int index) { if (index == _tabActual) return; setState(() => _tabActual = index); final routes = [AppRoutes.dashboard, AppRoutes.ventas, AppRoutes.inventario, AppRoutes.reportes, AppRoutes.mas]; Navigator.pushReplacementNamed(context, routes[index]); }
}
