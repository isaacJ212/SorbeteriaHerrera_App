import "dart:convert";

import "package:herrera_app/core/constants/api_constants.dart";
import "package:herrera_app/core/errors/api_exception.dart";
import "package:herrera_app/data/models/common/http_response.dart";
import "package:http/http.dart" as http;


class ApiClient {
  //para que lo pueda leer el service locator
  ApiClient();

  String get baseUrl {
    final String envBaseUrl =
        ApiConst.baseUrl; // se cambiara para consumrir a la api desplegada
    return envBaseUrl.endsWith("/")
        ? envBaseUrl.substring(0, envBaseUrl.length - 1)
        : envBaseUrl;
  }

  final http.Client _client = http.Client();

  // metodo para mapear de manera correcta los parametros de la query
  Uri _buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    final uri = Uri.parse(baseUrl + path);
    if (queryParameters != null) {

      final Map<String, String> stringQueryParameter = queryParameters.map(
        (key, value) => MapEntry(key, value.toString()) // se convierte lo values a string para evitar error de Uri.replacement

      );
      return uri.replace(queryParameters: queryParameters);
    }
    return uri;
  }


  Future<HttpResponse> get(
    String path, {
    bool authorized = true, 
    Map<String, String>? queryParameters,
  }) async {
    return await _send(
      'GET',
      path,
      authorized: authorized,
      queryParameters: queryParameters,
    );
  }

  //implementacion de consumo de la api

  Future<HttpResponse> _send(
    String method,
    String path, {
    Object? body,
    bool authorized = false,
    Map<String, String>? queryParameters,
  }) async {
    //Headers de la request
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };

    //aqui faltaria la implementacion del storage de la sesion de la api
    final token = "token";

    if (authorized && token != null && token.isNotEmpty) {
      headers["Authorization"] = "Bearer $token";
    }

    final uri = _buildUri(path, queryParameters);

    final payload = body == null ? null : jsonEncode(body);

    late final http.Response response;

    switch (method) {
      case 'GET':
        response = await _client.get(uri, headers: headers);
        break;
      case 'POST':
        response = await _client.post(uri, headers: headers, body: payload);
        break;
      case 'PUT':
        response = await _client.put(uri, headers: headers, body: payload);
        break;
      case 'PATCH':
        response = await _client.patch(uri, headers: headers, body: payload);
        break;
      case 'DELETE':
        response = await _client.delete(uri, headers: headers, body: payload);
        break;
      default:
        throw ApiException(
          statusCode: 0,
          message: 'Método HTTP no soportado: $method',
        );
    }

    return HttpResponse.fromHttpResponse(response);
  }
}
