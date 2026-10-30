import 'package:herrera_app/core/constants/regular_expressions.dart';
import 'package:herrera_app/data/models/token_model.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/data/repositories/auth_repository.dart';
import 'package:herrera_app/data/repositories/token_Repository.dart';

class AuthService {

  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  AuthService(this._authRepository, this._tokenRepository);

  Future<UsuarioResponseModel>login (String userName, String password ) async{

    final trimmedUserName = userName.trim();
    final trimmedPassword = password.trim();

    if (trimmedUserName.isEmpty || trimmedPassword.isEmpty) {
      throw const FormatException('El correo y la contraseña no pueden ir vacios');
    }

    if (!RegexCommon.usernameRegex.hasMatch(trimmedUserName)) {

      throw const FormatException('Formato de usuario inválido. Debe tener entre 3 y 30 caracteres');
    }


    if (!RegexCommon.passwordRegex.hasMatch(trimmedPassword)){
      throw const FormatException('La contraseña es inválida. Debe tener al menos 4 caracteres y no contener espacios en blanco.');
    }

    if (trimmedPassword.isEmpty || trimmedPassword.isEmpty){
      throw const FormatException('El usuario y la contraseña no pueden estar vacíos');
    }

    final TokenModel token = await _authRepository.login(userName, password);
    await _tokenRepository.saveToken(token);
    return await _authRepository.currentUser();

  }

  Future<UsuarioResponseModel> getCurrentUser() async{

    return await _authRepository .currentUser();
  }

  Future<void> logout() async {
    TokenModel token = await _tokenRepository.ensureToken();
    await _authRepository.logout(token);
    await _tokenRepository.removeToken();
  }

  Future<bool> isLoggedIn() => _tokenRepository.hasValidToken();

}