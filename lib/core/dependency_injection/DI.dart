import 'package:get_it/get_it.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/repositories/token_Repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {

  getIt.registerLazySingleton<TokenRepository>(() => TokenRepository());

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(authTokenProvider: () => getIt<TokenRepository>().getToken()),
    dispose: (client) => client.dispose(),
  );
}
