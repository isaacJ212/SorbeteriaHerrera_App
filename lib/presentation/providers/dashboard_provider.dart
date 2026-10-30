import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/services/dashboard_services.dart';

enum ViewStatus { initial, loading, succes, error }

class DashboardProvider extends ChangeNotifier {
  final DashboardServices _dashboardServices;
  DashboardProvider(this._dashboardServices);

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  final List<VentasResponseModel> _ventas = [];
  List<VentasResponseModel> get ventas => _ventas;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchVentas() async {
    _viewStatus = ViewStatus.loading;
    try {
      final ventasData = await _dashboardServices.getVentas();
      _ventas.clear();
      for (var venta in ventasData) {
        _ventas.add(venta);
      }
      _viewStatus = ViewStatus.succes;
    } catch (e) {
      _viewStatus = ViewStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
