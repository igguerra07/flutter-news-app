import 'package:newsapp/src/app/features/news/data/mappers/source_mapper.dart';
import 'package:newsapp/src/app/features/news/data/models/news_model.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';

extension NewsExtensions on News {
  NewsModel toModel() => NewsModel(
        title: title,
        content: content,
        url: originalLink,
        publishedAt: publishedAt,
        urlToImage: newsImageUrl,
        description: description,
        source: source.toModel(),
      );
}

extension NewsModelListExtension on List<NewsModel> {
  List<News> toEntityList() => List.from(
        map((news) => news.toEntity()),
      );
}

extension NewsModelExtension on NewsModel {
  News toEntity() => News(
        title: title,
        content: content,
        originalLink: url,
        publishedAt: publishedAt,
        description: description,
        newsImageUrl: urlToImage,
        source: source.toEntity(),
      );
}

extension NewsListExtension on List<News> {
  List<NewsModel> toModelList() => List.from(
        map((news) => news.toModel()),
      );
}
