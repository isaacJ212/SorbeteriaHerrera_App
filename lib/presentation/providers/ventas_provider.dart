import 'package:flutter/foundation.dart';
import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/services/sales_service.dart';

enum VentasViewStatus { initial, loading, success, error }

class VentasProvider extends ChangeNotifier {
  final SalesService _service;
  VentasProvider(this._service);
  VentasViewStatus _status = VentasViewStatus.initial;
  VentasViewStatus get status => _status;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  List<VentasResponseModel> _ventas = [];
  List<VentasResponseModel> get ventas => _ventas;
  VentaDetalleModel? _detalle;
  VentaDetalleModel? get detalle => _detalle;

  Future<void> cargarVentas() async {
    _status = VentasViewStatus.loading; _errorMessage = ''; notifyListeners();
    try { _ventas = await _service.obtenerVentas(); _status = VentasViewStatus.success; }
    catch (e) { _status = VentasViewStatus.error; _errorMessage = e.toString(); }
    notifyListeners();
  }
  Future<void> cargarDetalle(int id) async {
    _status = VentasViewStatus.loading; _detalle = null; _errorMessage = ''; notifyListeners();
    try { _detalle = await _service.obtenerDetalle(id); _status = VentasViewStatus.success; }
    catch (e) { _status = VentasViewStatus.error; _errorMessage = e.toString(); }
    notifyListeners();
  }
}
