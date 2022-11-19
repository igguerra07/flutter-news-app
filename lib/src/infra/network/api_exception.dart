enum ApiErrorType {
  other,
  response,
  connection,
}

class ApiException implements Exception {
  final dynamic data;
  final int? statusCode;
  final ApiErrorType type;
  final StackTrace stackTrace;

  ApiException({
    required this.stackTrace,
    this.data,
    this.statusCode,
    this.type = ApiErrorType.other,
  });
}
