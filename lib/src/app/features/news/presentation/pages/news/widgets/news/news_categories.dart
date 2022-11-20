import 'package:flutter/material.dart';

class NewsCategories extends StatefulWidget {
  final Function(String) onTap;
  final List<String> categories;

  const NewsCategories({
    Key? key,
    required this.onTap,
    required this.categories,
  }) : super(key: key);

  @override
  State<NewsCategories> createState() => _NewsCategoriesState();
}

class _NewsCategoriesState extends State<NewsCategories> {
  late String _selectedCategory;

  @override
  void initState() {
    _selectedCategory = widget.categories.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (_, index) => ActionChip(
        backgroundColor: _selectedCategory == widget.categories[index]
            ? Colors.blueAccent
            : null,
        onPressed: () {
          widget.onTap(widget.categories[index]);
          setState(() => _selectedCategory = widget.categories[index]);
        },
        label: Text(
          widget.categories[index],
          style: TextStyle(
            color: _selectedCategory == widget.categories[index]
                ? Colors.white
                : null,
          ),
        ),
      ),
      separatorBuilder: (_, __) => const SizedBox(width: 4),
    );
  }
}
