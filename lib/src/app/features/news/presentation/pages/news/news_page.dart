import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/di/injector.dart';
import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_state.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsStore _newsStore = NewsStore(getTreadingNews: getIt());

  @override
  void initState() {
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
            return RefreshIndicator(
              onRefresh: () => _newsStore.getTreadingNews(),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.news.length,
                itemBuilder: (_, index) => NewsItem(news: state.news[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
