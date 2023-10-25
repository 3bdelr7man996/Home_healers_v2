import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                builder: (context, state) {
                  return TiteldTextFormField(
                    onSuffixTab: () =>
                        context.read<ResetPasswordCubit>().onShowPassChange(),
                    onChanged: (p0) {
                      context.read<ResetPasswordCubit>().onpasswordChange(p0);
                    },
                    title: "password".tr(),
                    prefixIconPath: AppImages.passwordIcon,
                    suffixIconPath: state.showNewPass
                        ? AppImages.hiddenPassIcon
                        : AppImages.showPasswordIcon,
                    obscureText: state.showNewPass ? false : true,
                    validate: true,
                    validateMsg: "required".tr(),
                  );
                },
              ),
              20.ph,
              BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                builder: (context, state) {
                  return TiteldTextFormField(
                    onSuffixTab: () => context
                        .read<ResetPasswordCubit>()
                        .onShowConfirmPassChange(),
                    onChanged: (p0) {
                      context
                          .read<ResetPasswordCubit>()
                          .onconfirmPasswordChange(p0);
                    },
                    title: "confirm_password".tr(),
                    prefixIconPath: AppImages.passwordIcon,
                    suffixIconPath: state.showConfirmPass
                        ? AppImages.hiddenPassIcon
                        : AppImages.showPasswordIcon,
                    obscureText: state.showConfirmPass ? false : true,
                    validate: true,
                    validateMsg: "required".tr(),
                  );
                },
              ),
              50.ph,
              BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                builder: (context, state) {
                  return Container(
                    width: context.width * 0.9,
                    height: context.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        state.loading
                            ? null
                            : context
                                .read<ResetPasswordCubit>()
                                .resetPass(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: state.loading
                            ? Colors.grey
                            : AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: state.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'تأكيد',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
