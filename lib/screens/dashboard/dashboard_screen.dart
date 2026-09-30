import 'package:flutter/material.dart';
import '../../widgets/dashboard/alert_card.dart';
import '../../widgets/dashboard/ventas_card.dart';
import '../../screens/dashboard/widgets/venta_reciente_card.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/app_bar.dart';
import '../../models/dashboard_models/recent_sale.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _tabActual = 0;

  final List<RecentSale> _ventas = const [
    RecentSale(
      fecha: '8-21, 3:00pm',
      usuario: 'Juan Sanchez',
      cliente: 'Juan Perez',
      total: '90 C\$',
    ),
    RecentSale(
      fecha: '8-21, 1:30pm',
      usuario: 'Maria Lopez',
      cliente: 'Ana Torres',
      total: '150 C\$',
    ),
    RecentSale(
      fecha: '8-21, 12:00pm',
      usuario: 'Carlos Ruiz',
      cliente: 'Pedro Gomez',
      total: '245 C\$',
    ),
    RecentSale(
      fecha: '8-20, 5:45pm',
      usuario: 'Juan Sanchez',
      cliente: 'Luis Martinez',
      total: '78 C\$',
    ),
    RecentSale(
      fecha: '8-20, 4:00pm',
      usuario: 'Maria Lopez',
      cliente: 'Rosa Flores',
      total: '185 C\$',
    ),
    RecentSale(
      fecha: '8-20, 2:15pm',
      usuario: 'Carlos Ruiz',
      cliente: 'Juan Perez',
      total: '185 C\$',
    ),
    RecentSale(
      fecha: '8-19, 11:00am',
      usuario: 'Juan Sanchez',
      cliente: 'Sofía Reyes',
      total: '65 C\$',
    ),
    RecentSale(
      fecha: '8-19, 9:30am',
      usuario: 'Maria Lopez',
      cliente: 'Diego Mora',
      total: '410 C\$',
    ),
    RecentSale(
      fecha: '8-19, 9:00am',
      usuario: 'Carlos Ruiz',
      cliente: 'Carmen Díaz',
      total: '127 C\$',
    ),
  ];

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
        Navigator.pushReplacementNamed(context, AppRoutes.miCuenta);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const VentasCard(),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: AlertCard(
                    titulo: 'Alertas de stock',
                    cantidad: '3 PRODUCTOS',
                    colorFondo: Color(0xFFFFF8C9),
                    colorBorde: Color(0xFFE7D76A),
                    icono: Icons.warning_amber_outlined,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AlertCard(
                    titulo: 'Pedidos pendientes',
                    cantidad: '10 PENDIENTES',
                    colorFondo: Colors.white,
                    colorBorde: Color(0xFFE1E1E1),
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
            ..._ventas
                .take(3)
                .map((venta) => VentaRecienteDashboardCard(venta: venta)),
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
