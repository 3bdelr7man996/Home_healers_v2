import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

PreferredSizeWidget customAppBarForFilter(BuildContext context,
    {String title = '', bool backButton = true, bool fromSetting = false}) {
  return AppBar(
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Center(
          child: Text(
            "إعادة",
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ],
    leading: backButton
        ? Container(
            margin: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.close,
                size: 15,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                if (fromSetting) {
                  AppConstants.customNavigation(
                      context, HomeScreen(selectedIndex: 3), 1, 0);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          )
        : const SizedBox(),
    backgroundColor: AppColors.backGroundColor,
    shadowColor: Colors.grey.withOpacity(0.5),
    title: Text(
      title.tr(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        color: Colors.black,
      ),
    ),
  );
}

// ignore: must_be_immutable
class RaioButtonsSections extends StatefulWidget {
  var selectedValue, arrayForTitle, title, num;
  RaioButtonsSections(
      {super.key,
      required this.selectedValue,
      required this.arrayForTitle,
      required this.title,
      this.num = 1});

  @override
  State<RaioButtonsSections> createState() => _RaioButtonsSectionsState();
}

class _RaioButtonsSectionsState extends State<RaioButtonsSections> {
  bool showRadioButtons = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 30.0, bottom: 10.0),
      child: Container(
        height: widget.num == 2 && showRadioButtons ? 200 : null,
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
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        showRadioButtons = !showRadioButtons;
                      });
                    },
                    child: Row(
                      children: [
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            showRadioButtons
                                ? SizedBox()
                                : Text(widget.selectedValue!),
                          ],
                        ),
                        const Spacer(),
                        showRadioButtons
                            ? const Icon(Icons.arrow_drop_up)
                            : const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  showRadioButtons
                      ? SizedBox(
                          width: context.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (int i = 0;
                                  i < widget.arrayForTitle.length;
                                  i++)
                                RadioListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(widget.arrayForTitle[i]),
                                  value: widget.arrayForTitle[i],
                                  groupValue: widget.selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.selectedValue = value as String?;
                                      print(widget.selectedValue);
                                    });
                                  },
                                )
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
