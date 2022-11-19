import 'package:newsapp/src/app/features/news/data/models/news_model.dart';

class NewsResponseModel {
  final String status;
  final int totalResults;
  final List<NewsModel> articles;

  NewsResponseModel({
    required this.status,
    required this.articles,
    required this.totalResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toJson()).toList(),
    };
  }

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json['status'] ?? '',
      totalResults: json['totalResults']?.toInt() ?? 0,
      articles: List<NewsModel>.from(
        json['articles']?.map(
          (x) => NewsModel.fromJson(x),
        ),
      ),
    );
  }
}
