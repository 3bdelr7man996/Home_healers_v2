import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final String pathImage, title;
  final int requestsCount;
  const RequestCard(
      {super.key,
      var this.pathImage = "",
      this.title = "",
      this.requestsCount = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.height * 0.8,
      height: context.height * 0.15,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 245, 243, 243),
              spreadRadius: 6,
              blurRadius: 5,
              offset: Offset(3, 3),
              blurStyle: BlurStyle.solid),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: AppConstants.customAssetSvg(
                imagePath: pathImage,
                fit: BoxFit.none,
              ),
            ),
            20.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.ph,
                Text(
                  title.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                10.ph,
                Text(
                  "( $requestsCount ${"request".tr()} )",
                  style: const TextStyle(color: AppColors.secondryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
