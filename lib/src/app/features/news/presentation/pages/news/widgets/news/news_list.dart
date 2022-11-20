import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_list_state.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_list_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news/news_item.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/shimmer/shimmer_news_loading.dart';

class NewsList extends StatelessWidget {
  final Function(News) onTap;

  const NewsList({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsListStore = BlocProvider.of<NewsListStore>(context);
    return BlocBuilder(
      bloc: newsListStore,
      builder: (_, state) {
        if (state is NewsListLoadingState) {
          return const AnimatedSwitcher(
            duration: Duration(microseconds: 350),
            child: ShimmerNewsLoading(),
          );
        }
        if (state is NewsListLoadedState) {
          return AnimatedSwitcher(
            duration: const Duration(microseconds: 350),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              itemCount: state.news.length,
              itemBuilder: (_, index) => NewsItem(
                onTap: onTap,
                news: state.news[index],
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
