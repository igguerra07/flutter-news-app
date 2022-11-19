import 'package:newsapp/src/app/features/news/domain/entities/source.dart';

class News {
  final String title;
  final Source source;
  final String content;
  final String publishedAt;
  final String description;
  final String originalLink;
  final String newsImageUrl;

  News({
    required this.title,
    required this.source,
    required this.content,
    required this.publishedAt,
    required this.description,
    required this.originalLink,
    required this.newsImageUrl,
  });
}
