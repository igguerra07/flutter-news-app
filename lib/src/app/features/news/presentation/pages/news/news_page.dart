import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/features/news/data/datasources/remote/news_remote_data_impl.dart';
import 'package:newsapp/src/app/features/news/data/repositories/news_repository_impl.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/get_treading_news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_state.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news_item.dart';
import 'package:newsapp/src/infra/network/dio/dio_client.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final NewsStore _newsStore;

  @override
  void initState() {
    final dio = Dio();
    final apiClient = DioClient(dio: dio, baseUrl: "https://newsapi.org/v2/");
    final remote = NewsRemoteDataSourceImpl(apiClient: apiClient);
    final repository = NewsRepositoryImpl(remote: remote);
    final getTreadingNews = GetTreadingNews(newsRepository: repository);
    _newsStore = NewsStore(getTreadingNews: getTreadingNews);

    super.initState();

    _newsStore.getTreadingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n?.appName ?? ""),
        elevation: 0,
      ),
      body: BlocBuilder( 
        bloc: _newsStore,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsFailureState) {
            return const Center(
              child: Text("Something went wrong..."),
            );
          }
          if (state is NewsLoadedState) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.news.length,
              itemBuilder: (_, index) => NewsItem(news: state.news[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
