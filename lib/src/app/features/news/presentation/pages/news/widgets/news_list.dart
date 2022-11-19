import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  final List<News> news;
  final Function(News) onTap;
  final Future Function() onRefresh;

  const NewsList({
    Key? key,
    required this.news,
    required this.onTap,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: news.length,
        itemBuilder: (_, index) => NewsItem(
          onTap: onTap,
          news: news[index],
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
      ),
    );
  }
}
