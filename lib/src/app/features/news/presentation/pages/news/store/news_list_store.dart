import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/get_news_by_category.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_list_state.dart';

class NewsListStore extends Cubit<NewsListState> {
  late final GetNewsByCategory _getNewsByCategory;

  String _category = "Games";

  NewsListStore({
    required GetNewsByCategory getNewsByCategory,
  }) : super(NewsListInitialState()) {
    _getNewsByCategory = getNewsByCategory;
  }
  Future<void> getNewsByCategory({
    String? category,
  }) async {
    emit(NewsListLoadingState());
    _category = category ?? _category;
    final eitherResult = await _getNewsByCategory.call(
      GetNewsByCategoryParams(category: category ?? _category ),
    );

    eitherResult.fold(
      (failure) => emit(
        NewsListFailureState(message: "Something went wrong..."),
      ),
      (data) => emit(NewsListLoadedState(news: data.news)),
    );
  }
}
