import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AboutCourseWidget extends StatelessWidget {
  const AboutCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "لقاء عن العلاج الطبي",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.share,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "مشاركة",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ],
        ),
        10.ph,
        Row(
          children: [
            Text(
              "حضور اللقاء",
              style: TextStyle(fontSize: 16),
            ),
            10.pw,
            Text(
              "250 ريال سعودي",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondryColor),
            )
          ],
        )
      ],
    );
  }
}
