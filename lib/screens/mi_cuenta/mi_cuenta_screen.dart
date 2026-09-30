import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../detalle_usuario/widgets/detalle_usuario_widgets.dart';

class MiCuentaScreen extends StatelessWidget {
  const MiCuentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(title: 'Mi cuenta', showBackButton: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 24),
          const DetalleTituloSeccion(titulo: 'INFORMACIÓN PERSONAL'),
          const SizedBox(height: 10),
          _informacion(),
          const SizedBox(height: 24),
          const DetalleTituloSeccion(titulo: 'PERMISOS OPERATIVOS'),
          const SizedBox(height: 10),
          _permisos(),
          const SizedBox(height: 24),
          const DetalleTituloSeccion(titulo: 'ACTIVIDAD RECIENTE'),
          const SizedBox(height: 10),
          _actividad(),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return DetallePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  'https://i.pinimg.com/564x/9d/6b/9d/9d6b9db2dcb0526a09b89fb35d075c72.jpg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      color: AppColors.cardBackground,
                      child: const Text(
                        'IJ',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Isaac Jimenez',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF95F1D0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF007057),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Administrador General',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.cardBackground),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.email_outlined,
                size: 18,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'admin@sorbeteriaHerrera.com',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 13),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF95F1D0).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 8, color: Color(0xFF007057)),
                    SizedBox(width: 6),
                    Text(
                      'Turno Activo',
                      style: TextStyle(
                        color: Color(0xFF007057),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _informacion() {
    return const DetallePanel(
      child: Column(
        children: [
          DetalleDato(
            icono: Icons.phone_outlined,
            etiqueta: 'Teléfono directo',
            valor: '8159-4717',
          ),
          Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.calendar_today_outlined,
            etiqueta: 'Fecha de inicio',
            valor: '15/09/2026',
          ),
          Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.store_outlined,
            etiqueta: 'Sucursal',
            valor: 'Central Carazo',
          ),
          Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.schedule_outlined,
            etiqueta: 'Turno',
            valor: 'Vespertino',
          ),
        ],
      ),
    );
  }

  Widget _permisos() {
    return const DetallePanel(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          DetallePermiso(
            icono: Icons.point_of_sale,
            texto: 'Ventas en mostrador',
          ),
          DetallePermiso(
            icono: Icons.inventory_2_outlined,
            texto: 'Consulta de inventario',
          ),
          DetallePermiso(
            icono: Icons.edit_document,
            texto: 'Gestión de sistema',
          ),
          DetallePermiso(icono: Icons.lock_outline, texto: 'Cierre de caja'),
        ],
      ),
    );
  }

  Widget _actividad() {
    return const DetallePanel(
      child: Column(
        children: [
          DetalleRegistroActividad(
            icono: Icons.login,
            titulo: 'Apertura de sesión',
            fecha: 'Hoy, 8:00 AM',
          ),
          Divider(height: 24, color: AppColors.cardBackground),
          DetalleRegistroActividad(
            icono: Icons.point_of_sale_outlined,
            titulo: 'Cierre de caja',
            fecha: 'Ayer, 8:00 PM',
          ),
        ],
      ),
    );
  }
}
