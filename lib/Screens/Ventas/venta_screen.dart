import 'package:flutter/material.dart';

import '../Ventas/widgets/metrica_venta_card.dart';
import '../Ventas/widgets/venta_reciente_card.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../theme/app_colors.dart';

class VentaScreen extends StatelessWidget {
  const VentaScreen({super.key});

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
          'Ventas',
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
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.primary, size: 7),
                const SizedBox(width: 5),
                const Expanded(
                  child: Text(
                    'MÓDULO OPERATIVO',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                _buildBotonAccion(Icons.sync),
                const SizedBox(width: 8),
                _buildBotonAccion(Icons.tune),
              ],
            ),

            const SizedBox(height: 14),
            Row(
              children: [
                _buildFiltroPeriodo(texto: 'Hoy', seleccionado: true),
                const SizedBox(width: 8),
                _buildFiltroPeriodo(texto: 'Esta Semana'),
                const SizedBox(width: 8),
                _buildFiltroPeriodo(texto: 'Este Mes'),
                const SizedBox(width: 8),
                _buildFiltroPeriodo(texto: 'Todos'),
              ],
            ),

            const SizedBox(height: 14),

            _buildResumenVentas(),

            const SizedBox(height: 12),

            const Row(
              children: [
                Expanded(
                  child: MetricaVentaCard(
                    titulo: 'TICKETS',
                    valor: '48',
                    descripcion: 'Emitidos hoy',
                    icono: Icons.receipt_long_outlined,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MetricaVentaCard(
                    titulo: 'PROMEDIO',
                    valor: 'C\$ 80.00',
                    descripcion: 'Por orden',
                    icono: Icons.calculate_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),
            _buildBuscador(),

            const SizedBox(height: 18),
            Row(
              children: [
                const Text(
                  'Ventas Recientes',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Ver historial',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 13,
                ),
              ],
            ),

            const SizedBox(height: 12),

            const VentaRecienteCard(
              numero: '#48',
              factura: 'Factura #V-1048',
              hora: '2:45 PM',
              cliente: 'Juan Pérez',
              total: 'C\$ 180.00',
              estado: 'Completada',
              vendedor: 'Carlos Ruiz',
              metodoPago: 'Efectivo',
              iconoPago: Icons.payments_outlined,
            ),

            const SizedBox(height: 10),

            const VentaRecienteCard(
              numero: '#47',
              factura: 'Factura #V-1047',
              hora: '2:15 PM',
              cliente: 'María López',
              total: 'C\$ 350.00',
              estado: 'Completada',
              vendedor: 'Rosa Flores',
              metodoPago: 'Tarjeta',
              iconoPago: Icons.credit_card,
            ),

            const SizedBox(height: 10),

            const VentaRecienteCard(
              numero: '#46',
              factura: 'Factura #V-1046',
              hora: '1:30 PM',
              cliente: 'Diego Mora',
              total: 'C\$ 95.00',
              estado: 'Completada',
              vendedor: 'Carlos Ruiz',
              metodoPago: 'Transferencia',
              iconoPago: Icons.account_balance_outlined,
            ),

            const SizedBox(height: 10),

            const VentaRecienteCard(
              numero: '#45',
              factura: 'Factura #V-1045',
              hora: '12:40 PM',
              cliente: 'Ana Torres',
              total: 'C\$ 240.00',
              estado: 'Completada',
              vendedor: 'Juan Sánchez',
              metodoPago: 'Efectivo',
              iconoPago: Icons.payments_outlined,
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(currentIndex: 3, onTap: (index) {}),
    );
  }

  Widget _buildBotonAccion(IconData icono) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icono, color: Color(0xFF004532), size: 18),
    );
  }

  Widget _buildFiltroPeriodo({
    required String texto,
    bool seleccionado = false,
  }) {
    return Expanded(
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: seleccionado
              ? AppColors.primary.withValues(alpha: 0.14)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: seleccionado ? AppColors.primary : AppColors.primaryText,
            fontSize: 9,
            fontWeight: seleccionado ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildResumenVentas() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 45,
            bottom: 18,
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.09),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'CORTE EN TIEMPO REAL',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: AppColors.primary,
                            size: 12,
                          ),
                          SizedBox(width: 3),
                          Text(
                            '+14.3% vs ayer',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  'Ventas de Hoy',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'C\$ 3,840.00',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'NIO',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Meta diaria (C\$ 4,500.00)',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                    Text(
                      '85.3%',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: 0.853,
                    minHeight: 6,
                    backgroundColor: AppColors.cardBackground,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuscador() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: AppColors.textSecondary, size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Buscar por cliente o N° factura...',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.tune, color: AppColors.primary, size: 17),
              SizedBox(width: 5),
              Text(
                'Filtrar',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
