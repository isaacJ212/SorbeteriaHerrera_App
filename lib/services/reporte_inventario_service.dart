

import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';
import 'package:herrera_app/data/repositories/reporte_inventario_repository.dart';

class ReporteInventarioService {
  final ReporteInventarioRepository _repository;

  ReporteInventarioService({required this._repository});

  Future<ReporteInventarioModel> getReporte(){
    return _repository.getReporte();
  }
}