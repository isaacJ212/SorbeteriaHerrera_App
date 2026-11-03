import 'package:flutter/foundation.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/data/repositories/user_repository.dart';
import 'package:herrera_app/services/user.services.dart';

enum UsuarioViewStatus { initial, loading, success, error }

class UsuarioProvider extends ChangeNotifier {
  final UserService _service;

  UsuarioProvider(this._service);

  UsuarioViewStatus _viewStatus = UsuarioViewStatus.initial;
  UsuarioViewStatus get viewStatus => _viewStatus;

  List<UsuarioResponseModel> _usuarios = [];
  List<UsuarioResponseModel> get usuarios => _usuarios;

  String _busqueda = '';
  String get busqueda => _busqueda;

  FiltroRolUsuario _filtroRol = FiltroRolUsuario.todos;
  FiltroRolUsuario get filtroRol => _filtroRol;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> cargarUsuarios({
    String? busqueda,
    FiltroRolUsuario? filtroRol,
  }) async {
    if (busqueda != null) _busqueda = busqueda;
    if (filtroRol != null) _filtroRol = filtroRol;

    _viewStatus = UsuarioViewStatus.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _usuarios = await _service.obtenerUsuariosActivos(
        busqueda: _busqueda,
        filtroRol: _filtroRol,
      );
      _viewStatus = UsuarioViewStatus.success;
    } catch (error) {
      _viewStatus = UsuarioViewStatus.error;
      _errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }
}
