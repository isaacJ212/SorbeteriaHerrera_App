import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/dependency_injection/DI.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/dashboard_provider.dart';
import 'presentation/providers/inventario_provider.dart';
import 'presentation/providers/usuario_provider.dart';
import 'presentation/providers/ventas_provider.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();
  await dotenv.load(fileName: '.env');
  await getIt<AuthProvider>().checkSession();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(
          value: getIt<AuthProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => getIt<DashboardProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<InventarioProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<UsuarioProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<VentasProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        final bool isAuthenticated =
            authProvider.authStatus == AuthStatus.authenticated;

        return MaterialApp(
          title: 'Sorbeteria Herrera',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: isAuthenticated ? AppRoutes.dashboard : AppRoutes.login,
          onGenerateRoute: AppRouter.onGenerateRoute,
          onUnknownRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
