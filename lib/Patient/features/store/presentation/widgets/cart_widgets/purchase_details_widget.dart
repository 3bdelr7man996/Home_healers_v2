// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PurchaseDetailsWidget extends StatelessWidget {
  bool withWalletDiscount;
  PurchaseDetailsWidget({super.key, this.withWalletDiscount = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي العناصر",
                  style: TextStyle(color: AppColors.hintColor, fontSize: 16.0),
                ),
                Text(
                  "3",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            10.ph,
            Divider(),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي التكلفة",
                  style: TextStyle(color: AppColors.hintColor, fontSize: 16.0),
                ),
                Text(
                  "1500 ر.س",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            10.ph,
            Divider(),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الخصم",
                  style: TextStyle(color: AppColors.greenColor, fontSize: 16.0),
                ),
                Text(
                  "- 40 ر.س",
                  style: TextStyle(
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            withWalletDiscount ? 10.ph : SizedBox(),
            withWalletDiscount
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "خصم المحفظة",
                        style: TextStyle(
                            color: AppColors.greenColor, fontSize: 16.0),
                      ),
                      Text(
                        "- 1500 ر.س",
                        style: TextStyle(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  )
                : SizedBox(),
            10.ph,
            Divider(),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الضريبة",
                  style: TextStyle(color: AppColors.hintColor, fontSize: 16.0),
                ),
                Text(
                  "25 ر.س",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            10.ph,
            Divider(),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الإجمالي",
                  style:
                      TextStyle(color: AppColors.secondryColor, fontSize: 16.0),
                ),
                Text(
                  "25 ر.س",
                  style: TextStyle(
                      color: AppColors.secondryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
