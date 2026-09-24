import 'package:flutter/material.dart';
import '../../Widgets/Dashboard/alert_card.dart';
import '../../Widgets/Dashboard/ventas_card.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../models/dashboard_models/recent_sale.dart';
import '../../routes/app_routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5), // fondo gris del diseño
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Inicio',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10251F),
          ),
        ),
        leading: IconButton(
          onPressed: () => _mostrarSnack('Menú lateral no disponible'),
          icon: const Icon(Icons.menu, size: 24, color: Color(0xFF10251F)),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              size: 24,
              color: Color(0xFF10251F),
            ),
            onPressed: () => _mostrarSnack('Sin notificaciones nuevas'),
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 24,
              color: Color(0xFF10251F),
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
            _tablaVentas(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _tabActual,
        onTap: (index) {
          setState(() => _tabActual = index);
          if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.inventario);
          } else if (index != 0) {
            _mostrarSnack('Esta sección estará disponible próximamente');
          }
        },
      ),
    );
  }

  Widget _tablaVentas() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias, // recorta el header para respetar esquinas
      child: Column(
        children: [
          // Header gris
          Container(
            color: const Color(0xFFF3F4F5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Fecha', style: _estiloEncabezado),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Usuario', style: _estiloEncabezado),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Cliente', style: _estiloEncabezado),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Total', style: _estiloEncabezado),
                ),
              ],
            ),
          ),
          // Filas con zebra (alternadas)
          ...List.generate(_ventas.length, (index) {
            final venta = _ventas[index];
            final esPar = index % 2 == 0;
            return Container(
              color: esPar ? Colors.white : const Color(0xFFF9FAFB),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(venta.fecha, style: _estiloCelda),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(venta.usuario, style: _estiloCelda),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(venta.cliente, style: _estiloCelda),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(venta.total, style: _estiloTotal),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Estilos como constantes privadas del archivo
const TextStyle _estiloEncabezado = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Color(0xFF10251F),
);

const TextStyle _estiloCelda = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: Color(0xFF10251F),
);

const TextStyle _estiloTotal = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Color(0xFF10251F),
);
