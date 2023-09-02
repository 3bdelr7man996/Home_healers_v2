import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_requests_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarForHome(),
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "all_requests".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                30.ph,
                RectangleForSection(
                    title: "muscle_and_joint_injuries",
                    pathImage: "assets/icons/muscle_icon.svg"),
                15.ph,
                RectangleForSection(
                  title: "Rehabilitation_of_children",
                  pathImage: "assets/icons/children_icon.svg",
                ),
                15.ph,
                RectangleForSection(
                    title: "sports_muscle_injuries",
                    pathImage: "assets/icons/sports_muscle_injuries_icon.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
