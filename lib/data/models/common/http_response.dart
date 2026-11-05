import "dart:convert";

import "package:http/http.dart" as http;

class HttpResponse {
  final int statusCode;
  final String rawBody;
  final Map<String, dynamic>? jsonBody;

  const HttpResponse({
    required this.statusCode,
    required this.rawBody,
    required this.jsonBody,
  });

  factory HttpResponse.fromHttpResponse(http.Response response) {
    if (response.body.isEmpty) {
      return HttpResponse(
        statusCode: response.statusCode,
        rawBody: '',
        jsonBody: null,
      );
    }

    final body = response.body;
    try {
      final decoded = jsonDecode(body);
      return HttpResponse(
        statusCode: response.statusCode,
        rawBody: body,
        jsonBody: decoded is Map<String, dynamic>
            ? decoded
            : {'value': decoded},
      );
    } catch (_) {
      return HttpResponse(
        statusCode: response.statusCode,
        rawBody: body,
        jsonBody: null,
      );
    }
  }
}
