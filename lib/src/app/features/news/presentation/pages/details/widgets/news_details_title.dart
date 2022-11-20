import 'package:flutter/material.dart';
import 'package:newsapp/src/app/extensions/context.dart';

class NewsDetailsTitle extends StatelessWidget {
  final String titleText;

  const NewsDetailsTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Text(
        titleText,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
