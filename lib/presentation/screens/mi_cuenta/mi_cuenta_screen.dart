import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../detalle_usuario/widgets/detalle_usuario_widgets.dart';

class MiCuentaScreen extends StatefulWidget {
  const MiCuentaScreen({super.key});

  @override
  State<MiCuentaScreen> createState() => _MiCuentaScreenState();
}

class _MiCuentaScreenState extends State<MiCuentaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final auth = context.read<AuthProvider>();
      if (auth.currentUser == null && auth.isAuthenticated) {
        auth.checkSession();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        final user = auth.currentUser;

        if (user == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const AppAppBar(title: 'Mi cuenta', showBackButton: true),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
            children: [
              _buildProfileCard(user),
              const SizedBox(height: 24),
              const DetalleTituloSeccion(titulo: 'INFORMACIÓN PERSONAL'),
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
          ),
        );
      },
    );
  }

  Widget _buildProfileCard(UsuarioResponseModel user) {
    final iniciales = user.userName.trim().isNotEmpty
        ? user.userName.trim().split(RegExp(r'\s+')).take(2).map((part) => part[0].toUpperCase()).join()
        : 'U';
    final rolPrincipal = user.roles.isNotEmpty ? user.roles.first : 'Sin Rol';

    return DetallePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  color: AppColors.cardBackground,
                  child: Text(
                    iniciales,
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.userName,
                          style: const TextStyle(
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
                          child: Text(
                            rolPrincipal,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF007057),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.isActive ? 'Usuario activo' : 'Usuario inactivo',
                      style: const TextStyle(
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
              Expanded(
                child: Text(
                  user.email,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF95F1D0).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.circle, size: 8, color: Color(0xFF007057)),
                    const SizedBox(width: 6),
                    Text(
                      user.isActive ? 'Activo' : 'Inactivo',
                      style: const TextStyle(
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

  Widget _informacion(UsuarioResponseModel user) {
    return DetallePanel(
      child: Column(
        children: [
          DetalleDato(
            icono: Icons.person_outline,
            etiqueta: 'Usuario',
            valor: user.userName,
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.email_outlined,
            etiqueta: 'Correo',
            valor: user.email,
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.verified_user_outlined,
            etiqueta: 'Estado',
            valor: user.isActive ? 'Activo' : 'Inactivo',
          ),
          const Divider(height: 24, color: AppColors.cardBackground),
          DetalleDato(
            icono: Icons.shield_outlined,
            etiqueta: 'Roles',
            valor: user.roles.isEmpty ? 'Sin roles' : user.roles.join(', '),
          ),
        ],
      ),
    );
  }

  Widget _permisos(List<String> roles) {
    final permisos = roles.isEmpty ? ['Sin Rol'] : roles;

    return DetallePanel(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: permisos
            .map(
              (rol) => DetallePermiso(
                icono: Icons.security_outlined,
                texto: rol,
              ),
            )
            .toList(),
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
