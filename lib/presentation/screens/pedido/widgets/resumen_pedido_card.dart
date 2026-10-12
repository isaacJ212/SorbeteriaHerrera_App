import 'package:flutter/material.dart';

class ResumenPedidoCard extends StatelessWidget {
  final String titulo;
  final String cantidad;
  final String descripcion;
  final IconData icono;
  final Color colorFondo;
  final Color colorTexto;

  const ResumenPedidoCard({
    super.key,
    required this.titulo,
    required this.cantidad,
    required this.descripcion,
    required this.icono,
    required this.colorFondo,
    required this.colorTexto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(
                    color: colorTexto,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(icono, color: colorTexto, size: 15),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cantidad,
                style: TextStyle(
                  color: colorTexto,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 3),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  descripcion,
                  style: TextStyle(color: colorTexto, fontSize: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
