import 'package:flutter/material.dart';

import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/widgets/news_details_bar.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/widgets/news_details_title.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/highlights/highlight_image.dart';

class NewsDetailsHeader extends StatelessWidget {
  final News news;

  const NewsDetailsHeader({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * .4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          HighlightNewsImage(
            borderRadius: BorderRadius.zero,
            imageUrl: news.newsImageUrl,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: NewsDetailsTitle(titleText: news.title),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: NewsDetailsAppBar(),
          )
        ],
      ),
    );
  }
}
