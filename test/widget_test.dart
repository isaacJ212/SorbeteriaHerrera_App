import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:herrera_app/presentation/routes/app_router.dart';

void main() {
  testWidgets('muestra la pantalla de ruta no encontrada', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/ruta-inexistente',
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Página no encontrada'), findsWidgets);
  });
}
