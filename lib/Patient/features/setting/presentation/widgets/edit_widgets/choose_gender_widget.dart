import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/shared_widgets/gender_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseGenderForProfile extends StatelessWidget {
  const ChooseGenderForProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اختر الجنس".tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenderButton(gender: "male", title: "male", fromSetting: true),
              GenderButton(gender: "female", title: "female", fromSetting: true)
            ],
          )
        ],
      ),
    );
  }
}
