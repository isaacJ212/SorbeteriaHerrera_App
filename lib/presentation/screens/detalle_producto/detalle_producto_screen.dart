import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/Detalle_Inventario_models/detalle_inventario_models.dart';
import 'package:provider/provider.dart';

import '../../providers/inventario_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/error_retry_message.dart';
import '../../widgets/label.dart';
import 'widgets/detalles_producto_widgets.dart';

class DetalleDeProductoScreen extends StatefulWidget {
  final int productId;

  const DetalleDeProductoScreen({super.key, required this.productId});

  @override
  State<DetalleDeProductoScreen> createState() =>
      _DetalleDeProductoScreenState();
}

class _DetalleDeProductoScreenState extends State<DetalleDeProductoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<InventarioProvider>().cargarDetalle(widget.productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventarioProvider>();
    final detalle = provider.detalle;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: const AppAppBar(
        title: 'Detalle de Inventario',
        showBackButton: true,
      ),
      body: provider.viewStatus == InventarioViewStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.viewStatus == InventarioViewStatus.error
          ? ErrorRetryMessage(
              message: provider.errorMessage,
              onRetry: () => provider.cargarDetalle(widget.productId),
            )
          : detalle == null
          ? const Center(child: Text('Producto no encontrado'))
          : _contenido(detalle),
    );
  }

  Widget _contenido(DetalleInventarioModel detalle) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detalle.productName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF10251F),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Etiqueta(
                texto: 'HER-${detalle.productId.toString().padLeft(3, '0')}',
              ),
              const SizedBox(width: 8),
              Etiqueta(texto: '${detalle.activeBatchCount} Lotes Activos'),
            ],
          ),
          const SizedBox(height: 16),
          _informacionProducto(detalle),
          const SizedBox(height: 16),
          _resumenStock(detalle),
          const SizedBox(height: 16),
          const Text(
            'Lotes Activos',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF10251F),
            ),
          ),
          const SizedBox(height: 8),
          _tablaLotes(detalle.lotes),
        ],
      ),
    );
  }

  Widget _informacionProducto(DetalleInventarioModel detalle) {
    return DetalleProductoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INFORMACIÓN DEL PRODUCTO',
            style: TextStyle(fontSize: 11, color: Color(0xFF64736D)),
          ),
          const SizedBox(height: 12),
          FilaInformacionProducto(
            etiqueta: 'Precio de venta',
            valor: detalle.retailPrice == null
                ? 'Sin precio'
                : 'C\$ ${detalle.retailPrice!.toStringAsFixed(2)}',
          ),
          FilaInformacionProducto(
            etiqueta: 'Línea de producto',
            valor: detalle.lineName,
          ),
          FilaInformacionProducto(
            etiqueta: 'Presentación',
            valor: detalle.presentationName,
          ),
          FilaInformacionProducto(etiqueta: 'Sabor', valor: detalle.flavorName),
        ],
      ),
    );
  }

  Widget _resumenStock(DetalleInventarioModel detalle) {
    final disponible = detalle.availableForSale > 0;
    return DetalleProductoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RESUMEN DE STOCK',
            style: TextStyle(fontSize: 11, color: Color(0xFF64736D)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DatoStockProducto(
                  etiqueta: 'Stock actual',
                  valor: '${detalle.totalStock} unidades',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DatoStockProducto(
                  etiqueta: 'Stock mínimo',
                  valor: '${detalle.minimumStock} unidades',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: disponible
                    ? const Color(0xFF0A9B6C)
                    : const Color(0xFFB66A00),
              ),
              const SizedBox(width: 6),
              Text(
                'Estado: ${disponible ? 'Disponible' : 'Agotado'}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tablaLotes(List<DetalleLote> lotes) {
    return DetalleProductoCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F5),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: const Row(
              children: [
                Expanded(flex: 13, child: Text('Lote', style: _estiloTabla)),
                Expanded(
                  flex: 18,
                  child: Text('Fecha ingreso', style: _estiloTabla),
                ),
                Expanded(
                  flex: 12,
                  child: Text('Cantidad', style: _estiloTabla),
                ),
                Expanded(
                  flex: 18,
                  child: Text('Vencimiento', style: _estiloTabla),
                ),
              ],
            ),
          ),
          if (lotes.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('No hay lotes activos'),
            ),
          for (var index = 0; index < lotes.length; index++) ...[
            FilaLoteProducto(
              lote: lotes[index].batchCode,
              ingreso: _fecha(lotes[index].entryDate),
              cantidad: '${lotes[index].totalCurrentStock}',
              vencimiento: _fecha(lotes[index].expirationDate),
            ),
            if (index != lotes.length - 1)
              const Divider(height: 1, color: Color(0xFFF0F0F0)),
          ],
        ],
      ),
    );
  }

  String _fecha(String? value) {
    if (value == null || value.isEmpty) return '-';
    final date = value.split('T').first.split('-');
    return date.length == 3 ? '${date[2]}-${date[1]}-${date[0]}' : value;
  }
}

const TextStyle _estiloTabla = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w600,
  color: Color(0xFF10251F),
);
