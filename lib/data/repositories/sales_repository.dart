import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';

class SalesRepository {
  final ApiClient _apiClient;
  SalesRepository(this._apiClient);

  Future<double> obtenerIngresosMensuales() async {
    final response = await _apiClient.get(ApiConst.dailySales);
    final data = response.jsonBody?['data'];
    if (data is! num) {
      throw ParsingException('Respuesta inválida de ventas diarias');
    }
    return data.toDouble();
  }
}
