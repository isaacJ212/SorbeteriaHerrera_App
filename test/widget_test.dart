import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:herrera_app/main.dart';

void main() {
  testWidgets('muestra la pantalla de ruta no encontrada', (tester) async {
    await tester.pumpWidget(const MyApp());

    final context = tester.element(find.byType(MaterialApp));
    Navigator.of(context).pushNamed('/ruta-inexistente');
    await tester.pumpAndSettle();

    expect(find.text('Página no encontrada'), findsOneWidget);
    expect(find.text('Pagina No Encontrada'), findsOneWidget);
  });
}
