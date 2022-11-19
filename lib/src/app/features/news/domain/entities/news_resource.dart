import 'package:newsapp/src/app/features/news/domain/entities/news.dart';

class NewsResource {
  final int newsCount;
  final List<News> news;
  
  NewsResource({
    required this.news,
    required this.newsCount,
  });
}
