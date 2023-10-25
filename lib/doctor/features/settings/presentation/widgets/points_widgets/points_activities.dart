import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({
    super.key,
    required this.title,
    required this.body,
    required this.date,
  });
  final String date;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   'أمس',
            //   style: TextStyle(fontSize: 18),
            // ),
            // 10.ph,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstants.customAssetSvg(
                  imagePath: AppImages.pointsPayIcon,
                  // width: 35,
                  // height: 35,
                ),
                15.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        date,
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 12.0),
                      ),
                      10.ph,
                      Text(
                        body,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: AppColors.secondryColor
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
