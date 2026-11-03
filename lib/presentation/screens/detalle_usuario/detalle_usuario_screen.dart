import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/detalle_usuario_model/detalle_usuario_models.dart';
import 'package:herrera_app/presentation/providers/userDetails_provider.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<UserdetailsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (provider.errorMessage != null) {
            return Center(
              child: Text(
                provider.errorMessage!,
                style: const TextStyle(color: AppColors.primaryText),
              ),
            );
          }

          final user = provider.user;
          if (user == null) {
            return const Center(
              child: Text('No se encontró información del usuario'),
            );
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            children: [
              _perfil(user),
              const SizedBox(height: 24),
              const DetalleTituloSeccion(titulo: 'INFORMACIÓN DEL USUARIO'),
              const SizedBox(height: 10),
              _informacion(user),
              const SizedBox(height: 24),
              const DetalleTituloSeccion(titulo: 'PERMISOS OPERATIVOS'),
              const SizedBox(height: 10),
              _permisos(user.roles),
              const SizedBox(height: 24),
              const DetalleTituloSeccion(titulo: 'ACTIVIDAD RECIENTE'),
              const SizedBox(height: 10),
              _actividad(),
            ],
          );
        },
      ),
    );
  }

  Widget _perfil(DetalleUsuarioResponseModels user) {
    final nombreCompleto = '${user.firstName} ${user.lastName}'.trim();
    final nombre = nombreCompleto.isNotEmpty ? nombreCompleto : user.userName;

    final iniciales = nombre.isNotEmpty
        ? nombre
              .split(RegExp(r'\s+'))
              .take(2)
              .map((p) => p[0].toUpperCase())
              .join()
        : 'U';
    final rolPrincipal = user.roles.isNotEmpty ? user.roles.first : 'Sin rol';

    return DetallePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  iniciales,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rolPrincipal,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.isActive ? 'Activo' : 'Inactivo',
                  style: TextStyle(
                    color: user.isActive
                        ? AppColors.primaryText
                        : AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
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
              Expanded(
                child: Text(
                  user.email,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _informacion(DetalleUsuarioResponseModels user) {
    return DetallePanel(
      child: Column(
        children: [
          DetalleDato(
            icono: Icons.account_circle_outlined,
            etiqueta: 'Nombre de usuario',
            valor: user.userName,
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.badge_outlined,
            etiqueta: 'Cédula / DNI',
            valor: user.dni.isNotEmpty ? user.dni : 'No registrada',
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.numbers_outlined,
            etiqueta: 'ID de usuario',
            valor: user.id.toString(),
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.verified_user_outlined,
            etiqueta: 'Estado de cuenta',
            valor: user.isActive ? 'Activa' : 'Inactiva',
          ),
        ],
      ),
    );
  }

  Widget _permisos(List<String> roles) {
    if (roles.isEmpty) {
      return const DetallePanel(
        child: Text(
          'Sin roles asignados',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      );
    }
    return DetallePanel(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: roles.map((rol) {
          return DetallePermiso(icono: Icons.shield_outlined, texto: rol);
        }).toList(),
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
