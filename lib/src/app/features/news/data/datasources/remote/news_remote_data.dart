import 'package:newsapp/src/app/features/news/data/models/news_response_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponseModel> getTreadingNews();
}
