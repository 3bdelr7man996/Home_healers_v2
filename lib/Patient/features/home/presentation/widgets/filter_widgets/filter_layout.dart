import 'package:dr/Patient/features/home/presentation/cubit/cubit/filter_cubit.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'advartiser_categ_radio_button.dart';

class FilterLayout<T extends RadioItem> extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  FilterLayout(
      {super.key,
      required this.title,
      required this.radioList,
      required this.selectedRadioValue,
      this.onRadioChanged,
      this.selectedRadioText = '',
      this.showRadio = false,
      this.onTapDropIcon});

  final String title;
  final String selectedRadioText;
  final List<T> radioList;
  final T? selectedRadioValue;
  final void Function(T?)? onRadioChanged;
  final void Function()? onTapDropIcon;
  final bool showRadio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 30.0,
        bottom: 10.0,
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 7.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black38,
              width: 0.5,
            ),
          ),
        ),
        child: Theme(
          data: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.resolveWith(
                  (states) => AppColors.primaryColor),
            ),
          ),
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            thickness: 3,
            trackVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                TitleSection(
                  title: title,
                  selectedItem: selectedRadioText,
                  showRadio: showRadio,
                  onTapDropIcon: onTapDropIcon,
                ),
                if (showRadio)
                  CategoriesRadioButton<T>(
                    radioList: radioList,
                    selectedValue: selectedRadioValue,
                    onChanged: onRadioChanged,
                  ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    required this.title,
    this.selectedItem = '',
    this.onTapDropIcon,
    this.showRadio = false,
  });
  final String title;
  final String selectedItem;
  final bool showRadio;
  final void Function()? onTapDropIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapDropIcon,
      child: Row(
        children: [
          10.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (!showRadio) Text(selectedItem),
            ],
          ),
          const Spacer(),
          showRadio
              ? const Icon(Icons.arrow_drop_up)
              : const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
