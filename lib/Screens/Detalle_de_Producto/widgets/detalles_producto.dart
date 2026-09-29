import 'package:flutter/material.dart';

class DetalleProductoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const DetalleProductoCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE1E1E1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class FilaInformacionProducto extends StatelessWidget {
  final String etiqueta;
  final String valor;

  const FilaInformacionProducto({
    super.key,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64736D)),
          ),
          Text(
            valor,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class DatoStockProducto extends StatelessWidget {
  final String etiqueta;
  final String valor;

  const DatoStockProducto({
    super.key,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64736D)),
          ),
          const SizedBox(height: 5),
          Text(
            valor,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class FilaLoteProducto extends StatelessWidget {
  final String lote;
  final String ingreso;
  final String cantidad;
  final String vencimiento;

  const FilaLoteProducto({
    super.key,
    required this.lote,
    required this.ingreso,
    required this.cantidad,
    required this.vencimiento,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Row(
        children: [
          Expanded(flex: 13, child: Text(lote, style: _estiloFila)),
          Expanded(flex: 18, child: Text(ingreso, style: _estiloFila)),
          Expanded(flex: 12, child: Text(cantidad, style: _estiloFila)),
          Expanded(flex: 18, child: Text(vencimiento, style: _estiloFila)),
        ],
      ),
    );
  }
}

const TextStyle _estiloFila = TextStyle(fontSize: 9, color: Color(0xFF10251F));
