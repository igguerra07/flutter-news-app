import 'package:dio/dio.dart';
import 'package:newsapp/src/infra/network/api_client.dart';
import 'package:newsapp/src/infra/network/api_response.dart';
import 'package:newsapp/src/infra/network/api_exception.dart';

class DioClient implements ApiClient {
  late final Dio _dio;

  DioClient({
    required Dio dio,
    required String baseUrl,
  }) {
    _dio = dio;

    _dio.options.baseUrl = baseUrl;

    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'charset': 'utf-8',
    };

    _dio.interceptors.addAll(
      [
        LogInterceptor(requestBody: true, responseBody: true),
      ],
    );
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      return ApiResponse(
        data: response.data,
        headers: response.headers.map,
        statusCode: response.statusCode,
      );
    } on DioError catch (e, s) {
      throw ApiException(
        data: e.error,
        stackTrace: s,
        type: ApiErrorType.response,
        statusCode: e.response?.statusCode,
      );
    }
  }
}
