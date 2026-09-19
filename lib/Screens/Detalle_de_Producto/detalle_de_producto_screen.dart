import 'package:flutter/material.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../Widgets/label.dart';
import '../../routes/app_routes.dart';

class DetalleDeProductoScreen extends StatelessWidget {
  final String nombre;
  final String stock;
  final String precio;

  const DetalleDeProductoScreen({
    super.key,
    this.nombre = 'Sorbete De Vainilla',
    this.stock = '150',
    this.precio = 'C\$ 35.00',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Detalle de Inventario',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10251F),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xFF10251F),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.search, size: 22, color: Color(0xFF10251F)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.filter_list, size: 22, color: Color(0xFF10251F)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Etiqueta(texto: 'HER-001'),
                SizedBox(width: 8),
                Etiqueta(texto: '2 Lotes Activos'),
              ],
            ),
            const SizedBox(height: 16),
            _informacionProducto(),
            const SizedBox(height: 16),
            _resumenStock(),
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
            _tablaLotes(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.dashboard,
              (route) => false,
            );
          } else if (index == 2) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _informacionProducto() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INFORMACIÓN DEL PRODUCTO',
            style: TextStyle(fontSize: 11, color: Color(0xFF64736D)),
          ),
          const SizedBox(height: 12),
          _filaInformacion('Precio de venta', precio),
          _filaInformacion('Categoría', 'Helados'),
          _filaInformacion('Línea de producto', 'Sorbetes'),
          _filaInformacion('Unidad de medida', 'Onzas'),
        ],
      ),
    );
  }

  Widget _resumenStock() {
    return _card(
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
              Expanded(child: _datoStock('Stock actual', '$stock unidades')),
              const SizedBox(width: 10),
              Expanded(child: _datoStock('Stock mínimo', '20 unidades')),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Icon(Icons.circle, size: 8, color: Color(0xFF0A9B6C)),
              SizedBox(width: 6),
              Text(
                'Estado: Disponible',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tablaLotes() {
    return _card(
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
          _filaLote('LV-102', '12-08-2026', '90', '30-09-2026'),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          _filaLote('LV-103', '14-08-2026', '60', '15-10-2026'),
        ],
      ),
    );
  }

  Widget _filaLote(
    String lote,
    String ingreso,
    String cantidad,
    String vencimiento,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Row(
        children: [
          Expanded(flex: 13, child: Text(lote, style: _estiloFila)),
          Expanded(flex: 18, child: Text(ingreso, style: _estiloFila)),
          Expanded(flex: 12, child: Text(cantidad, style: _estiloFila)),
          Expanded(flex: 18, child: Text(vencimiento, style: _estiloFila)),
        ],
      ),
    );
  }

  Widget _filaInformacion(String etiqueta, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64736D)),
          ),
          Text(
            valor,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _datoStock(String etiqueta, String valor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64736D)),
          ),
          const SizedBox(height: 5),
          Text(
            valor,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _card({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(14),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE1E1E1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

const TextStyle _estiloTabla = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w600,
  color: Color(0xFF10251F),
);

const TextStyle _estiloFila = TextStyle(fontSize: 9, color: Color(0xFF10251F));
