import 'package:equatable/equatable.dart';

import 'package:newsapp/src/app/features/news/domain/entities/news.dart';

abstract class NewsListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsListInitialState extends NewsListState {}

class NewsListLoadingState extends NewsListState {}

class NewsListLoadedState extends NewsListState {
  final List<News> news;

  NewsListLoadedState({
    required this.news,
  });

  @override
  List<Object?> get props => [news];
}

class NewsListFailureState extends NewsListState {
  final String message;

  NewsListFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
