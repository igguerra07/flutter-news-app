import 'package:newsapp/src/app/features/news/domain/entities/news.dart';

abstract class NewsState {}

class NewsLoadedState implements NewsState {
  final List<News> news;
  
  NewsLoadedState({
    required this.news,
  });
}

class NewsInitialState implements NewsState {}

class NewsLoadingState implements NewsState {}

class NewsFailureState implements NewsState {}
