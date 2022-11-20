import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HighlightNewsImage extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;

  const HighlightNewsImage({
    Key? key,
    required this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.grey,
          ],
        ).createShader(bounds),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
