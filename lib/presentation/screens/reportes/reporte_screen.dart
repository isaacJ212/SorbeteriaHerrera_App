import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/inventario_provider.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/error_retry_message.dart';
import 'widgets/reportes_cards.dart';

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  int _tabActual = 3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<InventarioProvider>().cargarEstadisticas();
      }
    });
  }

  void _mostrarSnack(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navegarTab(int index) {
    if (index == _tabActual) return;
    setState(() => _tabActual = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.ventas);
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.inventario);
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.mas);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inventario = context.watch<InventarioProvider>();
    final estadisticas = inventario.estadisticas;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Reportes',
        actions: [
          IconButton(
            tooltip: 'Buscar reporte',
            onPressed: () => _mostrarSnack('Buscar reporte'),
            icon: const Icon(
              Icons.search,
              size: 22,
              color: AppColors.primaryText,
            ),
          ),
          IconButton(
            tooltip: 'Filtrar reportes',
            onPressed: () => _mostrarSnack('Filtrar reportes'),
            icon: const Icon(
              Icons.tune,
              size: 22,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reportes del Sistema.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryText,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Visualiza la actividad del sistema.',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),

            // Card 1: Reporte de Ventas
            CardReportePrincipal(
              titulo: 'Reporte de Ventas',

              ultimaActualizacion: 'Hace 15 dias.',
              onTapVerReporte: () {
                Navigator.pushNamed(context, AppRoutes.ventas);
              },
            ),
            const SizedBox(height: 14),

            // Card 2: Reporte de Inventario
            CardReportePrincipal(
              titulo: 'Reporte de Inventario',
              ultimaActualizacion: 'Hace 2 dias.',
              onTapVerReporte: () {
                Navigator.pushNamed(context, AppRoutes.reporteInventario);
              },
            ),
            const SizedBox(height: 14),

            // Card 3: Reporte de Producción
            CardReportePrincipal(
              titulo: 'Reporte de Producción',
              ultimaActualizacion: 'Hace 15 dias.',
              onTapVerReporte: () {
                _mostrarSnack('Reporte de Producción próximamente');
              },
            ),
            const SizedBox(height: 14),

            // Tarjetas secundarias (2 columnas)
            if (inventario.viewStatus == InventarioViewStatus.error) ...[
              ErrorRetryMessage(
                message: inventario.errorMessage,
                onRetry: inventario.cargarEstadisticas,
              ),
              const SizedBox(height: 8),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CardReporteSecundario(
                    titulo: 'Productos con\nstock bajo',
                    descripcion: estadisticas == null
                        ? 'Cargando...'
                        : '${estadisticas.lowStockProducts} productos\nrequieren reposición',
                    colorFondoIcono: const Color(0xFFFFF8D6),
                    colorIcono: const Color(0xFFD9A000),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.inventario);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CardReporteSecundario(
                    titulo: 'Sabor más\nvendido',
                    descripcion: estadisticas?.bestSellingFlavor == null
                        ? 'Sin ventas\nregistradas'
                        : '${estadisticas!.bestSellingFlavor!.flavorName}\n${estadisticas.bestSellingFlavor!.quantitySold} unidades',
                    colorFondoIcono: const Color(0xFFE8F0FE),
                    colorIcono: const Color(0xFF3B82F6),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.reporteInventario);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _tabActual,
        onTap: _navegarTab,
      ),
    );
  }
}
