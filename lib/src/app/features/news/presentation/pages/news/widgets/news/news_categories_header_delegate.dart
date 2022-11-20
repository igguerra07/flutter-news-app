import 'package:flutter/material.dart';

import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/news/news_categories.dart';

class NewsCategoriesHeaderPersistentDelegate
    extends SliverPersistentHeaderDelegate {
  final Function(String) onTap;

  NewsCategoriesHeaderPersistentDelegate({
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xFFF7F7F7),
      child: NewsCategories(
        onTap: onTap,
        categories: const [
          "Games",
          "Tecnologia",
          "Futebol",
          "Copa do mundo",
          "Finanças",
        ],
      ),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
