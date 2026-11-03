import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/historial_acceso_models/historial_models.dart';

class HistorialAccesoRepository {
  final ApiClient _apiClient;

  HistorialAccesoRepository(this._apiClient);

  Future<HistorialAccesoResponse> getHistorial() async {
    final response = await _apiClient.get(ApiConst.audit);
    final data = response.jsonBody?['data'];
    if (data is! Map<String, dynamic>) {
      throw const ParsingException('Respuesta inválida del historial');
    }

    return HistorialAccesoResponse.fromJson(data);
  }
}
