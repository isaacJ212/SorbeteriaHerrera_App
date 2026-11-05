import 'package:herrera_app/data/models/ventas_models/ventas_models.dart';
import 'package:herrera_app/data/repositories/sales_repository.dart';

class SalesService {
  final SalesRepository _repository;
  SalesService(this._repository);
  Future<List<VentasResponseModel>> obtenerVentas() => _repository.obtenerVentas();
  Future<VentaDetalleModel> obtenerDetalle(int id) => _repository.obtenerDetalle(id);
}
