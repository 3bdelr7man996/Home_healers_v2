import 'package:dr/Patient/features/home/presentation/widgets/choose_card_for_payment_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ChooseCard_screen extends StatelessWidget {
  const ChooseCard_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "choose_card", backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "اختر الكارد الخاصة بك :",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
            20.ph,
            CardWay(
              iconPath: "assets/icons/master_card_icon.svg",
              title: "Master card",
            ),
            20.ph,
            CardWay(
              iconPath: "assets/images/tamara.png",
              num: 1,
              title: "Tamara",
            ),
            20.ph,
            CardWay(
              iconPath: "assets/icons/paypal_icon.svg",
              title: "PayPal",
            ),
            20.ph,
            CardWay(
              iconPath: "assets/icons/Apple_pay_icon.svg",
              title: "Apple PAy",
            ),
            20.ph,
            CardWay(
              iconPath: "assets/images/stc_pay.png",
              num: 1,
              title: "Stc Pay",
            ),
            20.ph,
            CardWay(
              iconPath: "assets/icons/visa_card_icon.svg",
              title: "Visa",
            ),
            20.ph,
            SizedBox(
              width: context.width,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('تابع'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
