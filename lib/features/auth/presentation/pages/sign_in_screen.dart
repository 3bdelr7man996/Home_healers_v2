import 'package:dr/Patient/features/auth/presentation/pages/sign_up_for_patient_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit.dart';
import 'package:dr/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:dr/shared_widgets/submit_button.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  final int rollSelected;
  const SignInScreen({super.key, required this.rollSelected});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    40.ph,
                    Text(
                      "welcome_back".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.06,
                      ),
                    ),
                    Text(
                      "enter_email_and_password".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                    40.ph,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: context.width * 0.01,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: Image.asset("assets/images/logIn.png"),
                    ),
                    40.ph,
                    TiteldTextFormField(
                      title: "email".tr(),
                      keyboardType: TextInputType.emailAddress,
                      prefixIconPath: AppImages.emailIcon,
                      validate: true,
                      validateMsg: "required".tr(),
                      onChanged: (p0) =>
                          context.read<LoginCubit>().onEmailChange(p0),
                    ),
                    20.ph,
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.obscurePass != current.obscurePass,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          title: "password".tr(),
                          prefixIconPath: AppImages.passwordIcon,
                          suffixIconPath: state.obscurePass
                              ? AppImages.showPasswordIcon
                              : AppImages.hiddenPassIcon,
                          obscureText: state.obscurePass ? true : false,
                          validate: true,
                          validateMsg: "required".tr(),
                          onChanged: (p0) =>
                              context.read<LoginCubit>().onPasswordChange(p0),
                          onSuffixTab: () =>
                              context.read<LoginCubit>().showPassword(),
                        );
                      },
                    ),
                    5.ph,
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.05),
                      child: SizedBox(
                        width: context.width,
                        child: InkWell(
                          onTap: () {
                            AppConstants.customNavigation(
                                context, ForgetPaswwordScreen(), -1, 0);
                          },
                          child: Text(
                            "forget_your_password".tr(), //todo
                            style: const TextStyle(color: Color(0xFF37D2F4)),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                    40.ph,
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state.loginState == RequestState.loading) {
                          return const CustomLoader(
                            padding: 0,
                          );
                        } else {
                          return SubmitButton(
                              title: "sign_in".tr(),
                              backGroundColor: (state.email != null &&
                                      state.email!.isNotEmpty &&
                                      state.password != null &&
                                      state.password!.isNotEmpty)
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context
                                      .read<LoginCubit>()
                                      .userLogin(context);
                                }
                              });
                        }
                      },
                    ),
                    20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            AppConstants.customNavigation(
                                context,
                                widget.rollSelected == 1
                                    ? const SignUpScreen()
                                    : const SignUpForPatientScreen(),
                                0,
                                1);
                          },
                          child: Text(
                            "register_new_account".tr(),
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                        Text("do_you_have_account".tr()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
