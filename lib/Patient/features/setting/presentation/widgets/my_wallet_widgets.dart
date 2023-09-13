import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCurrentBalance extends StatelessWidget {
  const MyCurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 108, 210, 233),
            Color.fromARGB(173, 116, 10, 154)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                "الرصيد الحالي",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              15.ph,
              Text(
                "1500 SAR",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "شحن",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(173, 116, 10, 154)),
                ),
                5.pw,
                SvgPicture.asset("assets/icons/add2_icon.svg")
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class DepositWidget extends StatelessWidget {
  const DepositWidget({super.key});

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
            SvgPicture.asset("assets/icons/deposit_icon.svg"),
            10.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "إيداع في فودافون",
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
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}

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
