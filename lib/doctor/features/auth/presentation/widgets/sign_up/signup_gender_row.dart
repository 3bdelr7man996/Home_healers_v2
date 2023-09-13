import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/shared_widgets/gender_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpGenderField extends StatelessWidget {
  const SignUpGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "gender".tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GenderButton(gender: "male", title: "male"),
              GenderButton(gender: "female", title: "female")
            ],
          )
        ],
      ),
    );
  }
}
