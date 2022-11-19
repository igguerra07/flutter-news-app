import 'package:newsapp/src/infra/network/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic> queryParams = const {},
  });
}
