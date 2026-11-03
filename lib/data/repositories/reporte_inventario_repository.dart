import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';

class ReporteInventarioRepository {
  final ApiClient apiClient;

  ReporteInventarioRepository({required this.apiClient});

  Future<ReporteInventarioModel> getReporte() async {
    final response = await apiClient.get(ApiConst.reportInventary);
    final json = response.jsonBody;

    if (json == null) {
      throw const ParsingException();
    }

    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) {
      throw const ParsingException('No se encotro el reporte de Inventario');
    }
    return ReporteInventarioModel.fromJson(data);
  }
}
