import 'package:flutter/material.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/historial_acceso_models/historial_models.dart';
import 'package:herrera_app/services/historial_acceso_service.dart';

class HistorialAccesoProvider extends ChangeNotifier {
  final HistorialAccesoService _service;

  HistorialAccesoProvider(this._service);

  HistorialAccesoResponse? _historial;
  HistorialAccesoResponse? get historial => _historial;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> cargarHistorial() async {
    _isLoading = true;
    _errorMessage = null;
    _historial = null;
    notifyListeners();

    try {
      _historial = await _service.getHistorial();
    } on AppException catch (e) {
      _errorMessage = e.message;
    } catch (_) {
      _errorMessage = 'Ocurrió un error inesperado al cargar el historial';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
