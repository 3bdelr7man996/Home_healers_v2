import 'package:dr/Patient/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PreferredSizeWidget customAppBarForFilter(BuildContext context,
    {String title = '', bool backButton = true, bool fromSetting = false}) {
  return AppBar(
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Center(
          child: InkWell(
            onTap: () {
              context.read<FilterCubit>().initData(context);
            },
            child: const Text(
              "إعادة",
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            ),
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
