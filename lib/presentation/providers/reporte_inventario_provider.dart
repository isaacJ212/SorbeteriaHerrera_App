import 'package:flutter/material.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';
import 'package:herrera_app/services/reporte_inventario_service.dart';

class ReporteInventarioProvider extends ChangeNotifier {
  final ReporteInventarioService _service;

  ReporteInventarioProvider(this._service);

  ReporteInventarioModel? _reporte;
  ReporteInventarioModel? get reporte => _reporte;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> cargarReporte() async {
    _isLoading = true;
    _errorMessage = null;
    _reporte = null;
    notifyListeners();

    try {
      _reporte = await _service.getReporte();
    } on AppException catch (e) {
      _errorMessage = e.message;
    } catch (_) {
      _errorMessage = 'Ocurrió un error inesperado al cargar el reporte';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}