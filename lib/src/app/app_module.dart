import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/src/infra/network/api_client.dart';
import 'package:newsapp/src/infra/network/dio/dio_client.dart';

const baseUrl = "https://newsapi.org/v2/";

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get dioClient => DioClient(dio: dio, baseUrl: baseUrl);
}
