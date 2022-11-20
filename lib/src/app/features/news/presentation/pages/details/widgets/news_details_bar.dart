import 'package:flutter/material.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.all(16),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.library_add_rounded,
                    size: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
