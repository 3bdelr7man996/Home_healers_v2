// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Activity extends StatelessWidget {
  var Notification;
  Activity({super.key, this.Notification});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    Text('${Notification.data.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    5.ph,
                    Text(
                      '${Notification.createdAt}',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
                5.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Notification.notifiableId == null
                          ? ''
                          : '${Notification.notifiableId} نقطة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondryColor),
                    ),
                    5.ph,
                    Text(
                      Notification.data.pointsInSAR == null
                          ? ''
                          : '(${Notification.data.pointsInSAR} ر.س)',
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
