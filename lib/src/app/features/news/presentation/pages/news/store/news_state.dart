import 'package:equatable/equatable.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<News> news;

  NewsLoadedState({
    required this.news,
  });

  @override
  List<Object?> get props => [news];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsFailureState extends NewsState {}
