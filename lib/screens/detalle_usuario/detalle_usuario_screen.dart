import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import 'widgets/detalle_usuario_widgets.dart';
import '../../theme/app_colors.dart';

class DetalleUsuarioScreen extends StatelessWidget {
  const DetalleUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(
        title: 'Detalle de usuario',
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        children: [
          _perfil(),
          const SizedBox(height: 24),
          const DetalleTituloSeccion(titulo: 'INFORMACIÓN DEL USUARIO'),
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

  Widget _perfil() {
    return DetallePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  'https://i.pinimg.com/564x/9d/6b/9d/9d6b9db2dcb0526a09b89fb35d075c72.jpg',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      color: AppColors.cardBackground,
                      child: const Text(
                        'EA',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enmanuel Acuña',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Cajero / Ventas',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
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
          const Row(
            children: [
              Icon(
                Icons.email_outlined,
                size: 18,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Enmanuel@Sorbeteriaherrera.com',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 12),
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
            fecha: 'Hoy, 8:00 PM',
          ),
        ],
      ),
    );
  }
}
