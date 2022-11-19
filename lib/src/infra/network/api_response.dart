class ApiResponse {
  final dynamic data;
  final int? statusCode;
  final dynamic requestBody;
  final Map<String, dynamic> headers;

  ApiResponse({
    required this.headers,
    this.data,
    this.statusCode,
    this.requestBody,
  });
}
