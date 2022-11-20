import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/shimmer/shimmer_news_item.dart';

class ShimmerNewsLoading extends StatelessWidget {
  const ShimmerNewsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 6,
      itemBuilder: (_, index) => const ShimmerNewsItem(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
