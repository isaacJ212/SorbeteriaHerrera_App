import 'package:flutter/material.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/detalle_usuario_model/detalle_usuario_models.dart';
import 'package:herrera_app/services/user.services.dart';

class UserdetailsProvider extends ChangeNotifier {
  final UserService _userService;

  UserdetailsProvider(this._userService);

  DetalleUsuarioResponseModels? _user;
  DetalleUsuarioResponseModels? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadUser(int userId) async {
    _isLoading = true;
    _errorMessage = null;
    _user = null;
    notifyListeners();

    try {
      _user = await _userService.getUserById(userId);
    } on AppException catch (error) {
      _errorMessage = error.message;
    } catch (_) {
      _errorMessage = 'Ocurrio un error Inesperado al cargar el usuario';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
