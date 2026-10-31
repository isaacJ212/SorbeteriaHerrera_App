import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';
import 'package:herrera_app/presentation/providers/dashboard_provider.dart';
import 'package:herrera_app/services/dashboard_services.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton(() => DashboardRepository(sl()));
  sl.registerLazySingleton(() => DashboardServices(sl()));
  sl.registerFactory(() => DashboardProvider(sl()));
}
