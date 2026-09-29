import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF09A982),
        title: const Text('Página no encontrada'),
      ),
      body: Center(
        child: Text(
          'Pagina No Encontrada',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
