import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpTermsField extends StatelessWidget {
  const SignUpTermsField({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false, //todo
        onChanged: (newValue) {},
        activeColor: AppColors.primaryColor,
      ),
      title: Text(
        'terms'.tr(),
        style: const TextStyle(color: AppColors.primaryColor, fontSize: 13),
      ),
    );
  }
}
