import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/auth_repository.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';
import 'package:herrera_app/data/repositories/historial_acceso_repository.dart';
import 'package:herrera_app/data/repositories/inventario_repository.dart';
import 'package:herrera_app/data/repositories/reporte_inventario_repository.dart';
import 'package:herrera_app/data/repositories/sales_repository.dart';
import 'package:herrera_app/data/repositories/token_Repository.dart';
import 'package:herrera_app/data/repositories/userDetails_repository.dart';
import 'package:herrera_app/data/repositories/user_repository.dart';
import 'package:herrera_app/presentation/providers/auth_provider.dart';
import 'package:herrera_app/presentation/providers/dashboard_provider.dart';
import 'package:herrera_app/presentation/providers/historial_acceso_provider.dart';
import 'package:herrera_app/presentation/providers/inventario_provider.dart';
import 'package:herrera_app/presentation/providers/reporte_inventario_provider.dart';
import 'package:herrera_app/presentation/providers/userDetails_provider.dart';
import 'package:herrera_app/presentation/providers/usuario_provider.dart';
import 'package:herrera_app/services/auth_service.dart';
import 'package:herrera_app/services/dashboard_services.dart';
import 'package:herrera_app/services/historial_acceso_service.dart';
import 'package:herrera_app/services/inventario_service.dart';
import 'package:herrera_app/services/reporte_inventario_service.dart';
import 'package:herrera_app/services/user.services.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<TokenRepository>(TokenRepository.new);
  getIt.registerLazySingleton<ApiClient>(
    () =>
        ApiClient(authTokenProvider: () => getIt<TokenRepository>().getToken()),
    dispose: (client) => client.dispose(),
  );

  getIt.registerLazySingleton(() => DashboardRepository(getIt()));
  getIt.registerLazySingleton(() => DashboardServices(getIt()));
  getIt.registerFactory(() => DashboardProvider(getIt()));

  getIt.registerLazySingleton(() => InventarioRepository(getIt()));
  getIt.registerLazySingleton(() => SalesRepository(getIt()));
  getIt.registerLazySingleton(() => InventarioService(getIt(), getIt()));
  getIt.registerFactory(() => InventarioProvider(getIt()));

  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerLazySingleton(() => AuthService(getIt(), getIt()));
  getIt.registerLazySingleton(() => AuthProvider(getIt()));

  getIt.registerLazySingleton(() => UserdetailsRepository(apiClient: getIt()));
  getIt.registerLazySingleton(() => UserRepository(getIt()));
  getIt.registerLazySingleton(() => UserService(getIt(), getIt()));
  getIt.registerLazySingleton(() => UserdetailsProvider(getIt()));
  getIt.registerFactory(() => UsuarioProvider(getIt()));

  getIt.registerLazySingleton(
    () => ReporteInventarioRepository(apiClient: getIt()),
  );
  getIt.registerLazySingleton(() => ReporteInventarioService(getIt()));
  getIt.registerFactory(() => ReporteInventarioProvider(getIt()));

  getIt.registerLazySingleton(
    () => HistorialAccesoRepository(apiClient: getIt()),
  );
  getIt.registerLazySingleton(() => HistorialAccesoService(getIt()));
  getIt.registerFactory(() => HistorialAccesoProvider(getIt()));
}
