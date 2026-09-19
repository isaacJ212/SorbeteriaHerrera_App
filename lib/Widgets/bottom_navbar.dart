import 'package:flutter/material.dart';

class NavElemento {
  final String label;
  final IconData icon;
  final IconData? activeIcon;

  const NavElemento({required this.label, required this.icon, this.activeIcon});
}

class BottomNavbar extends StatelessWidget {
  final List<NavElemento> items = const [
    NavElemento(
      label: 'Inicio',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    NavElemento(
      label: 'Actividad',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
    ),
    NavElemento(
      label: 'Inventario',
      icon: Icons.inventory_2_outlined,
      activeIcon: Icons.inventory_2,
    ),
    NavElemento(
      label: 'Reportes',
      icon: Icons.description_outlined,
      activeIcon: Icons.description,
    ),
    NavElemento(label: 'Más', icon: Icons.menu, activeIcon: Icons.menu_open),
  ];

  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _item(int index, NavElemento elemento) {
    final bool activo = index == currentIndex;
    final IconData icono = activo
        ? (elemento.activeIcon ?? elemento.icon)
        : elemento.icon;

    return Expanded(
      child: Padding(
        // Margen vertical para separar el fondo activo de los bordes
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: InkWell(
          onTap: () => onTap(index),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 51, // Altura del contenedor activo según la maqueta
            decoration: BoxDecoration(
              // Fondo verde claro '#D8F5EA' si está activo
              color: activo ? const Color(0xFFD8F5EA) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icono,
                  color: activo
                      ? const Color(0xFF10251F)
                      : const Color(0xFF8A9691),
                  size: 16,
                ),
                const SizedBox(height: 2),
                Text(
                  elemento.label,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: activo ? FontWeight.w600 : FontWeight.w400,
                    color: activo
                        ? const Color(0xFF10251F)
                        : const Color(0xFF8A9691),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Altura total de 59px + el safe area inferior
      height: 59 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            // Opacidad de 0.12 sacada del atributo stroke-opacity del SVG
            color: Colors.black.withOpacity(0.12),
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: 8,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return _item(index, items[index]);
        }),
      ),
    );
  }
}
