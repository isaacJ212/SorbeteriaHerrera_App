import 'package:flutter/material.dart';

class VentasCard extends StatelessWidget {
  const VentasCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // El SVG muestra 108px de alto → usamos padding generoso en vez de height fijo
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // rx="10" del SVG
        border: Border.all(color: const Color(0xFFE1E1E1)),
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
          // Fila superior: ícono + label
          Row(
            children: [
              const Icon(Icons.show_chart, size: 18, color: Color(0xFF64736D)),
              const SizedBox(width: 8),
              Text(
                'VENTAS DE LA SEMANA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64736D),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Fila inferior: monto grande + pill de porcentaje
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'C\$ 24,580',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17211E),
                ),
              ),
              // Pill verde "+12.4%"
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4), // verde clarito del SVG
                  borderRadius: BorderRadius.circular(4), // rx="4" del SVG
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 14, color: Color(0xFF087A5D)),
                    SizedBox(width: 2),
                    Text(
                      '12.4%',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF087A5D),
                        fontWeight: FontWeight.w700,
                      ),
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
