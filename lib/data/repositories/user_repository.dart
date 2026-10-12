import '../../core/network/api_client.dart';

class UserRepository {
  final ApiClient apiClient;
  UserRepository({required this.apiClient});

  void Get() => print("obteniendo usuarios");
}
