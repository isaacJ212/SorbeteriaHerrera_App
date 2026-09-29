import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class PedidoCard extends StatelessWidget {
  final IconData icono;
  final String numeroPedido;
  final String tipoCliente;
  final String cliente;
  final String estado;
  final Color colorEstado;
  final Color fondoEstado;
  final String descripcion;
  final String precio;
  final String entrega;
  final IconData iconoEntrega;
  final Color colorEntrega;

  const PedidoCard({
    super.key,
    required this.icono,
    required this.numeroPedido,
    required this.tipoCliente,
    required this.cliente,
    required this.estado,
    required this.colorEstado,
    required this.fondoEstado,
    required this.descripcion,
    required this.precio,
    required this.entrega,
    required this.iconoEntrega,
    required this.colorEntrega,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(icono, color: AppColors.primary, size: 20),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          numeroPedido,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 5),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tipoCliente,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    Text(
                      cliente,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: fondoEstado,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  estado,
                  style: TextStyle(
                    color: colorEstado,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 18, color: AppColors.cardBackground),

          Row(
            children: [
              const Icon(
                Icons.inventory_2_outlined,
                color: AppColors.primary,
                size: 15,
              ),

              const SizedBox(width: 5),

              Expanded(
                child: Text(
                  descripcion,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Text(
                precio,
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconoEntrega, color: colorEntrega, size: 14),

              const SizedBox(width: 5),

              Expanded(
                child: Text(
                  entrega,
                  style: TextStyle(
                    color: colorEntrega,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: AppColors.primary,
                  size: 14,
                ),
                SizedBox(width: 5),
                Text(
                  'Ver Detalle',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
