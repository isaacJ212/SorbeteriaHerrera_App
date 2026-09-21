import 'package:flutter/material.dart';

class CardVentas extends StatelessWidget {
  final String fecha;
  final String usuario;
  final String total;
  final String cliente;

  const CardVentas({
    super.key,
    required this.fecha,
    required this.usuario,
    required this.total,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Tus widgets hijos van aquí
        ],
      ),
    );
  }
}
