import 'package:flutter/material.dart';
import 'package:newsapp/src/app/extensions/context.dart';

class ShimmerHighlightItem extends StatelessWidget {
  const ShimmerHighlightItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
   //   height: context.deviceHeight * .35,
      width: context.deviceWidth * .8,
    );
  }
}
