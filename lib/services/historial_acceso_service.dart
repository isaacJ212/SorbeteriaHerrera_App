import 'package:herrera_app/data/models/historial_acceso_models/historial_models.dart';
import 'package:herrera_app/data/repositories/historial_acceso_repository.dart';

class HistorialAccesoService {
  final HistorialAccesoRepository _repository;

  HistorialAccesoService(this._repository);

  Future<HistorialAccesoResponse> getHistorial() => _repository.getHistorial();
}
