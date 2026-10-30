import 'package:flutter/material.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:herrera_app/services/auth_service.dart';

enum AuthStatus{ authenticated, unauthenticated, unknown}

class AuthProvider extends ChangeNotifier {

  final AuthService _authService;
  AuthProvider(this._authService);

  UsuarioResponseModel? _currentUser;
  UsuarioResponseModel? get currentUser => _currentUser;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  AuthStatus _authStatus = AuthStatus.unknown;
  AuthStatus get authStatus => _authStatus;
  bool get isAuthenticated => _authStatus == AuthStatus.authenticated;
  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;


  Future<void> login({required String userName, required String password}) async{
    if (_isSubmitting) {
      return; 
    }

    _isSubmitting = true;
    _errorMessage = null;
    notifyListeners();

    try {
      UsuarioResponseModel user = await _authService.login(userName,password);
      _authStatus = AuthStatus.authenticated;
      _currentUser  = user;


    } on AppException catch (e) {
      _errorMessage = e.message;
      _authStatus = AuthStatus.unauthenticated;
    } on FormatException catch (e){
      _errorMessage = e.message;
    } catch(e){
      _errorMessage = 'Se ha producido un error inesperado. Por favor, inténtalo de nuevo.';
      _authStatus = AuthStatus.unauthenticated;
    }

    _isSubmitting = false;
    notifyListeners();
  }

  Future<void> checkSession() async{
    try {
      final bool isAuthenticated = await _authService.isLoggedIn();

      if (isAuthenticated) {
        _currentUser = await _authService.getCurrentUser();
      }

      _authStatus = isAuthenticated
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    } catch (e) {
      

      _errorMessage = 'Ocorruio un error inesperado. Intente de nuevo';
      _authStatus = AuthStatus.unauthenticated;
    } finally{

      notifyListeners();
    }
  }

  Future<void> logout() async{
    await _authService.logout();
    _currentUser = null;
    _authStatus = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();

  }

}