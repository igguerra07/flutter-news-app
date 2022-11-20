import 'package:flutter/material.dart';

import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/highlight_image.dart';

class HighlightNewsItem extends StatelessWidget {
  final News news;
  final Function(News) onTap;

  const HighlightNewsItem({
    Key? key,
    required this.news,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(news),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        width: context.deviceWidth * .8,
        child: Stack(
          fit: StackFit.expand,
          children: [
            HighlightNewsImage(
              imageUrl: news.newsImageUrl,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                news.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
