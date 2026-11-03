import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/detalle_usuario_model/detalle_usuario_models.dart';

class UserdetailsRepository {
  final ApiClient apiClient;

  UserdetailsRepository({required this.apiClient});

  Future<DetalleUsuarioResponseModels> getUserById(int userId) async {
    final response = await apiClient.get(ApiConst.usersDetails(userId));
    final json = response.jsonBody;

    if (json == null) {
      throw const ParsingException();
    }

    final data = json['data'] as Map<String, dynamic>?;
    if (data == null) {
      throw const ParsingException('No se encontro detalle de; usuario');
    }

    return DetalleUsuarioResponseModels.fromJson(data);
  }
}
