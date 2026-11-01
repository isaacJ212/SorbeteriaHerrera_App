import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/dependency_injection/service_locator.dart';
import 'presentation/providers/dashboard_provider.dart';
import 'presentation/providers/inventario_provider.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  //await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<DashboardProvider>()),
        ChangeNotifierProvider(create: (_) => sl<InventarioProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorbeteria Herrera',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
