import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUPHaveAccField extends StatelessWidget {
  const SignUPHaveAccField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("do_you_have_account".tr()),
        InkWell(
          onTap: () {
            AppConstants.customNavigation(
                context,
                SignInScreen(
                  rollSelected: 1,
                ),
                0,
                1);
          },
          child: Text(
            "sign_in".tr(),
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
