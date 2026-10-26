sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType : $message';
}

class NetException extends AppException {
  const NetException({this.statusCode,String message = 'Revisa tu conexión a Internet',}) : super(message);

  final int? statusCode;
}

class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});

  final int? statusCode;
}

class ParsingException extends AppException {
  const ParsingException([super.message = 'Formato de respuesta inespertado']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Su sesión a expirado. Inice sesión nuevamenete',
  ]);
}

class NotFountException extends AppException {
  const NotFountException([super.message = 'Recurso no Encontrado']);
}
