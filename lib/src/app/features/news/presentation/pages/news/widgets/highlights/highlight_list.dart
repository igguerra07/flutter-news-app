import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_state.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/store/news_store.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/highlights/highlight_item.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/shimmer/shimmer_highlight_loading.dart';

class HighlightNews extends StatelessWidget {
  final Function(News) onTap;

  const HighlightNews({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsStore newsStore = BlocProvider.of(context);
    return BlocBuilder(
      bloc: newsStore,
      builder: (_, state) {
        if (state is NewsLoadingState) {
          return const AnimatedSwitcher(
            duration: Duration(microseconds: 350),
            child: ShimmerHighlightLoading(),
          );
        }
        if (state is NewsLoadedState) {
          return AnimatedSwitcher(
            duration: const Duration(microseconds: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                  child: const Text(
                    "Destaques",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.news.length,
                    itemBuilder: (_, index) => HighlightNewsItem(
                      onTap: onTap,
                      news: state.news[index],
                    ),
                    separatorBuilder: (_, index) => const SizedBox(width: 8),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
