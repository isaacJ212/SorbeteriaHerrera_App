import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class DetallePanel extends StatelessWidget {
  final Widget child;

  const DetallePanel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBackground),
      ),
      child: child,
    );
  }
}

class DetalleTituloSeccion extends StatelessWidget {
  final String titulo;

  const DetalleTituloSeccion({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        color: AppColors.primary,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
    );
  }
}

class DetalleDato extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final String valor;

  const DetalleDato({
    super.key,
    required this.icono,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icono, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            etiqueta,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            valor,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class DetallePermiso extends StatelessWidget {
  final IconData icono;
  final String texto;

  const DetallePermiso({super.key, required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 15, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            texto,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class DetalleRegistroActividad extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String fecha;

  const DetalleRegistroActividad({
    super.key,
    required this.icono,
    required this.titulo,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icono, size: 18, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            titulo,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          fecha,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
      ],
    );
  }
}
