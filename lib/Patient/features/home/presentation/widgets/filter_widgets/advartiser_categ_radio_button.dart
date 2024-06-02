import 'package:dr/Patient/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

class CategoriesRadioButton<T extends RadioItem> extends StatelessWidget {
  const CategoriesRadioButton({
    super.key,
    required this.radioList,
    required this.selectedValue,
    required this.onChanged,
  });
  final List<T> radioList;
  final T? selectedValue;
  final void Function(T?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        children: radioList.map((item) {
          return RadioListTile<T>(
            title: Text(item.nameAr),
            value: item,
            groupValue: selectedValue,
            onChanged: onChanged,
          );
        }).toList(),
      ),
    );
  }
}
