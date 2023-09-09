import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPointsheader extends StatelessWidget {
  const MyPointsheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: context.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 108, 210, 233), AppColors.secondryColor],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'عدد نقاطك',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            5.ph,
            const Text(
              '150 نقطة',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            5.ph,
            const Text(
              '(45 ر.س)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أمس',
              style: TextStyle(fontSize: 18),
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/pay_icon.svg',
                  width: 35,
                  height: 35,
                ),
                10.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('تم كسب نقاط',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    5.ph,
                    Text(
                      '16 يونيو 2023 - 10:39 م',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
                5.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '50 نقطة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondryColor),
                    ),
                    5.ph,
                    const Text(
                      '(15 ر.س)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
