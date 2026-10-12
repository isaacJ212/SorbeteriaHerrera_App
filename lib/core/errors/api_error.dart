class ApiError {
  final Map<String, dynamic> data;
  final String message;
  final int statusCode;

  ApiError({
    required this.data,
    required this.statusCode,
    required this.message,
  });
}
