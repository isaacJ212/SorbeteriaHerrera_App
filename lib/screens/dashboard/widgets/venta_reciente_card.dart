import 'package:flutter/material.dart';
import '../../../models/dashboard_models/recent_sale.dart';
import '../../../widgets/boton_mirar_detalles.dart';

class VentaRecienteDashboardCard extends StatelessWidget {
  final RecentSale venta;
  final VoidCallback? onTap;

  const VentaRecienteDashboardCard({
    super.key,
    required this.venta,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Venta realizada', style: _estiloEncabezado),
                  const SizedBox(height: 4),
                  Text(venta.fecha, style: _estiloCelda),
                ],
              ),
              Text(venta.total, style: _estiloTotal),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: Color(0xFFE9ECEB)),
          ),
          Row(
            children: [
              Expanded(child: _datoVenta('Usuario', venta.usuario)),
              Expanded(child: _datoVenta('Cliente', venta.cliente)),
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

  Widget _datoVenta(String etiqueta, String valor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          etiqueta,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8A9691),
          ),
        ),
        const SizedBox(height: 4),
        Text(valor, style: _estiloCelda),
      ],
    );
  }
}

const TextStyle _estiloEncabezado = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Color(0xFF10251F),
);

const TextStyle _estiloCelda = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: Color(0xFF10251F),
);

const TextStyle _estiloTotal = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Color(0xFF10251F),
);
