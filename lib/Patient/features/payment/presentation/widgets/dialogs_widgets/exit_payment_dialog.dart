import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CancelPayDialog extends StatelessWidget {
  const CancelPayDialog({
    super.key,
  });

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
                color: Color.fromARGB(255, 239, 252, 254),
              ),
              child: AppConstants.customAssetSvg(
                imagePath: AppImages.errorIcon,
              ),
            ),
            10.ph,
            Text(
              "canceled_payment".tr(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
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
              'ok'.tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
