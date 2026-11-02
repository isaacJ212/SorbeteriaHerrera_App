

import 'package:herrera_app/data/models/detalle_usuario_model/detalle_usuario_models.dart';
import 'package:herrera_app/data/repositories/userDetails_repository.dart';

class UserService {
  final UserdetailsRepository _userdetailsRepository;

  UserService(this._userdetailsRepository);

  Future<DetalleUsuarioResponseModels> getUserById(int userId){
    return _userdetailsRepository.getUserById(userId);
  }


}
