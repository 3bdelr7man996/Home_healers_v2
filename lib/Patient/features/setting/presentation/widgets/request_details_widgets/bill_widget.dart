// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  var listOfOrders;
  bool fromNotification;
  var notificationOrder;
  Bill({
    super.key,
    this.listOfOrders,
    this.notificationOrder,
    this.fromNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "مدة الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "30-60 دقيقة",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "عدد الجلسات",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "${fromNotification ? notificationOrder[0]['sessions_count'] : listOfOrders.sessionsCount}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "سعر الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              fromNotification
                  ? notificationOrder[0]['advertiser'] == null
                      ? ""
                      : "${notificationOrder[0]['advertiser']['session_price']}"
                  : listOfOrders.advertiser.sessionPrice == null
                      ? ""
                      : "${listOfOrders.advertiser.sessionPrice} ريال",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.secondryColor),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "كود الخصم :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            fromNotification
                ? notificationOrder[0]['coupon'] == null
                    ? const Text(
                        "لا يوجد",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    : Text(
                        "${notificationOrder[0]['coupon']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )
                : listOfOrders.coupon == null
                    ? const Text(
                        "لا يوجد",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    : Text(
                        "${listOfOrders.coupon}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )
          ],
        ),
        20.ph,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "الضريبة :",
        //       style: TextStyle(fontWeight: FontWeight.w500),
        //     ),
        //     Text(
        //       "0 ريال",
        //       style: TextStyle(fontWeight: FontWeight.w600),
        //     )
        //   ],
        // ),
        // 20.ph,
        const Divider(
          thickness: 1,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("المجموع : ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              fromNotification
                  ? notificationOrder[0]['sessions_count'] == null ||
                          notificationOrder[0]['advertiser']['session_price'] ==
                              null
                      ? ""
                      : notificationOrder[0]['amount'] != 0
                          ? "${notificationOrder[0]['amount']}"
                          : "${(notificationOrder[0]['sessions_count'] * notificationOrder[0]['advertiser']['session_price']).toString()}"
                  : listOfOrders.sessionsCount == null ||
                          listOfOrders.advertiser.sessionPrice == null
                      ? ""
                      : listOfOrders.amount != 0
                          ? "${listOfOrders.amount}"
                          : "${listOfOrders.advertiser.sessionPrice * listOfOrders.sessionsCount} ريال",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.secondryColor),
            )
          ],
        )
      ],
    );
  }
}
