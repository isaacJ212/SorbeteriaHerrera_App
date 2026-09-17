import 'package:flutter/material.dart';

class NavElemento {
  final String label;
  final IconData icon;
  final IconData? ActiveIcon;

  const NavElemento({required this.label, required this.icon, this.ActiveIcon});
}

class BottomNavbar extends StatelessWidget {
  final List<NavElemento> items = [
    NavElemento(
      label: 'Inicio',
      icon: Icons.home_outlined,
      ActiveIcon: Icons.home,
    ),
    NavElemento(
      label: 'Actividad',
      icon: Icons.bar_chart_outlined,
      ActiveIcon: Icons.bar_chart,
    ),
    NavElemento(
      label: 'Inventario',
      icon: Icons.inventory_2_outlined,
      ActiveIcon: Icons.inventory_2,
    ),
    NavElemento(
      label: 'Reportes',
      icon: Icons.description_outlined,
      ActiveIcon: Icons.description,
    ),
    NavElemento(label: 'Más', icon: Icons.menu, ActiveIcon: Icons.menu_open),
  ];

  final int currentIndex;
  final ValueChanged<int> onTap;

  BottomNavbar({required this.currentIndex, required this.onTap});

  Widget _item(int index, NavElemento elemento) {
    final bool activo = index == currentIndex;
    final IconData icono = activo
        ? (elemento.ActiveIcon ?? elemento.icon)
        : elemento.icon;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      icono,
                      color: activo
                          ? const Color(0xFF10251F)
                          : Color(0xFF8A9691),
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    elemento.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: activo ? FontWeight.w600 : FontWeight.w400,
                      color: activo
                          ? const Color(0xFF10251F)
                          : Color(0xFF8A9691),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE1E3E4))),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        children: List.generate(items.length, (index) {
          return _item(index, items[index]);
        }),
      ),
    );
  }
}
