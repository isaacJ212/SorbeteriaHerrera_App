import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class ProductoVendidoItem extends StatelessWidget {
  final String nombre;
  final String detalle;
  final String precio;
  final String imagenUrl;

  const ProductoVendidoItem({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.precio,
    required this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imagenUrl,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 45,
                  height: 45,
                  color: Colors.white,
                  child: const Icon(
                    Icons.icecream_outlined,
                    color: AppColors.primary,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detalle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            precio,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
