import 'package:flutter/material.dart';

class MenuItemCuenta extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? badge;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showArrow;
  final VoidCallback? onTap;

  const MenuItemCuenta({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.showArrow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final badge = this.badge;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF09A982), size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Color(0xFF64736D)),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badge != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor ?? const Color(0xFFE7EEFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: badgeTextColor ?? const Color(0xFF007057),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          if (showArrow)
            const Icon(Icons.chevron_right, color: Color(0xFF8A9691)),
        ],
      ),
      onTap: onTap,
    );
  }
}
