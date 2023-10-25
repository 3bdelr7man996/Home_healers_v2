import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_widgets/forget_password_widgets.dart';

class ForgetPaswwordScreen extends StatefulWidget {
  const ForgetPaswwordScreen({super.key});

  @override
  State<ForgetPaswwordScreen> createState() => _ForgetPaswwordScreenState();
}

class _ForgetPaswwordScreenState extends State<ForgetPaswwordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "forget_password", backButton: true),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "نسيت كلمة السر ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ],
                ),
                20.ph,
                Text(
                  "في حالة نسيان كلمة السر يمكنك \n  الحصول عليها عن طريق البريد الالكتروني \n  او رقم الهاتف  الخاص بك",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                40.ph,
                Image.asset("assets/images/forget_password.png"),
                40.ph,
                TiteldTextFormField(
                  title: "email".tr(),
                  keyboardType: TextInputType.emailAddress,
                  prefixIconPath: AppImages.emailIcon,
                  validate: true,
                  validateMsg: "required".tr(),
                  onChanged: (p0) {
                    context.read<ForgetPasswordCubit>().onEmailChange(p0);
                  },
                ),
                20.ph,
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (state.loading == false) {
                          context
                              .read<ForgetPasswordCubit>()
                              .forgetPassword(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'إعادة تعيين كلمة المرور',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Container(
          height: context.height,
          child: PopUpForForgetPassword(),
        )
      ]),
    );
  }
}
