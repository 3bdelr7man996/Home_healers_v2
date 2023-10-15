import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared_widgets/activation_code_widgets.dart';
import 'confirm_password_screen.dart';

class ActivationCodeScreen extends StatefulWidget {
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    return Scaffold(
      appBar: customAppBar(context, title: "activation_code", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.ph,
              Image.asset("assets/images/activation_code.png"),
              40.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "كود التفعيل",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ],
              ),
              20.ph,
              Text(
                "من فضلك ادخل الكود المرسل الي البريد\nالالكتروني Example@gmail.com",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              30.ph,
              VerificationCodeForm(controllers: controllers),
              30.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ألم تتلقى الرمز ؟"),
                  5.pw,
                  Text(
                    "إعادة إرسال",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              30.ph,
              Container(
                width: context.width * 0.8,
                height: context.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    AppConstants.customNavigation(
                        context, ConfirmPasswordScreen(), -1, 0);
                  },
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
