import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppBarForHome extends StatelessWidget {
  const AppBarForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(158, 55, 209, 244),
            AppColors.secondryColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "hello_user".tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/doctor.png'),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RectangleForSection extends StatelessWidget {
  String pathImage, title;
  RectangleForSection({super.key, var pathImage = "", String title = ""})
      : this.title = title,
        this.pathImage = pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.height * 0.8,
      height: context.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
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
                const Text(
                  "(طلب ٤)",
                  style: TextStyle(color: AppColors.secondryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
