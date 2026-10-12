import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/boton_mirar_detalles.dart';

class EtiquetaFiltro extends StatelessWidget {
  final String texto;
  final bool seleccionado;

  const EtiquetaFiltro({
    super.key,
    required this.texto,
    this.seleccionado = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        color: seleccionado ? AppColors.cardBackground : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: seleccionado
              ? AppColors.cardBackground
              : AppColors.cardBackground,
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

class TarjetaUsuario extends StatelessWidget {
  final String iniciales;
  final String nombre;
  final String correo;
  final String rol;
  final String sucursal;
  final String ultimoAcceso;
  final bool activo;
  final Color colorAvatar;
  final VoidCallback? onTap;

  const TarjetaUsuario({
    super.key,
    required this.iniciales,
    required this.nombre,
    required this.correo,
    required this.rol,
    required this.sucursal,
    required this.ultimoAcceso,
    required this.activo,
    required this.colorAvatar,
    this.onTap,
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
                      color: activo
                          ? AppColors.primary
                          : AppColors.textSecondary,
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
                  ],
                ),
              ),
            ],
          ),
          if (onTap != null) ...[
            const SizedBox(height: 12),
            BotonMirarDetalles(onPressed: onTap!),
          ],
        ],
      ),
    );
  }
}
