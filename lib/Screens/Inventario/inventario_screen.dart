import 'package:flutter/material.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../routes/app_routes.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  int _tabActual = 2;
  String _filtroActual = 'Todos';

  final List<_ProductoInventario> _productos = const [
    _ProductoInventario('Helado de chocolate', '3', 'C\$ 120', true),
    _ProductoInventario('Jarabe de fresa', '2', 'C\$ 85', true),
    _ProductoInventario('Helado de vainilla', '18', 'C\$ 110', false),
    _ProductoInventario('Conos', '42', 'C\$ 5', false),
  ];

  void _mostrarSnack(String mensaje) {
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
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Inventario',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10251F),
          ),
        ),
        leading: IconButton(
          onPressed: () => _mostrarSnack('Menu lateral no disponible'),
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
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _filtros(),
            const SizedBox(height: 16),
            _ventasHoy(),
            const SizedBox(height: 12),
            _buscadores(),
            const SizedBox(height: 16),
            const Text(
              'Resultados',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 8),
            _tablaInventario(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _tabActual,
        onTap: (index) {
          setState(() => _tabActual = index);
          if (index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, AppRoutes.reportes);
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, AppRoutes.miAccount);
          } else if (index != 2) {
            _mostrarSnack('Esta sección estará disponible próximamente');
          }
        },
      ),
    );
  }

  Widget _tablaInventario() {
    final productos = _productos.where((producto) {
      if (_filtroActual == 'Stock bajo') return producto.stockBajo;
      if (_filtroActual == 'Disponibles') return !producto.stockBajo;
      if (_filtroActual == 'Agotados') return producto.stock == '0';
      return true;
    }).toList();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 23,
                  child: Text('Producto', style: _estiloEncabezado),
                ),
                Expanded(
                  flex: 10,
                  child: Text('Stock', style: _estiloEncabezado),
                ),
                Expanded(
                  flex: 13,
                  child: Text('Precio', style: _estiloEncabezado),
                ),
                SizedBox(width: 34),
              ],
            ),
          ),
          for (int index = 0; index < productos.length; index++) ...[
            _filaProducto(productos[index]),
            if (index != productos.length - 1)
              const Divider(height: 1, color: Color(0xFFF0F0F0)),
          ],
        ],
      ),
    );
  }

  Widget _filtros() {
    const filtros = ['Todos', 'Disponibles', 'Stock bajo', 'Agotados'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filtros.map((filtro) {
        final activo = filtro == _filtroActual;
        return InkWell(
          onTap: () => setState(() => _filtroActual = filtro),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              filtro,
              style: TextStyle(
                fontSize: 11,
                color: activo ? const Color(0xFF10251F) : const Color(0xFF64736D),
                fontWeight: activo ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _ventasHoy() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE1E1E1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.show_chart, size: 14, color: Color(0xFF64736D)),
              SizedBox(width: 6),
              Text(
                'VENTAS DE HOY',
                style: TextStyle(fontSize: 11, color: Color(0xFF64736D)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'C\$ 2,605',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF10251F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buscadores() {
    return Column(
      children: [
        _campoBusqueda('Buscar productos'),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _campoBusqueda('Buscar por sabor')),
            const SizedBox(width: 8),
            SizedBox(
              height: 40,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list, size: 16),
                label: const Text('Filtrar lista'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFD8F5EA),
                  foregroundColor: const Color(0xFF10251F),
                  textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _campoBusqueda(String texto) {
    return SizedBox(
      height: 40,
      child: TextField(
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: texto,
          hintStyle: const TextStyle(fontSize: 11, color: Color(0xFF8A9691)),
          prefixIcon: const Icon(Icons.search, size: 18, color: Color(0xFF64736D)),
          filled: true,
          fillColor: const Color(0xFFEAF7F1),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFD1E9DF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFD1E9DF)),
          ),
        ),
      ),
    );
  }

  Widget _filaProducto(_ProductoInventario producto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(flex: 23, child: Text(producto.nombre, style: _estiloCelda)),
          Expanded(
            flex: 10,
            child: Text(
              producto.stock,
              style: _estiloCelda.copyWith(
                color: producto.stockBajo
                    ? const Color(0xFFB66A00)
                    : const Color(0xFF10251F),
                fontWeight: producto.stockBajo
                    ? FontWeight.w700
                    : FontWeight.w400,
              ),
            ),
          ),
          Expanded(flex: 13, child: Text(producto.precio, style: _estiloCelda)),
          SizedBox(
            width: 34,
            height: 26,
            child: IconButton(
              padding: EdgeInsets.zero,
              tooltip: 'Ver detalle',
              icon: const Icon(Icons.visibility_outlined, size: 18),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.detalleProducto,
                  arguments: {
                    'nombre': producto.nombre,
                    'stock': producto.stock,
                    'precio': producto.precio,
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductoInventario {
  final String nombre;
  final String stock;
  final String precio;
  final bool stockBajo;

  const _ProductoInventario(
    this.nombre,
    this.stock,
    this.precio,
    this.stockBajo,
  );
}

const TextStyle _estiloEncabezado = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Color(0xFF10251F),
);

const TextStyle _estiloCelda = TextStyle(
  fontSize: 11,
  color: Color(0xFF10251F),
);
