// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HeaderForCard extends StatelessWidget {
  OrderData? listOfOrders;
  int TabIndexClicked;
  HeaderForCard(
      {super.key, required this.listOfOrders, required this.TabIndexClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: context.width,
        height: context.height * 0.1,
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
                      "رقم الطلب : ${listOfOrders!.id}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  if (listOfOrders!.startAt != null)
                    FittedBox(
                      child: Text(
                        "تاريخ الطلب : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(listOfOrders!.startAt))}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    )
                ],
              ),
            ),
            10.pw,
            Expanded(
              child: Text(
                TabIndexClicked == 0
                    ? "قيد المراجعة \nفي انتظار القبول"
                    : TabIndexClicked == 1
                        ? "مقبولة \nفي انتظار الدفع"
                        : TabIndexClicked == 2
                            ? "مؤكدة \nتم الدفع"
                            : TabIndexClicked == 3
                                ? "مكتملة \nتم إنهاء الزيارة"
                                : TabIndexClicked == 4
                                    ? "ملغية \nتم الإلغاء"
                                    : "الجلسة \n قيد الانتظار",
                style: TextStyle(
                    color: TabIndexClicked == 0
                        ? AppColors.yellowColor
                        : TabIndexClicked == 4
                            ? AppColors.redColor
                            : AppColors.greenColor,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
