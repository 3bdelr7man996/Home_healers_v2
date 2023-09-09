import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextFormFieldForSignUpForPatient extends StatelessWidget {
  final int num;
  final String title;
  final String icon;

  TextFormFieldForSignUpForPatient(
      {super.key, required this.num, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: num == 4
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: AppImages.showPasswordIcon,
                      fit: BoxFit.none,
                    ),
                  )
                : num == 5
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: AppConstants.customAssetSvg(
                          imagePath: AppImages.hiddenPassIcon,
                          fit: BoxFit.none,
                        ),
                      )
                    : null,
            hintText: title.tr(),
            prefixIcon: num == 7
                ? null
                : SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: icon,
                      fit: BoxFit.none,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
