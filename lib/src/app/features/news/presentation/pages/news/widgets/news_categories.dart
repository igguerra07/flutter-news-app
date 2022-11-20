import 'package:flutter/material.dart';

class NewsCategories extends StatefulWidget {
  final List<String> categories;

  const NewsCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<NewsCategories> createState() => _NewsCategoriesState();
}

class _NewsCategoriesState extends State<NewsCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (_, index) => ActionChip(
        onPressed: () {},
        label: Text(widget.categories[index]),
      ),
      separatorBuilder: (_, __) => const SizedBox(width: 4),
    );
  }
}
