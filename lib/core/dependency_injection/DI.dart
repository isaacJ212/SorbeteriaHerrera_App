import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';
import 'package:herrera_app/presentation/providers/dashboard_provider.dart';
import 'package:herrera_app/services/dashboard_services.dart';
import 'package:herrera_app/data/repositories/auth_repository.dart';
import 'package:herrera_app/data/repositories/reporte_inventario_repository.dart';
import 'package:herrera_app/data/repositories/token_Repository.dart';
import 'package:herrera_app/data/repositories/userDetails_repository.dart';
import 'package:herrera_app/presentation/providers/auth_provider.dart';
import 'package:herrera_app/presentation/providers/reporte_inventario_provider.dart';
import 'package:herrera_app/presentation/providers/userDetails_provider.dart';
import 'package:herrera_app/services/auth_service.dart';
import 'package:herrera_app/services/reporte_inventario_service.dart';
import 'package:herrera_app/services/user.services.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<TokenRepository>(() => TokenRepository());

  getIt.registerLazySingleton<ApiClient>(
    () =>
        ApiClient(authTokenProvider: () => getIt<TokenRepository>().getToken()),
    dispose: (client) => client.dispose(),
  );
  // register repositories and service here
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepository(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<DashboardServices>(
    () => DashboardServices(getIt<DashboardRepository>()),
  );

  getIt.registerFactory<DashboardProvider>(
    () => DashboardProvider(getIt<DashboardServices>()));


  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(apiClient: getIt<ApiClient>()), 
  );

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<AuthRepository>(), getIt<TokenRepository>()),
  );


  getIt.registerLazySingleton<AuthProvider>(
    () => AuthProvider(getIt<AuthService>()),
  );

  // detalles de usuarios
  getIt.registerLazySingleton<UserdetailsRepository>(
    () => UserdetailsRepository(apiClient: getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<UserService>(
    () => UserService(getIt<UserdetailsRepository>()),
  );

  getIt.registerLazySingleton<UserdetailsProvider>(
    () => UserdetailsProvider(getIt<UserService>()),
  );

  //detalle de usuarios 
    // reporte de inventario
  getIt.registerLazySingleton<ReporteInventarioRepository>(
    () => ReporteInventarioRepository(apiClient: getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<ReporteInventarioService>(
    () => ReporteInventarioService(getIt<ReporteInventarioRepository>()),
  );

  getIt.registerFactory<ReporteInventarioProvider>(
    () => ReporteInventarioProvider(getIt<ReporteInventarioService>()),
  );



    // historial de acceso
  getIt.registerLazySingleton<HistorialAccesoRepository>(
    () => HistorialAccesoRepository(apiClient: getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<HistorialAccesoService>(
    () => HistorialAccesoService(getIt<HistorialAccesoRepository>()),
  );

  getIt.registerFactory<HistorialAccesoProvider>(
    () => HistorialAccesoProvider(getIt<HistorialAccesoService>()),
  );

}
