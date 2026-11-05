import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/dashboard_models/dashboard_cards.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/data/repositories/dashboard_repository.dart';

class DashboardServices {
  final DashboardRepository _dashboardRepository;
  DashboardServices(this._dashboardRepository);

  Future<DashboardCards> getDashboardCards() async {
    try {
      final dashboardCardsData = await _dashboardRepository
          .fetchDashboardCards();
      return dashboardCardsData;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VentasResponseModel>> getVentas({
    int page = 1,
    int pageSize = 3,
  }) async {
    try {
      if (page < 1 || pageSize < 1) {
        throw BadRequestException("Page and pageSize must be greater than 0");
      }

      final ventasData = await _dashboardRepository.fetchVentas(page, pageSize);
      return ventasData;
    } catch (e) {
      rethrow;
    }
  }
}
