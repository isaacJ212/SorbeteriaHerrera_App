import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BotonMirarDetalles extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  const BotonMirarDetalles({
    super.key,
    required this.onPressed,
    this.label = 'Ver detalles',
    this.icon = Icons.visibility_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: double.infinity,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
