import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/token_model.dart';
import 'package:herrera_app/data/models/usuario_models/usuario_model.dart';
import 'package:http/http.dart';

class AuthRepository {

  final ApiClient _apiClient;

  AuthRepository({required this._apiClient});

  Future<TokenModel> login(String userName, String password) async{
    final response = await _apiClient.post(ApiConst.login, body: {'userName': userName, 'Password':password }, authorized: false);

    final json = response.jsonBody;

    if (json == null) {
      throw ParsingException();
    }

    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) {
      throw ParsingException('no se encontro respuesta');
    }

    return TokenModel.fromJson(data);
    
  }

  Future<UsuarioResponseModel> currentUser() async{
    final response = await _apiClient.get(ApiConst.infoMe);

    final json = response.jsonBody;

    if (json == null) {
      throw UnauthorizedException();
    }

    final data = json['data'] as Map<String, dynamic>?;
    if (data == null) throw const ParsingException();
    return UsuarioResponseModel.fromJson(data);

    
    
  }




}