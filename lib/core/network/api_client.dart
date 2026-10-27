import "dart:convert";
import "dart:async";


import 'package:herrera_app/core/errors/api_exception.dart';
import "package:herrera_app/core/constants/api_constants.dart";
import "package:herrera_app/data/models/common/http_response.dart";
import "package:herrera_app/data/models/token_model.dart";
import "package:herrera_app/presentation/providers/provider.dart";
import "package:http/http.dart" as http;


typedef AuthTokenProvider = Future<TokenModel?> Function();
class ApiClient {
  //para que lo pueda leer el service locator

  final AuthTokenProvider? authTokenProvider;
  ApiClient({this.authTokenProvider});

  final http.Client _client = http.Client();
  


  String get baseUrl {
    final String envBaseUrl = ApiConst.baseUrl; 
    return envBaseUrl.endsWith("/")
        ? envBaseUrl.substring(0, envBaseUrl.length - 1)
        : envBaseUrl;
  }



  Future<HttpResponse> get(
    String path, {
    bool authorized = true,
    Map<String, dynamic>? query,
    }) async => _send('GET', path, authorized: authorized, queryParameters: query);

  Future<HttpResponse> post(
    String path, {
    Object? body,
    bool authorized = true,
    Map<String, dynamic>? query,
  }) async => _send('POST', path, authorized: authorized, body: body);



  Future<HttpResponse> _send(
    String method,
    String path, {
    Object? body,
    bool authorized = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri uri = Uri.parse(baseUrl + path);
    if (queryParameters != null) {
      final Map<String, String> stringQuery = queryParameters.map(
        (key, value) => MapEntry(key, value.toString()),
      );
      uri = uri.replace(queryParameters: stringQuery);
    }
    //Headers de la request
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };

    //aqui faltaria la implementacion del storage de la sesion de la api
    final TokenModel? token = await authTokenProvider?.call();

    if (authorized && token != null && !token.isAccessTokenExpired) {
      headers["Authorization"] = "Bearer ${token.accessToken}";
    }

    final request = http.Request(method, uri)..headers.addAll(headers);
    if (body != null) {
      request.body = jsonEncode(body);
    }

    
    //return HttpResponse.fromHttpResponse(response);

    http.Response response;
    try {
      response = await _client
          .send(request)
          .timeout(const Duration(seconds: 10))
          .then(http.Response.fromStream);
    } on TimeoutException {
      throw NetworkException (statusCode: 408, message: 'La conexion tardo demasiado.');
    } on http.ClientException {
      throw NetworkException();
    }


    //manejo de statuscode error

    if (response.statusCode == 401) {
      throw const UnauthorizedException();
    }else if (response.statusCode == 404){
      throw const NotFoundtException();
    }else if (response.statusCode == 500){
      throw  ServerException('error interno de servidor',statusCode: response.statusCode);
    }else if(response.statusCode < 200 || response.statusCode > 300){
      throw ServerException('error en le peticion', statusCode: response.statusCode);
    }

    return HttpResponse.fromHttpResponse(response);
  }

  void dispose() => _client.close();
}
