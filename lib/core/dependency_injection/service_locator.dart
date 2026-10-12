import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  // a falta de los otros archivos para agregar dependencias
}
