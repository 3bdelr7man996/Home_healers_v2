import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/points_widgets/all_activities_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'points_header.dart';

class PointsBody extends StatelessWidget {
  const PointsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyPointsheader(),
          20.ph,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     10.pw,
          //     Text(
          //       'enjoy_your_cashback'.tr(),
          //       style: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18.0,
          //       ),
          //     ),
          //   ],
          // ),
          // 10.ph,
          // AppConstants.customAssetImage(
          //   imagePath: AppImages.pointsRestaurant,
          // ),
          // AppConstants.customAssetImage(
          //   imagePath: AppImages.pointsPurchase,
          //   width: context.width,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AppConstants.customAssetImage(
          //       imagePath: AppImages.pointsClothes,
          //       width: context.width * 0.4,
          //     ),
          //     AppConstants.customAssetImage(
          //       imagePath: AppImages.pointsDonaites,
          //       width: context.width * 0.4,
          //     ),
          //   ],
          // ),

          //.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              10.pw,
              Text(
                "latest_activity".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.5,
          ),
          const AllActivitiesSection(),
        ],
      ),
    );
  }
}
