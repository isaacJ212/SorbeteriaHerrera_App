import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:herrera_app/core/dependency_injection/DI.dart';
import 'package:herrera_app/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/routes/app_router.dart';
import 'presentation/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();
  await dotenv.load(fileName: '.env');
  await getIt<AuthProvider>().checkSession();

  runApp(
    ChangeNotifierProvider<AuthProvider>.value(
      value: getIt<AuthProvider>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
