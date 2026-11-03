import 'package:flutter/foundation.dart';
import 'package:herrera_app/data/models/Detalle_Inventario_models/detalle_inventario_models.dart';
import 'package:herrera_app/data/models/inventario_models/inventario_models.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';
import 'package:herrera_app/services/inventario_service.dart';

enum InventarioViewStatus { initial, loading, success, error }

class InventarioProvider extends ChangeNotifier {
  final InventarioService _service;

  InventarioProvider(this._service);

  InventarioViewStatus _viewStatus = InventarioViewStatus.initial;
  InventarioViewStatus get viewStatus => _viewStatus;

  List<InventarioResponseGeneralModels> _productos = [];
  List<InventarioResponseGeneralModels> get productos => _productos;

  DetalleInventarioModel? _detalle;
  DetalleInventarioModel? get detalle => _detalle;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  double _ventasDiarias = 0;
  double get ventasDiarias => _ventasDiarias;

  ReporteInventarioModel? _estadisticas;
  ReporteInventarioModel? get estadisticas => _estadisticas;

  Future<void> cargarEstadisticas() async {
    _viewStatus = InventarioViewStatus.loading;
    _errorMessage = '';
    notifyListeners();
    try {
      _estadisticas = await _service.obtenerEstadisticas();
      _viewStatus = InventarioViewStatus.success;
    } catch (e) {
      _viewStatus = InventarioViewStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> cargarDatos() async {
    _viewStatus = InventarioViewStatus.loading;
    _errorMessage = '';
    notifyListeners();
    try {
      final results = await Future.wait([
        _service.obtenerProductos(),
        _service.obtenerVentasDiarias(),
      ]);
      _productos = results[0] as List<InventarioResponseGeneralModels>;
      _ventasDiarias = results[1] as double;
      _viewStatus = InventarioViewStatus.success;
    } catch (e) {
      _viewStatus = InventarioViewStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> cargarProductos({String? search}) async {
    _viewStatus = InventarioViewStatus.loading;
    _errorMessage = '';
    notifyListeners();
    try {
      _productos = await _service.obtenerProductos(search: search);
      _viewStatus = InventarioViewStatus.success;
    } catch (e) {
      _viewStatus = InventarioViewStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> cargarDetalle(int productId) async {
    _viewStatus = InventarioViewStatus.loading;
    _detalle = null;
    _errorMessage = '';
    notifyListeners();
    try {
      _detalle = await _service.obtenerDetalle(productId);
      _viewStatus = InventarioViewStatus.success;
    } catch (e) {
      _viewStatus = InventarioViewStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
