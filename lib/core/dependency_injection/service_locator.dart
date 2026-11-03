import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';
import 'package:herrera_app/data/repositories/inventario_repository.dart';
import 'package:herrera_app/data/repositories/sales_repository.dart';
import 'package:herrera_app/data/repositories/user_repository.dart';
import 'package:herrera_app/presentation/providers/dashboard_provider.dart';
import 'package:herrera_app/presentation/providers/inventario_provider.dart';
import 'package:herrera_app/presentation/providers/usuario_provider.dart';
import 'package:herrera_app/services/dashboard_services.dart';
import 'package:herrera_app/services/inventario_service.dart';
import 'package:herrera_app/services/user.services.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton(() => DashboardRepository(sl()));
  sl.registerLazySingleton(() => DashboardServices(sl()));
  sl.registerFactory(() => DashboardProvider(sl()));
  sl.registerLazySingleton(() => InventarioRepository(sl()));
  sl.registerLazySingleton(() => SalesRepository(sl()));
  sl.registerLazySingleton(() => InventarioService(sl(), sl()));
  sl.registerFactory(() => InventarioProvider(sl()));
  sl.registerLazySingleton(() => UserRepository(sl()));
  sl.registerLazySingleton(() => UserService(sl()));
  sl.registerFactory(() => UsuarioProvider(sl()));
}
