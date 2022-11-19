import 'package:injectable/injectable.dart';
import 'package:newsapp/src/app/di/injector.dart';
import 'package:newsapp/src/app/features/news/data/datasources/remote/news_remote_data.dart';
import 'package:newsapp/src/app/features/news/data/datasources/remote/news_remote_data_impl.dart';
import 'package:newsapp/src/app/features/news/data/repositories/news_repository_impl.dart';
import 'package:newsapp/src/app/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/get_treading_news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_store.dart';

@module
abstract class NewsModule {
  @lazySingleton
  NewsRemoteDataSource get newsRemoteData =>
      NewsRemoteDataSourceImpl(apiClient: getIt());

  @lazySingleton
  NewsRepository get newsRepository => NewsRepositoryImpl(remote: getIt());

  @lazySingleton
  GetTreadingNews get getTreadingNews =>
      GetTreadingNews(newsRepository: getIt());

  @injectable
  NewsStore get newsStore => NewsStore(getTreadingNews: getIt());
}
