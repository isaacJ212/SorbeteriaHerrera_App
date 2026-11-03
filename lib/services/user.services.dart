import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/data/repositories/user_repository.dart';

class UserService {
  final UserRepository _repository;

  UserService(this._repository);

  Future<List<UsuarioResponseModel>> obtenerUsuariosActivos({
    String busqueda = '',
    FiltroRolUsuario filtroRol = FiltroRolUsuario.todos,
  }) => _repository.obtenerUsuariosActivos(
    busqueda: busqueda,
    filtroRol: filtroRol,
  );
}
