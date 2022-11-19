import 'package:flutter/material.dart';
import 'package:newsapp/src/app/extensions/context.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewsItem extends StatelessWidget {
  const ShimmerNewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * .5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Container(
                  color: Colors.white,
                  width: context.deviceWidth,
                  height: context.deviceHeight * .2,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 2),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 2),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 2),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),
                      const SizedBox(height: 2),
                      Container(
                        color: Colors.white,
                        height: 16,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       news.source.name,
                      //       style: const TextStyle(
                      //         fontSize: 12,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //     Text(
                      //       news.publishedAt.toDateString(),
                      //       style: const TextStyle(
                      //         fontSize: 12,
                      //         color: Colors.grey,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // const SizedBox(height: 8),
                      // Text(
                      //   news.title,
                      //   style: const TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // const SizedBox(height: 8),
                      // Text(
                      //   news.description,
                      //   maxLines: 4,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
