import 'package:herrera_app/core/constants/api_constants.dart';
import 'package:herrera_app/core/errors/api_exception.dart';
import 'package:herrera_app/core/network/api_client.dart';
import 'package:herrera_app/data/models/historial_acceso_models/historial_models.dart';

import 'package:http/http.dart';

class HistorialAccesoRepository {
  final ApiClient apiClient;

  HistorialAccesoRepository({required this.apiClient});

  Future<HistorialAccesoResponse> getHistorial() async{
    final response = await apiClient.get(ApiConst.audit);

    final json = response.jsonBody;

    if (json == null) {
      throw const ParsingException();
    }

    final data = json['data'] as Map<String, dynamic>?;


    if (data == null) {
      throw const ParsingException('no se encontro el historial');

    }
  }

}