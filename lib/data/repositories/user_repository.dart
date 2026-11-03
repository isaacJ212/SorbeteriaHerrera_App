import '../../core/constants/api_constants.dart';
import '../../core/errors/api_exception.dart';
import '../../core/network/api_client.dart';
import '../models/usuario_models/usuario_model.dart';

enum FiltroRolUsuario { todos, administradores, cajeros, bodega }

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<List<UsuarioResponseModel>> obtenerUsuariosActivos({
    String busqueda = '',
    FiltroRolUsuario filtroRol = FiltroRolUsuario.todos,
  }) async {
    final response = await _apiClient.get(
      ApiConst.activeUsers,
      authorized: false,
    );
    final data = response.jsonBody?['data'];
    if (data is! List) {
      throw const ParsingException('Respuesta inválida de usuarios');
    }

    final usuarios = data
        .map(
          (item) => UsuarioResponseModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    final termino = busqueda.trim().toLowerCase();
    return usuarios.where((usuario) {
      final nombreCompleto = '${usuario.firstName} ${usuario.lastName}'
          .toLowerCase();
      final coincideBusqueda =
          termino.isEmpty ||
          nombreCompleto.contains(termino) ||
          usuario.email.toLowerCase().contains(termino);

      return coincideBusqueda && _coincideRol(usuario.roles, filtroRol);
    }).toList();
  }

  bool _coincideRol(List<String> roles, FiltroRolUsuario filtro) {
    if (filtro == FiltroRolUsuario.todos) return true;

    return roles
        .map((rol) => rol.toLowerCase())
        .any(
          (rol) => switch (filtro) {
            FiltroRolUsuario.administradores =>
              rol == 'admin' || rol.contains('administrador'),
            FiltroRolUsuario.cajeros => rol.contains('cajer'),
            FiltroRolUsuario.bodega => rol.contains('bodega'),
            FiltroRolUsuario.todos => true,
          },
        );
  }
}
