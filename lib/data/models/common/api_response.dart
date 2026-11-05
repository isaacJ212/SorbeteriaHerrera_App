import "../../helpers/json_helper.dart";

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;

  ApiResponse({required this.success, this.data, this.message});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json)? dataParser,
  ) {
    final success = readBool(json, ['Success']) ?? false;
    final message = readString(json, ['Message']);

    final dataValue = json["data"] ?? json["Data"];

    return ApiResponse(
      success: success,
      data: dataParser == null || dataValue == null
          ? dataValue as T?
          : dataParser(dataValue),
      message: message,
    );
  }
}
