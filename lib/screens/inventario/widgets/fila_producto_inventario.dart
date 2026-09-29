import 'package:flutter/material.dart';

class FilaProductoInventario extends StatelessWidget {
  final String nombre;
  final String stock;
  final String precio;
  final bool stockBajo;
  final VoidCallback onVerDetalle;

  const FilaProductoInventario({
    super.key,
    required this.nombre,
    required this.stock,
    required this.precio,
    required this.stockBajo,
    required this.onVerDetalle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(flex: 23, child: Text(nombre, style: _estiloCelda)),
          Expanded(
            flex: 10,
            child: Text(
              stock,
              style: _estiloCelda.copyWith(
                color: stockBajo
                    ? const Color(0xFFB66A00)
                    : const Color(0xFF10251F),
                fontWeight: stockBajo ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
          Expanded(flex: 13, child: Text(precio, style: _estiloCelda)),
          SizedBox(
            width: 34,
            height: 26,
            child: IconButton(
              padding: EdgeInsets.zero,
              tooltip: 'Ver detalle',
              icon: const Icon(Icons.visibility_outlined, size: 18),
              onPressed: onVerDetalle,
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _estiloCelda = TextStyle(
  fontSize: 11,
  color: Color(0xFF10251F),
);
