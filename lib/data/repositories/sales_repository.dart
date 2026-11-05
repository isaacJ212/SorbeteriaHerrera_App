import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';

class SalesRepository {
  final ApiClient _apiClient;
  SalesRepository(this._apiClient);

  Future<double> obtenerVentasDiarias() async {
    final response = await _apiClient.get(ApiConst.dailySales);
    final data = response.jsonBody?['data'];
    if (data is! num) {
      throw ParsingException('Respuesta inválida de ventas diarias');
    }
    return data.toDouble();
  }

  Future<List<VentasResponseModel>> obtenerVentas() async {
    final response = await _apiClient.get(ApiConst.sales);
    final payload = response.jsonBody?['data'];
    final items = payload is Map<String, dynamic> ? payload['data'] : null;
    if (items is! List) throw ParsingException('Respuesta inválida de ventas');
    return items
        .map((item) => VentasResponseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<VentaDetalleModel> obtenerDetalle(int id) async {
    final response = await _apiClient.get(ApiConst.salesDetails(id));
    final data = response.jsonBody?['data'];
    if (data is! Map<String, dynamic>) {
      throw ParsingException('Respuesta inválida del detalle de venta');
    }
    return VentaDetalleModel.fromJson(data);
  }
}
