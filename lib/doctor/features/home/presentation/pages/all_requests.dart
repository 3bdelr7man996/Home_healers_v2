import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/my_requests_screen.dart';
import 'package:dr/doctor/features/home/presentation/widgets/all_requests_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Allrequests extends StatelessWidget {
  const Allrequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarForHome(),
        30.ph,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "all_requests".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              30.ph,
              InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context, const MyRequestsScreen(), 0, 1);
                },
                child: RectangleForSection(
                    title: "muscle_and_joint_injuries",
                    pathImage: "assets/icons/muscle_icon.svg"),
              ),
              15.ph,
              InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context, const MyRequestsScreen(), 0, 1);
                },
                child: RectangleForSection(
                  title: "Rehabilitation_of_children",
                  pathImage: "assets/icons/children_icon.svg",
                ),
              ),
              15.ph,
              InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context, const MyRequestsScreen(), 0, 1);
                },
                child: RectangleForSection(
                    title: "sports_muscle_injuries",
                    pathImage: "assets/icons/sports_muscle_injuries_icon.svg"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
