import 'package:newsapp/src/app/features/news/data/models/source_model.dart';

class NewsModel {
  final String url;
  final String title;
  final String content;
  final String? author;
  final String urlToImage;
  final String publishedAt;
  final String description;
  final SourceModel source;
 
  NewsModel({
    required this.url,
    required this.title,
    required this.content,
    required this.urlToImage,
    required this.publishedAt,
    required this.description,
    required this.source,
    this.author,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
      'content': content,
      'author': author,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'description': description,
      'source': source.toJson(),
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      url: json['url'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      author: json['author'],
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      description: json['description'] ?? '',
      source: SourceModel.fromJson(json['source']),
    );
  }
}
