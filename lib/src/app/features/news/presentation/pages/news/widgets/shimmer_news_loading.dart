import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/shimmer_news_item.dart';

class ShimmerNewsLoading extends StatelessWidget {
  const ShimmerNewsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (_, index) => const ShimmerNewsItem(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
