import 'package:flutter/material.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../routes/app_routes.dart';

class ReporteDeVentaScreen extends StatelessWidget {
  const ReporteDeVentaScreen({super.key});

  void _mostrarSnack(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text(
          'Reportes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF10251F),
          ),
        ),
        leading: IconButton(
          onPressed: () => _mostrarSnack(context, 'Menu lateral no disponible'),
          icon: const Icon(Icons.menu, color: Color(0xFF10251F)),
        ),
        actions: [
          IconButton(
            onPressed: () => _mostrarSnack(context, 'Búsqueda próximamente'),
            icon: const Icon(Icons.search, size: 20, color: Color(0xFF10251F)),
          ),
          IconButton(
            onPressed: () => _mostrarSnack(context, 'Filtros próximamente'),
            icon: const Icon(Icons.filter_list, size: 20, color: Color(0xFF10251F)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reportes del Sistema.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Visualiza la actividad del sistema.',
              style: TextStyle(fontSize: 13, color: Color(0xFF64736D)),
            ),
            const SizedBox(height: 48),
            _reporteCard(
              context,
              titulo: 'Reporte de Ventas',
              resumen: 'C\$ 2,500 este mes',
              actualizado: 'Última Actualización',
              periodo: 'Hoy, 15 días',
            ),
            const SizedBox(height: 16),
            _reporteCard(
              context,
              titulo: 'Reporte de Inventario',
              actualizado: 'Última Actualización',
              periodo: 'Hace 2 días',
            ),
            const SizedBox(height: 16),
            _reporteCard(
              context,
              titulo: 'Reporte de Producción',
              actualizado: 'Última Actualización',
              periodo: 'Hace 15 días',
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: _ResumenCard(
                    titulo: 'Ocupación\nde Inventario',
                    descripcion: 'Visualiza\nEstado de\nBodega',
                    actualizado: 'Actualizado hace 7 días',
                    icono: Icons.inventory_2_outlined,
                    colorIcono: Color(0xFFF2BC32),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ResumenCard(
                    titulo: 'Ventas por\nProducto',
                    descripcion: 'Comparación\ndel rendimiento',
                    actualizado: 'Actualizado hoy',
                    icono: Icons.bar_chart_outlined,
                    colorIcono: Color(0xFF587AF5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.inventario);
          }
        },
      ),
    );
  }

  Widget _reporteCard(
    BuildContext context, {
    required String titulo,
    String? resumen,
    required String actualizado,
    required String periodo,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE1E1E1)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Color(0x40000000), blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                if (resumen != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    resumen,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF0A9B6C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(actualizado, style: const TextStyle(fontSize: 10)),
                Text(periodo, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
          FilledButton.icon(
            onPressed: () => _mostrarSnack(context, '$titulo próximamente'),
            icon: const Icon(Icons.insert_chart_outlined, size: 15),
            label: const Text('Ver Reporte'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF0A9B6C),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResumenCard extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String actualizado;
  final IconData icono;
  final Color colorIcono;

  const _ResumenCard({
    required this.titulo,
    required this.descripcion,
    required this.actualizado,
    required this.icono,
    required this.colorIcono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFDFD),
        border: Border.all(color: const Color(0xFFE8EBE9)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
              Icon(icono, size: 20, color: colorIcono),
            ],
          ),
          const SizedBox(height: 12),
          Text(descripcion, style: const TextStyle(fontSize: 11, color: Color(0xFF64736D))),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time, size: 12, color: Color(0xFF8A9691)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  actualizado,
                  style: const TextStyle(fontSize: 9, color: Color(0xFF8A9691)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
