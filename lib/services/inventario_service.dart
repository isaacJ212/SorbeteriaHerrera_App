import 'package:herrera_app/data/models/Detalle_Inventario_models/detalle_inventario_models.dart';
import 'package:herrera_app/data/models/inventario_models/inventario_models.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';
import 'package:herrera_app/data/repositories/inventario_repository.dart';
import 'package:herrera_app/data/repositories/sales_repository.dart';

class InventarioService {
  final InventarioRepository _repository;
  final SalesRepository _salesRepository;

  InventarioService(this._repository, this._salesRepository);

  Future<List<InventarioResponseGeneralModels>> obtenerProductos({
    String? search,
  }) => _repository.obtenerProductos(search: search);

  Future<DetalleInventarioModel> obtenerDetalle(int productId) =>
      _repository.obtenerDetalle(productId);

  Future<double> obtenerVentasDiarias() =>
      _salesRepository.obtenerVentasDiarias();

  Future<ReporteInventarioModel> obtenerEstadisticas() =>
      _repository.obtenerEstadisticas();
}
