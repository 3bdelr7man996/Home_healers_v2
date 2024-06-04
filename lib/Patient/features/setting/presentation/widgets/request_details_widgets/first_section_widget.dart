// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class FirstSection extends StatelessWidget {
  int TabIndexClicked;
  OrderData? listOfOrders;
  var notificationOrder;
  bool fromNotification;
  FirstSection(
      {super.key,
      required this.TabIndexClicked,
      this.listOfOrders,
      this.notificationOrder,
      this.fromNotification = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    "رقم الطلب : ${fromNotification ? notificationOrder[0]['id'] : listOfOrders!.id}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                FittedBox(
                  child: Text(
                    "تاريخ الطلب : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(fromNotification ? notificationOrder[0]['created_at'] : listOfOrders!.createdAt))}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                //if(!fromNotification)
                FittedBox(
                  child: Text(
                    "تاريخ الحجز : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(fromNotification ? notificationOrder[0]['start_at'] : listOfOrders!.startAt))}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          10.pw,
          Expanded(
            child: Text(
              num == 0
                  ? "قيد المراجعة \nفي انتظار القبول"
                  : num == 1
                      ? "مقبولة \nفي انتظار الدفع"
                      : num == 2
                          ? "مؤكدة \nتم الدفع"
                          : num == 3
                              ? "مكتملة \nتم إنهاء الزيارة"
                              : num == 4
                                  ? "ملغية \nتم الإلغاء"
                                  : "الجلسة \n قيد الانتظار",
              style: TextStyle(
                color: num == 0
                    ? AppColors.yellowColor
                    : num == 4
                        ? AppColors.redColor
                        : AppColors.greenColor,
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
