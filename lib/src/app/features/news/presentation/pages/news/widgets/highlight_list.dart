import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/highlight_item.dart';

class HighlightNews extends StatelessWidget {
  final List<News> news;
  final Function(News) onTap;

  const HighlightNews({
    Key? key,
    required this.news,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: news.length,
            itemBuilder: (_, index) => HighlightNewsItem(
              onTap: onTap,
              news: news[index],
            ),
            separatorBuilder: (_, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}
