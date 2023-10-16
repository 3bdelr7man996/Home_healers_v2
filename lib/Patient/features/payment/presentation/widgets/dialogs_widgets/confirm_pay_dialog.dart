import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmPayDialog extends StatelessWidget {
  const ConfirmPayDialog({super.key, required this.order});
  final OrderData order;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            5.ph,
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: AppConstants.customAssetSvg(
                imagePath: AppImages.likeSign,
              ),
            ),
            10.ph,
            Text(
              "thank_you".tr(),
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "reservation_been_confirmed".tr(),
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "${"booking_with_physiotherapist_confirmed".tr()}${order.advertiser.firstnameAr} ${order.advertiser.lastnameAr}",
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "order_number".tr() + order.id,
              style: const TextStyle(fontSize: 12.0),
            ),
            30.ph,
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(
                  fontSize: 18,
                  color: AppColors.whiteColor,
                );
              }
              return const TextStyle(fontSize: 14, color: AppColors.whiteColor);
            }),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('return'.tr()),
        ),
      ],
    );
  }

//   Future<void> _showAlertDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return

//     },
//   );
// }
}
