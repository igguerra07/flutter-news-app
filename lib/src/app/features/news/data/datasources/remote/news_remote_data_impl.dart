import 'package:newsapp/src/app/features/news/data/datasources/remote/news_remote_data.dart';
import 'package:newsapp/src/app/features/news/data/models/news_response_model.dart';
import 'package:newsapp/src/infra/network/api_client.dart';

const treadingNews = "top-headlines";
const everything = "everything";

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  late final ApiClient _apiClient;

  NewsRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) {
    _apiClient = apiClient;
  }

  @override
  Future<NewsResponseModel> getTreadingNews() async {
    final response = await _apiClient.get(
      treadingNews,
      queryParams: {
        "country": "br",
        "apiKey": "5e9ceb3e10da43238fcc74bfc18bf0a2",
      },
    );
    final data = NewsResponseModel.fromJson(response.data);
    return data;
  }

  @override
  Future<NewsResponseModel> getNewsByCategory({
    required String category,
  }) async {
    final response = await _apiClient.get(
      everything,
      queryParams: {
        "q": category,
        "language": "pt",
        "apiKey": "5e9ceb3e10da43238fcc74bfc18bf0a2",
      },
    );
    final data = NewsResponseModel.fromJson(response.data);
    return data;
  }
}
