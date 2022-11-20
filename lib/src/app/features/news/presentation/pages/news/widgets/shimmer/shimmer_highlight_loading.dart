import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/widgets/shimmer/shimmer_highlight_item.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHighlightLoading extends StatelessWidget {
  const ShimmerHighlightLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (_, index) => const ShimmerHighlightItem(),
              separatorBuilder: (_, index) => const SizedBox(width: 8),
            ),
          ),
        ],
      ),
    );
  }
}
