import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/get_treading_news.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/nothing.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_state.dart';

class NewsStore extends Cubit<NewsState> {
  late final GetTreadingNews _getTreadingNews;

  NewsStore({
    required GetTreadingNews getTreadingNews,
  }) : super(NewsInitialState()) {
    _getTreadingNews = getTreadingNews;
  }

  Future<void> getTreadingNews() async {
    emit(NewsLoadingState());
    
    final eitherResult = await _getTreadingNews.call(const Nothing());

    eitherResult.fold(
      (failure) => emit(NewsFailureState()),
      (data) => emit(NewsLoadedState(news: data.news)),
    );
  }
}
