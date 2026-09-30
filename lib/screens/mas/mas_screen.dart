import 'package:flutter/material.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/app_bar.dart';
import '../../routes/app_routes.dart';
import '../mi_cuenta/widgets/menu_item_cuenta.dart';

class MasScreen extends StatefulWidget {
  const MasScreen({super.key});

  @override
  State<MasScreen> createState() => _MasScreenState();
}

class _MasScreenState extends State<MasScreen> {
  int _tabActual = 4;

  void _navegarTab(int index) {
    if (index == _tabActual) return;
    setState(() => _tabActual = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.ventas);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.inventario);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.reportes);
        break;
    }
  }

  void _cerrarSesion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: const AppAppBar(
        title: 'Más',
        showBackButton: false,
        showMenuButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Cuenta'),
            _buildCard([
              MenuItemCuenta(
                icon: Icons.account_circle_outlined,
                title: 'Mi cuenta',
                subtitle: 'Configuración general de la cuenta',
                showArrow: true,
                onTap: () => Navigator.pushNamed(context, AppRoutes.miCuenta),
              ),
            ]),
            // TODO: Connect isAdmin to the actual authenticated user's role/permissions state.
            if (true /* isAdmin */) ...[
              _buildSectionTitle('Administración'),
              _buildCard([
                MenuItemCuenta(
                  icon: Icons.people_outline,
                  title: 'Usuarios',
                  subtitle: 'Cajeros, maestros sorbeteros y personal',
                  showArrow: true,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.usuarios),
                ),
                _buildDivider(),
                MenuItemCuenta(
                  icon: Icons.shield_outlined,
                  title: 'Historial de acceso',
                  subtitle: 'Registros de cajas, mermas y modificaciones',
                  showArrow: true,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.historialAcceso),
                ),
              ]),
            ],
            _buildSectionTitle('Sesión'),
            _buildLogoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _tabActual,
        onTap: _navegarTab,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF64736D),
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, color: Colors.grey);
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFDAD6),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.logout, color: Color(0xFFBA1A1A), size: 24),
          ),
          title: const Text(
            'Cerrar Sesión',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFBA1A1A),
            ),
          ),
          onTap: _cerrarSesion,
        ),
      ),
    );
  }
}
