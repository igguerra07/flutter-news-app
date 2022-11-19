import 'package:newsapp/src/app/features/news/data/mappers/news_mapper.dart';
import 'package:newsapp/src/app/features/news/data/models/news_response_model.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news_resource.dart';

extension NewsResponseModelExtension on NewsResponseModel {
  NewsResource toEntity() => NewsResource(
        newsCount: totalResults,
        news: articles.toEntityList(),
      );
}

extension NewsResourceExtension on NewsResource {
  NewsResponseModel toEntity() => NewsResponseModel(
        status: "",
        totalResults: newsCount,
        articles: news.toModelList(),
      );
}
