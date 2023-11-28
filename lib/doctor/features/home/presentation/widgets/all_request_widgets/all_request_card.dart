import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
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
              height: 80,
              width: 80,
              child: AppConstants.customNetworkImage(
                  imagePath: pathImage,
                  fit: BoxFit.none,
                  imageError: detectStatusImg(title)),
            ),
            20.pw,
            Expanded(
              child: Column(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  String detectStatusImg(String statusName) {
    String imgPath = AppImages.sts_muscle_pain;
    switch (statusName) {
      case "Musculoskeletal pains" || "آلام العضلات والمفاصل":
        imgPath = AppImages.sts_muscle_pain;
        break;
      case "Sport Injuries" || "الاصابات الرياضية":
        imgPath = AppImages.sts_sports_injur;
        break;
      case "Post-op rehabilitation" || "التأهيل بعد العمليات الجراحية":
        imgPath = AppImages.sts_Post_rehab;
        break;
      case "Pediatric rehabilitation" || "تأهيل الأطفال":
        imgPath = AppImages.sts_rehab_child;
        break;
      case "Cardiopulmonary rehabilitation" || "التأهيل القلبي الرئوي":
        imgPath = AppImages.sts_card_rehab;
        break;
      case "Neurological Injuries" || "اصابات الجهاز العصبي":
        imgPath = AppImages.sts_nervous_injur;
        break;
      case "Women Health" || "مشاكل صحة المرأة":
        imgPath = AppImages.sts_women_health;
        break;
    }
    return imgPath;
  }
}
