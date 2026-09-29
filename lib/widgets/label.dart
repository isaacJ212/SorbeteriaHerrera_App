import 'package:flutter/material.dart';

class Etiqueta extends StatelessWidget {
  final String texto;

  const Etiqueta({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFD8F5EA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 11, color: Color(0xFF087A5D)),
      ),
    );
  }
}
