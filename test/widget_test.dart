import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:herrera_app/main.dart';

void main() {
  testWidgets('muestra la pantalla de ruta no encontrada', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Navegar a una ruta inexistente usando el navigator del contexto correcto
    final navigator = tester.state<NavigatorState>(find.byType(Navigator).last);
    navigator.pushNamed('/ruta-inexistente');
    await tester.pumpAndSettle();

    expect(find.text('Página no encontrada'), findsWidgets);
  });
}
