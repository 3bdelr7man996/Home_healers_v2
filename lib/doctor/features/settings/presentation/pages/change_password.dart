import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/change_password_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isVisible = false;

  void _toggleVisibility() {
    print("asd");
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, fromSetting: true, title: "change_password"),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormFieldForChangePassword(
                    num: 4,
                    title: "old_password",
                    icon: AppImages.passwordIcon,
                  ),
                  5.ph,
                  Text(
                    "forget_your_password".tr(),
                    style: TextStyle(color: AppColors.primaryColor),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              30.ph,
              TextFormFieldForChangePassword(
                num: 4,
                title: "new_password",
                icon: AppImages.passwordIcon,
              ),
              20.ph,
              TextFormFieldForChangePassword(
                num: 4,
                title: "confirm_new_password",
                icon: AppImages.passwordIcon,
              ),
              70.ph,
              SizedBox(
                width: context.width,
                height: context.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _toggleVisibility();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('save'.tr()),
                ),
              ),
            ],
          ),
        ),
        PopUpForChangePassword(
          toggleVisibility: _toggleVisibility,
          isVisible: _isVisible,
        )
      ]),
    );
  }
}
