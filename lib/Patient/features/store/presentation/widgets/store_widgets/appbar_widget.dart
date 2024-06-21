import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget? AppbarWidgetForStore(BuildContext context) {
  return customAppBar(context, title: "المتجر", actions: [
    Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 15.0,
        right: 15.0,
      ),
      child: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            "assets/icons/basket_icon.svg",
            width: 37.5,
            height: 37.5,
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 23,
              height: 23,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.secondryColor,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "2",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            )

            // CircleAvatar(
            //   radius: 10,
            //   child: Center(
            //     child: Text(
            //       "2",
            //       style: TextStyle(color: Colors.white, fontSize: 15),
            //     ),
            //   ),
            //   backgroundColor: AppColors.secondryColor,
            // ),
            )
      ]),
    ),
  ]);
}
