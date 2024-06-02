import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TranferWidget extends StatelessWidget {
  const TranferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Radius of the container
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "هذا الشهر",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        10.ph,
        Row(
          children: [
            SvgPicture.asset("assets/icons/transfer_icon.svg"),
            10.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تحويل أموال",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  10.ph,
                  Text(
                    "أحمد",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  10.ph,
                  Text(
                    "16 - يونيو 2023 - 10:39م",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Text(
              "-1,001 ريال",
              style: TextStyle(
                  color: AppColors.secondryColor, fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}
