import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_font.dart';

PreferredSizeWidget customAppBar(
  BuildContext context, {
  String title = '',
  bool backButton = true,
}) {
  return AppBar(
    centerTitle: true,
    // automaticallyImplyLeading: true,
    // leading: IconButton(
    //   icon:
    //       AppConstants.customAssetSvg(imagePath: AppImages.circleBackArrowIcon),
    //   onPressed: () {
    //     Navigator.pop(context);
    //     //key.currentState?.openDrawer();
    //   },
    // ),
    actions: [
      backButton
          ? Container(
              margin: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 199, 244, 253),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primaryColor,
                ),
                // AppConstants.customAssetSvg(
                //     imagePath: AppImages.circleBackArrowIcon),
                onPressed: () {
                  Navigator.pop(context);
                  //key.currentState?.openDrawer();
                },
              ),
            )
          : const SizedBox(),
    ],
    backgroundColor: AppColors.backGroundColor,
    elevation: 0,
    //iconTheme: const IconThemeData(color: AppColors.darkPrimaryColor),
    title: Text(
      title,
      style: bigBlackFont().copyWith(color: AppColors.blackColor),
    ),
  );
}
