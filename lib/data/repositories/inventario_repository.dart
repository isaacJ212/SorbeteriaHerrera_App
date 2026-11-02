import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/Detalle_Inventario_models/detalle_inventario_models.dart';
import 'package:herrera_app/data/models/inventario_models/inventario_models.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';

class InventarioRepository {
  final ApiClient _apiClient;

  InventarioRepository(this._apiClient);

  Future<List<InventarioResponseGeneralModels>> obtenerProductos({
    String? search,
  }) async {
    final response = await _apiClient.get(
      '${ApiConst.inventory}/list',
      query: search == null || search.trim().isEmpty
          ? null
          : {'search': search.trim()},
    );
    final data = response.jsonBody?['data'];
    if (data is! List) {
      throw ParsingException('Respuesta inválida del inventario');
    }
    return data
        .map(
          (item) => InventarioResponseGeneralModels.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<DetalleInventarioModel> obtenerDetalle(int productId) async {
    final response = await _apiClient.get(ApiConst.inventoryDetails(productId));
    final data = response.jsonBody?['data'];
    if (data is! Map<String, dynamic>) {
      throw ParsingException('Respuesta inválida del detalle de inventario');
    }
    return DetalleInventarioModel.fromJson(data);
  }

  Future<ReporteInventarioModel> obtenerEstadisticas() async {
    final response = await _apiClient.get(ApiConst.reportInventary);
    final data = response.jsonBody?['data'];
    if (data is! Map<String, dynamic>) {
      throw ParsingException('Respuesta inválida de estadísticas');
    }
    return ReporteInventarioModel.fromJson(data);
  }
}
