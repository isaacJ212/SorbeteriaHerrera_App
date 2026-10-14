import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class MetricaVentaCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final String descripcion;
  final IconData icono;

  const MetricaVentaCard({
    super.key,
    required this.titulo,
    required this.valor,
    required this.descripcion,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icono, color: AppColors.primary, size: 15),
              ),
            ],
          ),

          const Spacer(),

          Text(
            valor,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            descripcion,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 9),
          ),
        ],
      ),
    );
  }
}
