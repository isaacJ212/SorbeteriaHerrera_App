import 'package:flutter/material.dart';
import '../../Screens/Pedido/widgets/resumen_pedido_card.dart';
import '../../Screens/Pedido/widgets/pedido_card.dart';
import '../../theme/app_colors.dart';
import '../../Widgets/bottom_navbar.dart';

class PedidoScreen extends StatelessWidget {
  const PedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.primaryText),
        title: const Text(
          'Pedidos',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: AppColors.primaryText, size: 21),
          SizedBox(width: 16),
          Icon(Icons.filter_list, color: AppColors.primaryText, size: 21),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Gestión de pedidos',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 14),

            Row(
              children: [
                const Expanded(
                  child: ResumenPedidoCard(
                    titulo: 'PENDIENTES',
                    cantidad: '10',
                    descripcion: 'lotes',
                    icono: Icons.hourglass_bottom,
                    colorFondo: AppColors.attentionBackground,
                    colorTexto: AppColors.attentionText,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ResumenPedidoCard(
                    titulo: 'EN PROCESO',
                    cantidad: '5',
                    descripcion: 'en ruta',
                    icono: Icons.hourglass_top,
                    colorFondo: AppColors.primary,
                    colorTexto: Colors.black,
                  ),
                ),

                const SizedBox(width: 8),

                const Expanded(
                  child: ResumenPedidoCard(
                    titulo: 'COMPLETADOS',
                    cantidad: '24',
                    descripcion: 'hoy',
                    icono: Icons.check_circle_outline,
                    colorFondo: AppColors.cardBackground,
                    colorTexto: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.textSecondary,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Buscar por cliente o N° pedido...',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Pendientes (10)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),

                const Expanded(
                  child: SizedBox(
                    height: 28,
                    child: Center(
                      child: Text(
                        'En Proceso (5)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                const Expanded(
                  child: SizedBox(
                    height: 28,
                    child: Center(
                      child: Text(
                        'Listos Entrega (3)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const PedidoCard(
              icono: Icons.local_shipping_outlined,
              numeroPedido: '#P-302',
              tipoCliente: 'MAYORISTA',
              cliente: 'Heladería La Fuente',
              estado: 'Pendiente',
              colorEstado: AppColors.attentionText,
              fondoEstado: AppColors.attentionBackground,
              descripcion: '40 Galones (Vainilla, Fresa, Coco)',
              precio: r'C$ 3,200.00',
              entrega: 'Entrega estimada: Hoy 04:00 PM',
              iconoEntrega: Icons.schedule,
              colorEntrega: AppColors.attentionText,
            ),
            const SizedBox(height: 10),

            PedidoCard(
              icono: Icons.restaurant,
              numeroPedido: '#P-301',
              tipoCliente: 'HOSTELERÍA',
              cliente: 'Restaurante El Mirador',
              estado: 'En Preparación',
              colorEstado: AppColors.primary,
              fondoEstado: AppColors.primary.withValues(alpha: 0.15),
              descripcion: '15 Galones (Pistacho, Maracuyá)',
              precio: r'C$ 1,450.00',
              entrega: 'Entrega estimada: Hoy 05:30 PM',
              iconoEntrega: Icons.schedule,
              colorEntrega: AppColors.primary,
            ),

            const SizedBox(height: 10),

            const PedidoCard(
              icono: Icons.celebration_outlined,
              numeroPedido: '#P-300',
              tipoCliente: 'EVENTO',
              cliente: 'Evento Familia Morales',
              estado: 'Pendiente',
              colorEstado: AppColors.attentionText,
              fondoEstado: AppColors.attentionBackground,
              descripcion: '8 Galones Surtidos + Barquillos',
              precio: r'C$ 890.00',
              entrega: 'Entrega programada: Mañana 10:00 AM',
              iconoEntrega: Icons.calendar_today_outlined,
              colorEntrega: AppColors.attentionText,
            ),

            const SizedBox(height: 10),

            PedidoCard(
              icono: Icons.local_cafe_outlined,
              numeroPedido: '#P-299',
              tipoCliente: 'COMERCIO',
              cliente: 'Cafetería Central',
              estado: 'Listo Despacho',
              colorEstado: AppColors.primary,
              fondoEstado: AppColors.primary.withValues(alpha: 0.15),
              descripcion: '12 Galones (Ron Pasas, Galleta)',
              precio: r'C$ 1,180.00',
              entrega: 'En bahía de refrigeración #2 listo para retiro',
              iconoEntrega: Icons.check_circle_outline,
              colorEntrega: AppColors.primary,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentIndex: 2, onTap: (index) {}),
    );
  }
}
