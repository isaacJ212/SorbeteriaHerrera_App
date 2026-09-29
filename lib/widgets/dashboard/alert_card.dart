import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String titulo;
  final String cantidad;
  final Color colorFondo;
  final Color colorBorde;
  final IconData? icono;
  final Color? colorIcono;

  const AlertCard({
    super.key,
    required this.titulo,
    required this.cantidad,
    required this.colorFondo,
    required this.colorBorde,
    this.icono,
    this.colorIcono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // El SVG muestra 167×119 → en Flutter usamos aspect ratio o altura fija
      height: 119,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorBorde, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila superior: ícono + título
          Row(
            children: [
              if (icono != null) ...[
                Icon(
                  icono,
                  size: 18,
                  color: colorIcono ?? const Color(0xFFF4D878),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  titulo.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64736D),
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Cantidad grande abajo
          Text(
            cantidad,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF10251F),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
