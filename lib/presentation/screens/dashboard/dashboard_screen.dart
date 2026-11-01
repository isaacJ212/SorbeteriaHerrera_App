import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dashboard_provider.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/dashboard/alert_card.dart';
import '../../widgets/dashboard/ventas_card.dart';
import '../../widgets/empty_list_message.dart';
import 'widgets/venta_reciente_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _tabActual = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<DashboardProvider>().fetchDashboard();
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
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.ventas);
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.inventario);
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.reportes);
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.mas);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = context.watch<DashboardProvider>();
    final cards = dashboard.dashboardCards;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5), // fondo gris del diseño
      appBar: AppAppBar(
        title: 'Inicio',
        actions: [
          IconButton(
            tooltip: 'Notificaciones',
            icon: const Icon(
              Icons.notifications_none,
              size: 22,
              color: AppColors.primaryText,
            ),
            onPressed: () => _mostrarSnack('Sin notificaciones nuevas'),
          ),
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 22,
              color: AppColors.primaryText,
            ),
            onPressed: () => _mostrarSnack('Perfil próximamente'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido de Nuevo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Aquí tienes un resumen de la actividad del sistema',
              style: TextStyle(fontSize: 13, color: Color(0xFF8A9691)),
            ),
            const SizedBox(height: 16),
            VentasCard(
              total: cards?.totalVentasSemana ?? 0,
              crecimiento: cards?.crecimientoVentasSemana ?? 0,
              onTap: () => Navigator.pushNamed(context, AppRoutes.ventas),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AlertCard(
                    titulo: 'Alertas de stock',
                    cantidad: '${cards?.alertasStock ?? 0} PRODUCTOS',
                    colorFondo: const Color(0xFFFFF8C9),
                    colorBorde: const Color(0xFFE7D76A),
                    icono: Icons.warning_amber_outlined,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.inventario),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AlertCard(
                    titulo: 'Pedidos pendientes',
                    cantidad: '${cards?.pedidosPendientes ?? 0} PENDIENTES',
                    colorFondo: Colors.white,
                    colorBorde: const Color(0xFFE1E1E1),
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.pedidos),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Ventas Recientes',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 12),
            if (dashboard.viewStatus == ViewStatus.loading)
              const Center(child: CircularProgressIndicator())
            else if (dashboard.viewStatus == ViewStatus.error)
              Text(
                "Ha ocurrido un error inesperado al cargar la pantalla de incio, por favor intente mas tarde.",
              )
            else if (dashboard.ventas.isEmpty)
              const EmptyListMessage(
                message: 'No ha habido actividad en el sistema',
              )
            else
              ...dashboard.ventas
                  .take(3)
                  .map(
                    (venta) => VentaRecienteDashboardCard(
                      venta: venta,
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.detalleVenta),
                    ),
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
