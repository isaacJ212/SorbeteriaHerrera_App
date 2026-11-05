import 'package:herrera_app/data/models/detalle_usuario_model/detalle_usuario_models.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/data/repositories/userDetails_repository.dart';
import 'package:herrera_app/data/repositories/user_repository.dart';

class UserService {
  final UserdetailsRepository _detailsRepository;
  final UserRepository _usersRepository;

  UserService(this._detailsRepository, this._usersRepository);

  Future<DetalleUsuarioResponseModels> getUserById(int userId) =>
      _detailsRepository.getUserById(userId);

  Future<List<UsuarioResponseModel>> obtenerUsuariosActivos({
    String busqueda = '',
    FiltroRolUsuario filtroRol = FiltroRolUsuario.todos,
  }) => _usersRepository.obtenerUsuariosActivos(
    busqueda: busqueda,
    filtroRol: filtroRol,
  );
}
