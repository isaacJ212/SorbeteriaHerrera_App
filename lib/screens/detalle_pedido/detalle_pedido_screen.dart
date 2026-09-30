import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../detalle_venta/widgets/producto_vendido_item.dart';

class DetallePedidoScreen extends StatelessWidget {
  const DetallePedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(
        title: 'Detalle del pedido',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
        child: Column(
          children: [
            _buildEncabezadoPedido(),
            const SizedBox(height: 12),
            _buildInformacionCliente(),
            const SizedBox(height: 12),
            _buildProductosPedidos(),
            const SizedBox(height: 12),
            _buildResumenCostos(),
            const SizedBox(height: 14),
            _buildNotas(),
          ],
        ),
      ),
    );
  }

  Widget _buildEncabezadoPedido() {
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
            'PEDIDO PROGRAMADO',
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
                  'Pedido #P-302',
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
                  color: AppColors.attentionBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: AppColors.attentionText, size: 10),
                    SizedBox(width: 4),
                    Text(
                      'Pendiente',
                      style: TextStyle(
                        color: AppColors.attentionText,
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
              Icon(Icons.calendar_today_outlined, color: AppColors.primary, size: 14),
              SizedBox(width: 5),
              Text(
                '21/08/2026',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
              ),
              SizedBox(width: 12),
              Icon(Icons.schedule, color: AppColors.primary, size: 14),
              SizedBox(width: 5),
              Text(
                'Entrega estimada: Hoy 04:00 PM',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInformacionCliente() {
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
            icono: Icons.person_outline,
            titulo: 'INFORMACIÓN DEL CLIENTE',
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cliente',
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 8),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Heladería La Fuente',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'MAYORISTA',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
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
                Icon(Icons.location_on_outlined, color: AppColors.primary, size: 14),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Rotonda Cristo Rey 2c al sur, Managua',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductosPedidos() {
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
                  titulo: 'PRODUCTOS SOLICITADOS',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '40 Galones',
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
            detalle: '15x • Galón (C\$ 80.00 c/u)',
            precio: 'C\$ 1,200.00',
            imagenUrl: 'https://images.unsplash.com/photo-1542116387-4fbce11fa519?auto=format&fit=crop&w=200&q=80',
          ),
          const ProductoVendidoItem(
            nombre: 'Sorbete de Fresa',
            detalle: '15x • Galón (C\$ 80.00 c/u)',
            precio: 'C\$ 1,200.00',
            imagenUrl: 'https://images.unsplash.com/photo-1615170873082-07e1f4641063?auto=format&fit=crop&w=200&q=80',
          ),
          const ProductoVendidoItem(
            nombre: 'Sorbete de Coco',
            detalle: '10x • Galón (C\$ 80.00 c/u)',
            precio: 'C\$ 800.00',
            imagenUrl: 'https://images.unsplash.com/photo-1771863318323-4d470192793d?auto=format&fit=crop&w=200&q=80',
          ),
        ],
      ),
    );
  }

  Widget _buildResumenCostos() {
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
            titulo: 'RESUMEN DEL PEDIDO',
          ),
          const SizedBox(height: 14),
          _buildFilaMonto(titulo: 'Subtotal', monto: 'C\$ 3,200.00'),
          const SizedBox(height: 12),
          _buildFilaMonto(titulo: 'Cargo por Envío', monto: 'C\$ 0.00', montoVerde: true),
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
                        'TOTAL A PAGAR',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Impuestos incluidos',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'C\$ 3,200.00',
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

  Widget _buildNotas() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NOTAS DE ENTREGA',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Llamar al cliente 10 minutos antes de llegar. Entregar por la puerta lateral.',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 11,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTituloSeccion({required IconData icono, required String titulo}) {
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

  Widget _buildFilaMonto({required String titulo, required String monto, bool montoVerde = false}) {
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
