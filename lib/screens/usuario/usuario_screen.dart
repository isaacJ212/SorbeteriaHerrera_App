import 'package:flutter/material.dart';

import '../../screens/usuario/widgets/usuarios_widgets.dart';
import '../../widgets/app_bar.dart';
import '../../theme/app_colors.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Usuarios',
        showBackButton: true,
        actions: [
          IconButton(
            tooltip: 'Buscar usuario',
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.primaryText, size: 22),
          ),
          IconButton(
            tooltip: 'Filtrar usuarios',
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: AppColors.primaryText, size: 22),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        children: const [
          Text(
            'EQUIPO & ACCESOS',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Usuarios',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          _BuscadorVisual(),
          SizedBox(height: 12),
          _FiltrosVisuales(),
          SizedBox(height: 16),
          _ResumenServicio(),
          SizedBox(height: 16),
          TarjetaUsuario(
            iniciales: 'ML',
            nombre: 'María López',
            correo: 'maria.lopez@herrera.com',
            rol: 'Cajera / Turno Tarde',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: 'Ayer 06:40 PM',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
          TarjetaUsuario(
            iniciales: 'RF',
            nombre: 'Rosa Flores',
            correo: 'rosa.flores@herrera.com',
            rol: 'Encargada de Bodega',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: '18/08/2026',
            activo: false,
            colorAvatar: AppColors.cardBackground,
          ),
          TarjetaUsuario(
            iniciales: 'PG',
            nombre: 'Pedro Gómez',
            correo: 'pedro.gomez@herrera.com',
            rol: 'Cajero Fin de Semana',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: '17/08/2026',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
          TarjetaUsuario(
            iniciales: 'LH',
            nombre: 'Lucía Herrera',
            correo: 'lucia.herrera@herrera.com',
            rol: 'Supervisora General',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: 'Hoy 07:30 AM',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
        ],
      ),
    );
  }
}

class _BuscadorVisual extends StatelessWidget {
  const _BuscadorVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBackground),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 19, color: AppColors.textSecondary),
          SizedBox(width: 10),
          Text(
            'Buscar usuario por nombre o correo...',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FiltrosVisuales extends StatelessWidget {
  const _FiltrosVisuales();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          EtiquetaFiltro(texto: 'Todos (6)', seleccionado: true),
          SizedBox(width: 8),
          EtiquetaFiltro(texto: 'Administradores (2)'),
          SizedBox(width: 8),
          EtiquetaFiltro(texto: 'Cajeros (3)'),
          SizedBox(width: 8),
          EtiquetaFiltro(texto: 'Bodega (1)'),
        ],
      ),
    );
  }
}

class _ResumenServicio extends StatelessWidget {
  const _ResumenServicio();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.badge_outlined,
              color: AppColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5 de 6 en servicio',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Sorbetería Central & Mostradores',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, color: AppColors.primary, size: 7),
                SizedBox(width: 5),
                Text(
                  'Turno\nActivo',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
