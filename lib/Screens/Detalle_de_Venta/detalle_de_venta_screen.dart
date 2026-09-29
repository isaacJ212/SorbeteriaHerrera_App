import 'package:flutter/material.dart';

import '../Detalle_de_Venta/widgets/producto_vendido_item.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../theme/app_colors.dart';

class DetalleDeVentaScreen extends StatelessWidget {
  const DetalleDeVentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
            size: 20,
          ),
        ),
        title: const Text(
          'Detalles de Venta',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list,
              color: AppColors.primaryText,
              size: 20,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
        child: Column(
          children: [
            _buildEncabezadoFactura(),

            const SizedBox(height: 12),

            _buildInformacionGeneral(),

            const SizedBox(height: 12),

            _buildProductosVendidos(),

            const SizedBox(height: 12),

            _buildLiquidacion(),

            const SizedBox(height: 14),

            _buildBotones(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(currentIndex: 3, onTap: (index) {}),
    );
  }

  Widget _buildEncabezadoFactura() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'REGISTRO DE VENTAS',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 8,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Expanded(
                child: Text(
                  'Factura #V-1048',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Color(0xFF004532), size: 10),
                    SizedBox(width: 4),
                    Text(
                      'Completada',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.primary,
                size: 14,
              ),
              SizedBox(width: 5),
              Text(
                '21/08/2026',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
              ),
              SizedBox(width: 12),
              Icon(Icons.access_time, color: AppColors.primary, size: 14),
              SizedBox(width: 5),
              Text(
                '02:45 PM',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
              ),
              SizedBox(width: 12),
              Icon(
                Icons.point_of_sale_outlined,
                color: AppColors.primary,
                size: 14,
              ),
              SizedBox(width: 5),
              Text(
                'CAJA 01',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInformacionGeneral() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildTituloSeccion(
            icono: Icons.assignment_outlined,
            titulo: 'INFORMACIÓN GENERAL',
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _buildDatoPrincipal(
                  titulo: 'Cliente',
                  valor: 'Juan Pérez',
                  descripcion: 'Consumidor Final',
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _buildDatoPrincipal(
                  titulo: 'Vendedor',
                  valor: 'Carlos Ruiz',
                  descripcion: 'Turno Vespertino',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Método de Pago',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Efectivo',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Entregado: C\$ 200.00',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                    Text(
                      'Cambio: C\$ 20.00',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Modalidad del Servicio',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 9,
                    ),
                  ),
                ),
                Icon(
                  Icons.storefront_outlined,
                  color: AppColors.primary,
                  size: 14,
                ),
                SizedBox(width: 4),
                Text(
                  'Mostrador / En Sala',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductosVendidos() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTituloSeccion(
                  icono: Icons.icecream_outlined,
                  titulo: 'PRODUCTOS VENDIDOS',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '4 Artículos',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const ProductoVendidoItem(
            nombre: 'Sorbete de Vainilla',
            detalle: '2x • 8 oz (C\$ 35.00 c/u)',
            precio: 'C\$ 70.00',
            imagenUrl:
                'https://images.unsplash.com/photo-1542116387-4fbce11fa519'
                '?auto=format&fit=crop&w=200&q=80',
          ),

          const ProductoVendidoItem(
            nombre: 'Helado de Fresa Especial',
            detalle: '1x • 12 oz',
            precio: 'C\$ 55.00',
            imagenUrl:
                'https://images.unsplash.com/photo-1615170873082-07e1f4641063'
                '?auto=format&fit=crop&w=200&q=80',
          ),

          const ProductoVendidoItem(
            nombre: 'Sorbete de Pistacho',
            detalle: '1x • 4 oz',
            precio: 'C\$ 45.00',
            imagenUrl:
                'https://images.unsplash.com/photo-1771863318323-4d470192793d'
                '?auto=format&fit=crop&w=200&q=80',
          ),

          const ProductoVendidoItem(
            nombre: 'Cono Doble Chocolate',
            detalle: '1x • Barquillo crujiente',
            precio: 'C\$ 10.00',
            imagenUrl:
                'https://images.unsplash.com/photo-1554878050-2ddfd87e7999'
                '?auto=format&fit=crop&w=200&q=80',
          ),
        ],
      ),
    );
  }

  Widget _buildLiquidacion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildTituloSeccion(
            icono: Icons.receipt_long_outlined,
            titulo: 'LIQUIDACIÓN DE VENTA',
          ),

          const SizedBox(height: 14),

          _buildFilaMonto(titulo: 'Subtotal Bruto', monto: 'C\$ 180.00'),

          const SizedBox(height: 12),

          _buildFilaMonto(
            titulo: 'Descuento Aplicado',
            monto: 'C\$ 0.00',
            montoVerde: true,
          ),

          const SizedBox(height: 12),

          _buildFilaMonto(
            titulo: 'Impuestos (Incluidos)',
            monto: 'C\$ 0.00',
            montoVerde: true,
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOTAL PAGADO',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Impuestos y tasas cobradas',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'C\$ 180.00',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotones() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.receipt_long_outlined, size: 17),
            label: const Text(
              'Reimprimir Comprobante',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF004532),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: double.infinity,
          height: 42,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.undo, size: 15),
            label: const Text(
              'Anular / Devolución',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.cardBackground,
              foregroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTituloSeccion({
    required IconData icono,
    required String titulo,
  }) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icono, color: AppColors.primary, size: 14),
        ),
        const SizedBox(width: 7),
        Text(
          titulo,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildDatoPrincipal({
    required String titulo,
    required String valor,
    required String descripcion,
  }) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 8),
          ),
          const SizedBox(height: 3),
          Text(
            valor,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            descripcion,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilaMonto({
    required String titulo,
    required String monto,
    bool montoVerde = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            titulo,
            style: const TextStyle(color: AppColors.primaryText, fontSize: 10),
          ),
        ),
        Text(
          monto,
          style: TextStyle(
            color: montoVerde ? AppColors.primary : AppColors.primaryText,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
