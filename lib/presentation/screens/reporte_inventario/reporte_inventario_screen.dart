import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';
import 'package:herrera_app/presentation/providers/reporte_inventario_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/productos_en_riesgos_cards.dart';
import '../../widgets/app_bar.dart';
import '../../theme/app_colors.dart';

class ReporteDeInventarioScreen extends StatefulWidget {
  const ReporteDeInventarioScreen({super.key});

  @override
  State<ReporteDeInventarioScreen> createState() =>
      _ReporteDeInventarioScreenState();
}

class _ReporteDeInventarioScreenState extends State<ReporteDeInventarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReporteInventarioProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Scaffold(
            appBar: AppAppBar(
              title: 'Reporte de Inventario',
              showBackButton: true,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (provider.errorMessage != null) {
          return Scaffold(
            appBar: const AppAppBar(
              title: 'Reporte de Inventario',
              showBackButton: true,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.errorMessage!),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: provider.cargarReporte,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          );
        }

        final reporte = provider.reporte;
        if (reporte == null) {
          return const Scaffold(
            appBar: AppAppBar(
              title: 'Reporte de Inventario',
              showBackButton: true,
            ),
            body: Center(child: Text('No hay datos del reporte disponibles')),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppAppBar(
            title: 'Reporte de Inventario',
            showBackButton: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'Inventario',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                _buildSummaryCard(
                  reporte.inventaryValue,
                  reporte.lowStockProducts,
                ),
                _buildRiskProductSection(reporte.productosRiesgo),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryCard(double inventoryValue, int lowStockProducts) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Valor Total',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'C\$${inventoryValue.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Productos en Alerta',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFBA1A1A).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$lowStockProducts en alerta',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFBA1A1A),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.error_outline,
                        size: 16,
                        color: Color(0xFFBA1A1A),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskProductSection(List<ProductoRiesgo> productosRiesgo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(
            'Productos en Riesgo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ),
        if (productosRiesgo.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('No hay productos en riesgo.'),
          )
        else
          ...productosRiesgo.map(
            (producto) => ProductoEnRiesgoCard(
              productName: producto.productName,
              size: '${producto.presentationName} · ${producto.flavorName}',
              currentStock: producto.currentStock,
              maxStock: producto.minimunStock > producto.currentStock
                  ? producto.minimunStock
                  : (producto.currentStock > 0 ? producto.currentStock : 1),
              badgeText:
                  producto.status ??
                  (producto.isOutOfStock == true ? 'Agotado' : 'Stock bajo'),
            ),
          ),
      ],
    );
  }
}
