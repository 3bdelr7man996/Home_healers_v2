import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../shared_widgets/custom_titled_text_form.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "change_password", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.ph,
              Image.asset("assets/images/confirm_password.png"),
              50.ph,
              TiteldTextFormField(
                title: "password".tr(),
                prefixIconPath: AppImages.passwordIcon,
                suffixIconPath: AppImages.showPasswordIcon,
                obscureText: false,
                validate: true,
                validateMsg: "required".tr(),
              ),
              20.ph,
              TiteldTextFormField(
                title: "confirm_password".tr(),
                prefixIconPath: AppImages.passwordIcon,
                suffixIconPath: AppImages.showPasswordIcon,
                obscureText: false,
                validate: true,
                validateMsg: "required".tr(),
              ),
              50.ph,
              Container(
                width: context.width * 0.9,
                height: context.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
