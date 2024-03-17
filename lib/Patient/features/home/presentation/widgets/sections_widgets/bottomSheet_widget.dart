import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetForPatient extends StatelessWidget {
  const BottomSheetForPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "شكراً لك على تقييم الخدمة",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              5.ph,
              const Text(
                "احصل علي خصم 10% علي رسوم الخدمة عند استخدام كود الخصم الخاص بطلبك",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              15.ph,
              Image.asset("assets/images/five_stars.png"),
              15.ph,
              const Text(
                "نسعي دوما لتحسين خدمتكم",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Abcdii',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.ios_share_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                10.ph,
                                const Text(
                                  "شارك",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              15.ph,
              const Text(
                "كود الخصم ساري علي جميع الخدمات التي يقدمها التطبيق",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
