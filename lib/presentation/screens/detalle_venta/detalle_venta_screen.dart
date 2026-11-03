import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/presentation/providers/ventas_provider.dart';
import 'package:herrera_app/presentation/theme/app_colors.dart';
import 'package:herrera_app/presentation/widgets/app_bar.dart';
import 'package:herrera_app/presentation/widgets/error_retry_message.dart';
import 'package:provider/provider.dart';

class DetalleDeVentaScreen extends StatefulWidget { final int saleId; const DetalleDeVentaScreen({super.key, required this.saleId}); @override State<DetalleDeVentaScreen> createState() => _DetalleDeVentaScreenState(); }
class _DetalleDeVentaScreenState extends State<DetalleDeVentaScreen> {
  @override void initState() { super.initState(); WidgetsBinding.instance.addPostFrameCallback((_) => context.read<VentasProvider>().cargarDetalle(widget.saleId)); }
  @override Widget build(BuildContext context) => Scaffold(backgroundColor: AppColors.background, appBar: const AppAppBar(title: 'Detalles de Venta', showBackButton: true), body: Consumer<VentasProvider>(builder: (_, provider, _) {
    if (provider.status == VentasViewStatus.loading) return const Center(child: CircularProgressIndicator());
    if (provider.status == VentasViewStatus.error) return ErrorRetryMessage(message: provider.errorMessage, onRetry: () => provider.cargarDetalle(widget.saleId));
    final venta = provider.detalle; if (venta == null) return const SizedBox.shrink(); return _contenido(venta);
  }));
  Widget _contenido(VentaDetalleModel venta) => ListView(padding: const EdgeInsets.all(16), children: [
    _panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(venta.saleCode, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.primaryText)), const SizedBox(height:6), Text(venta.saleDate ?? 'Sin fecha', style: const TextStyle(color: AppColors.textSecondary)), const SizedBox(height:8), Text(venta.paymentStatusName, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600))])),
    const SizedBox(height:12), _panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('INFORMACIÓN GENERAL', style: TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height:10), Text('Cliente: ${venta.customerName}'), Text('Método de pago: ${venta.paymentTypeName}'), Text('Tipo de venta: ${venta.saleTypeName}') ])),
    const SizedBox(height:12), _panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('PRODUCTOS (${venta.details.length})', style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height:10), ...venta.details.map((item) => ListTile(contentPadding: EdgeInsets.zero, title: Text(item.productName), subtitle: Text('${item.quantity} x C\$ ${item.unitPrice.toStringAsFixed(2)}'), trailing: Text('C\$ ${item.lineSubtotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w600)))) ])),
    const SizedBox(height:12), _panel(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('TOTAL', style: TextStyle(fontWeight: FontWeight.w700)), Text('C\$ ${venta.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize:20, color: AppColors.primary))])),
  ]);
  Widget _panel({required Widget child}) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)), child: child);
}
