import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';
import 'package:herrera_app/presentation/providers/dashboard_provider.dart';
import 'package:herrera_app/services/dashboard_services.dart';
import 'package:herrera_app/data/repositories/auth_repository.dart';
import 'package:herrera_app/data/repositories/token_Repository.dart';
import 'package:herrera_app/presentation/providers/auth_provider.dart';
import 'package:herrera_app/services/auth_service.dart';

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
}
