import 'package:flutter/material.dart';

import '../../Widgets/bottom_navbar.dart';
import '../../theme/app_colors.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
            size: 21,
          ),
        ),
        title: const Text(
          'Usuarios',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.primaryText, size: 21),
                SizedBox(width: 18),
                Icon(Icons.filter_list, color: AppColors.primaryText, size: 21),
              ],
            ),
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
          _TarjetaUsuario(
            iniciales: 'ML',
            nombre: 'María López',
            correo: 'maria.lopez@herrera.com',
            rol: 'Cajera / Turno Tarde',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: 'Ayer 06:40 PM',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
          _TarjetaUsuario(
            iniciales: 'RF',
            nombre: 'Rosa Flores',
            correo: 'rosa.flores@herrera.com',
            rol: 'Encargada de Bodega',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: '18/08/2026',
            activo: false,
            colorAvatar: AppColors.cardBackground,
          ),
          _TarjetaUsuario(
            iniciales: 'PG',
            nombre: 'Pedro Gómez',
            correo: 'pedro.gomez@herrera.com',
            rol: 'Cajero Fin de Semana',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: '17/08/2026',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
          _TarjetaUsuario(
            iniciales: 'LH',
            nombre: 'Lucía Herrera',
            correo: 'lucia.herrera@herrera.com',
            rol: 'Supervisora General',
            sucursal: 'Sucursal Principal',
            ultimoAcceso: 'Hoy 07:30 AM',
            activo: true,
            colorAvatar: AppColors.cardBackground,
          ),
          _AvisoPermisos(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(currentIndex: 4, onTap: (index) {}),
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
          _EtiquetaFiltro(texto: 'Todos (6)', seleccionado: true),
          SizedBox(width: 8),
          _EtiquetaFiltro(texto: 'Administradores (2)'),
          SizedBox(width: 8),
          _EtiquetaFiltro(texto: 'Cajeros (3)'),
          SizedBox(width: 8),
          _EtiquetaFiltro(texto: 'Bodega (1)'),
        ],
      ),
    );
  }
}

class _EtiquetaFiltro extends StatelessWidget {
  final String texto;
  final bool seleccionado;

  const _EtiquetaFiltro({required this.texto, this.seleccionado = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        color: seleccionado ? AppColors.cardBackground : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: seleccionado ? AppColors.cardBackground : AppColors.cardBackground,
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: seleccionado ? AppColors.primaryText : AppColors.textSecondary,
          fontSize: 10,
          fontWeight: seleccionado ? FontWeight.w600 : FontWeight.w400,
        ),
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

class _TarjetaUsuario extends StatelessWidget {
  final String iniciales;
  final String nombre;
  final String correo;
  final String rol;
  final String sucursal;
  final String ultimoAcceso;
  final bool activo;
  final Color colorAvatar;

  const _TarjetaUsuario({
    required this.iniciales,
    required this.nombre,
    required this.correo,
    required this.rol,
    required this.sucursal,
    required this.ultimoAcceso,
    required this.activo,
    required this.colorAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBackground),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colorAvatar,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Text(
                      iniciales,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (activo)
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
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
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      correo,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: activo
                      ? AppColors.cardBackground
                      : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: activo ? AppColors.primary : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      activo ? 'Activo' : 'Inactivo',
                      style: TextStyle(
                        color: activo
                            ? AppColors.primaryText
                            : AppColors.textSecondary,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.more_vert,
                color: AppColors.textSecondary,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.cardBackground),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ROL',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      rol,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SUCURSAL',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      sucursal,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Último acceso',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 8,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            ultimoAcceso,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.chevron_right,
                      size: 17,
                      color: AppColors.textSecondary,
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
}

class _AvisoPermisos extends StatelessWidget {
  const _AvisoPermisos();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_user_outlined,
            color: AppColors.primaryText,
            size: 19,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Control de Permisos de Obrador',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Los cambios en cajeros y bodega sincronizan '
                  'automáticamente los cierres de caja y conteos '
                  'de lotes de forma trazable.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    height: 1.4,
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
