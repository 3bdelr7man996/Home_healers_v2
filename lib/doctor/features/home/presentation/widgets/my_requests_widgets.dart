import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  final int activeIndex;
  final Function(int) onIndexChanged;

  Categories({
    super.key,
    required this.categories,
    required this.activeIndex,
    required this.onIndexChanged,
  });

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(widget.categories.length, (index) {
          return GestureDetector(
            onTap: () {
              widget.onIndexChanged(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.02,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 4.0,
                      color: (widget.activeIndex == index)
                          ? AppColors.primaryColor
                          : AppColors.hintColor,
                    ),
                  ),
                ),
                child: Text(
                  widget.categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (widget.activeIndex == index)
                        ? AppColors.primaryColor
                        : AppColors.hintColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
