import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

PreferredSizeWidget customAppBar(BuildContext context,
    {String title = '',
    bool backButton = true,
    bool fromSetting = false,
    double? elevation = 8,
    Color? backgroundColor = AppColors.backGroundColor,
    var actions}) {
  return AppBar(
    centerTitle: true,
    actions: actions ?? [],
    leading: backButton
        ? Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 199, 244, 253),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                if (fromSetting) {
                  AppConstants.customNavigation(
                      context, const HomeScreen(selectedIndex: 3), 1, 0);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          )
        : const SizedBox(),
    backgroundColor: backgroundColor,
    shadowColor: AppColors.borderColor,
    elevation: elevation,
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
