import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmPayDialog extends StatelessWidget {
  const ConfirmPayDialog(
      {super.key, required this.order, this.paymentResponse = ''});
  final OrderData order;
  final String? paymentResponse;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            5.ph,
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 15.0),
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(215, 248, 255, 1),
              ),
              child: AppConstants.customAssetSvg(
                imagePath: paymentResponse == "faild payment"
                    ? AppImages.errorIcon
                    : AppImages.likeSign,
              ),
            ),
            10.ph,
            Text(
              paymentResponse == "faild payment"
                  ? "sorry".tr()
                  : "thank_you".tr(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            5.ph,
            Text(
              paymentResponse == "faild payment"
                  ? "reservation_failed".tr()
                  : "reservation_been_confirmed".tr(),
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            10.ph,
            paymentResponse == "faild payment"
                ? Text(
                    "${"booking_with_physiotherapist_failed".tr()}${order.advertiser.firstnameAr} ${order.advertiser.lastnameAr}",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 12.0),
                  )
                : Text(
                    "${"booking_with_physiotherapist_confirmed".tr()}${order.advertiser.firstnameAr} ${order.advertiser.lastnameAr}",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12.0),
                  ),
            10.ph,
            Text(
              "order_number".tr() + order.id.toString(),
              style: const TextStyle(fontSize: 12.0),
            ),
            30.ph,
          ],
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: context.width * 0.5,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.primaryColor),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                  );
                }
                return const TextStyle(
                    fontSize: 14, color: AppColors.whiteColor);
              }),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'return'.tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
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
