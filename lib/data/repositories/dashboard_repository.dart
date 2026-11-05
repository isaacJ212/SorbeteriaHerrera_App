import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/dashboard_models/dashboard_cards.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';

class DashboardRepository {
  final ApiClient _apiClient;
  DashboardRepository(this._apiClient);

  // Fetch data for the dashboard cards
  Future<DashboardCards> fetchDashboardCards() async {
    // waiting for the implementation of the session token to be ready,
    // for now and test dashboard endpoint is not auth required.
    try {
      final response = await _apiClient.get(
        ApiConst.dashboard,
        authorized: true,
      );
      if (response.jsonBody is! Map<String, dynamic>) {
        throw ParsingException("Invalid response format for dashboard cards");
      }
      if (response.statusCode >= 400) {
        throw ServerException(
          "Error fetching dashboard cards: ${response.statusCode}",
        );
      }
      return DashboardCards.fromJson(response.jsonBody!);
    } catch (e) {
      throw ServerException("Error fetching dashboard cards: ${e.toString()}");
    }
  }

  Future<List<VentasResponseModel>> fetchVentas(int page, int pageSize) async {
    // for this card i will just show three cards so i dont see necessary to build a complex filte
    final Map<String, dynamic> queryParams = {
      "page": page,
      "pageSize": pageSize,
    };

    //aclaration: the endpoint already sorts the sales by id on a descending order,
    // that meaning the most recent sales will be the first ones in thhe list.

    try {
      final response = await _apiClient.get(
        ApiConst.sales,
        authorized: true,
        query: queryParams,
      );
      if (response.jsonBody is! Map<String, dynamic>) {
        throw ParsingException("Invalid response format for ventas");
      }
      if (response.statusCode >= 400) {
        throw ServerException("Error fetching sales: ${response.statusCode}");
      }
      final page = response.jsonBody!['data'] as Map<String, dynamic>;
      final ventas = page['data'] as List<dynamic>;
      return ventas
          .map((e) => VentasResponseModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException("Error fetching sales: ${e.toString()}");
    }
  }
}
