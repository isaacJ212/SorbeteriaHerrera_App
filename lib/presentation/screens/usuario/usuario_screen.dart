import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/usuario_models/usuario_model.dart';
import '../../../data/repositories/user_repository.dart';
import '../../providers/usuario_provider.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import 'widgets/usuarios_widgets.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({super.key});

  @override
  State<UsuarioScreen> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  final _searchFocusNode = FocusNode();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<UsuarioProvider>().cargarUsuarios();
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _buscar(String busqueda) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      if (mounted) {
        context.read<UsuarioProvider>().cargarUsuarios(busqueda: busqueda);
      }
    });
  }

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
            onPressed: _searchFocusNode.requestFocus,
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
              size: 22,
            ),
          ),
        ],
      ),
      body: Consumer<UsuarioProvider>(
        builder: (context, provider, _) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            children: [
              const Text(
                'EQUIPO & ACCESOS',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Usuarios',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              _Buscador(focusNode: _searchFocusNode, onChanged: _buscar),
              const SizedBox(height: 12),
              _Filtros(
                seleccionado: provider.filtroRol,
                onSelected: (filtro) =>
                    provider.cargarUsuarios(filtroRol: filtro),
              ),
              const SizedBox(height: 16),
              if (provider.viewStatus == UsuarioViewStatus.loading &&
                  provider.usuarios.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (provider.viewStatus == UsuarioViewStatus.error)
                _EstadoUsuarios(
                  mensaje: 'No se pudieron cargar los usuarios.',
                  accion: 'Reintentar',
                  onPressed: provider.cargarUsuarios,
                )
              else if (provider.usuarios.isEmpty)
                const _EstadoUsuarios(
                  mensaje: 'No hay usuarios que coincidan con los filtros.',
                )
              else ...[
                _ResumenServicio(cantidad: provider.usuarios.length),
                const SizedBox(height: 16),
                ...provider.usuarios.map(
                  (usuario) => TarjetaUsuario(
                    iniciales: _iniciales(usuario),
                    nombre: '${usuario.firstName} ${usuario.lastName}'.trim(),
                    correo: usuario.email,
                    rol: usuario.roles.isEmpty
                        ? 'Sin rol asignado'
                        : usuario.roles.join(' / '),
                    ultimoAcceso: _ultimoAcceso(usuario.lastAccessAtUtc),
                    activo: usuario.isActive,
                    colorAvatar: AppColors.cardBackground,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.detalleUsuario),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  String _iniciales(UsuarioResponseModel usuario) {
    final nombres = [
      usuario.firstName,
      usuario.lastName,
    ].where((nombre) => nombre.trim().isNotEmpty).toList();
    if (nombres.isNotEmpty) {
      return nombres.map((nombre) => nombre.trim()[0].toUpperCase()).join();
    }

    final userName = usuario.userName.trim();
    return userName.isEmpty ? '?' : userName[0].toUpperCase();
  }

  String _ultimoAcceso(DateTime? fechaUtc) {
    if (fechaUtc == null) return 'Sin actividad';

    final fecha = fechaUtc.toLocal();
    final ahora = DateTime.now();
    final hoy = DateTime(ahora.year, ahora.month, ahora.day);
    final dia = DateTime(fecha.year, fecha.month, fecha.day);
    final hora =
        '${fecha.hour.toString().padLeft(2, '0')}:'
        '${fecha.minute.toString().padLeft(2, '0')}';

    if (dia == hoy) return 'Hoy $hora';
    if (dia == hoy.subtract(const Duration(days: 1))) return 'Ayer $hora';
    return '${fecha.day.toString().padLeft(2, '0')}/'
        '${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }
}

class _Buscador extends StatelessWidget {
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const _Buscador({required this.focusNode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Buscar usuario por nombre o correo...',
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 19,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}

class _Filtros extends StatelessWidget {
  final FiltroRolUsuario seleccionado;
  final ValueChanged<FiltroRolUsuario> onSelected;

  const _Filtros({required this.seleccionado, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    const etiquetas = {
      FiltroRolUsuario.todos: 'Todos',
      FiltroRolUsuario.administradores: 'Administradores',
      FiltroRolUsuario.cajeros: 'Cajeros',
      FiltroRolUsuario.bodega: 'Bodega',
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: FiltroRolUsuario.values
            .map(
              (filtro) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: EtiquetaFiltro(
                  texto: etiquetas[filtro]!,
                  seleccionado: filtro == seleccionado,
                  onTap: () => onSelected(filtro),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ResumenServicio extends StatelessWidget {
  final int cantidad;

  const _ResumenServicio({required this.cantidad});

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
          const Icon(Icons.badge_outlined, color: AppColors.primary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              cantidad == 1 ? '1 usuario activo' : '$cantidad usuarios activos',
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EstadoUsuarios extends StatelessWidget {
  final String mensaje;
  final String? accion;
  final VoidCallback? onPressed;

  const _EstadoUsuarios({this.accion, required this.mensaje, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBackground),
      ),
      child: Column(
        children: [
          Text(
            mensaje,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          if (accion != null && onPressed != null) ...[
            const SizedBox(height: 8),
            TextButton(onPressed: onPressed, child: Text(accion!)),
          ],
        ],
      ),
    );
  }
}
