import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/di/injector.dart';
import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_list_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/highlights/highlight_list.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news/news_categories_header_delegate.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news/news_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsStore _newsStore = getIt();
  final NewsListStore _newsListStore = getIt();

  @override
  void initState() {
    super.initState();
    _newsStore.getTreadingNews();
    _newsListStore.getNewsByCategory();
  }

  @override
  void dispose() {
    _newsStore.close();
    _newsListStore.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => _newsStore),
            BlocProvider(create: (_) => _newsListStore),
          ],
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: context.deviceHeight * .35,
                  flexibleSpace: HighlightNews(
                    onTap: (news) {},
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: NewsCategoriesHeaderPersistentDelegate(
                    onTap: (category) => _newsListStore.getNewsByCategory(
                      category: category,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: NewsList(
                    onTap: (news) {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.wait(
      [
        _newsStore.getTreadingNews(),
        _newsListStore.getNewsByCategory(),
      ],
    );
  }
}
