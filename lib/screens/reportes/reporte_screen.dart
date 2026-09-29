import 'package:flutter/material.dart';
import '../../screens/reportes/widgets/reportes_cards.dart';
import '../../widgets/bottom_navbar.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  int _tabActual = 3;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => _mostrarSnack('Menú lateral no disponible'),
          icon: const Icon(Icons.menu, size: 24, color: AppColors.primaryText),
        ),
        title: const Text(
          'Reportes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _mostrarSnack('Buscar reporte'),
            icon: const Icon(
              Icons.search,
              size: 22,
              color: AppColors.primaryText,
            ),
          ),
          IconButton(
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
              badgeTexto: '+2550 CS este mes',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CardReporteSecundario(
                    titulo: 'Ocupacion\nde Inventario',
                    descripcion: 'Visualiza\nEstado de La\nBodega',
                    actualizacion: 'Actualizado hace 7 dias',
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
                    titulo: 'Ventas por\nProducto',
                    descripcion: 'Comparación\ndel rendimiento',
                    actualizacion: 'Actualizado hoy',
                    colorFondoIcono: const Color(0xFFE8F0FE),
                    colorIcono: const Color(0xFF3B82F6),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.ventas);
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
        onTap: (index) {
          if (index == _tabActual) return;
          setState(() => _tabActual = index);
          if (index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.ventas);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.inventario);
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, AppRoutes.miCuenta);
          }
        },
      ),
    );
  }
}
