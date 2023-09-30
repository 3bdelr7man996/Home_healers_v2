import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:dr/shared_widgets/pop_up.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_sheet.dart';
import 'location_input.dart';
import 'signup_gender_row.dart';
import 'signup_have_acc_field.dart';
import 'signup_name_field.dart';
import 'signup_terms_field.dart';
import 'submit_button.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    15.0.ph,
                    Text(
                      "register_new_account".tr(),
                      style: titleStyle(),
                    ),
                    10.ph,
                    SizedBox(
                      width: context.width * 0.6,
                      child: Text(
                        "enjoy_many_advantages".tr(),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: bigBlackFont(fontWeight: FontWeight.w400),
                      ),
                    ),
                    60.ph,
                    const SignUpNameField(),
                    30.ph,
                    TiteldTextFormField(
                      title: "email".tr(),
                      keyboardType: TextInputType.emailAddress,
                      prefixIconPath: AppImages.emailIcon,
                      validate: true,
                      validateMsg: "required".tr(),
                      onChanged: (p0) =>
                          context.read<AuthCubit>().onEmailChange(p0),
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "mobile_number".tr(),
                      keyboardType: TextInputType.phone,
                      prefixIconPath: AppImages.phoneIcon,
                      validate: true,
                      validateMsg: "required".tr(),
                      onChanged: (p0) =>
                          context.read<AuthCubit>().onPhoneChange(p0),
                    ),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
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
                              context.read<AuthCubit>().onPassWordChange(p0),
                          onSuffixTab: () =>
                              context.read<AuthCubit>().showPassword(),
                        );
                      },
                    ),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.obscureConfPass != current.obscureConfPass,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          title: "confirm_password".tr(),
                          prefixIconPath: AppImages.passwordIcon,
                          suffixIconPath: state.obscureConfPass
                              ? AppImages.showPasswordIcon
                              : AppImages.hiddenPassIcon,
                          obscureText: state.obscureConfPass ? true : false,
                          validate: true,
                          validateMsg: "required".tr(),
                          onChanged: (p0) =>
                              context.read<AuthCubit>().onConfPassChange(p0),
                          onSuffixTab: () =>
                              context.read<AuthCubit>().showConfPassword(),
                        );
                      },
                    ),
                    30.ph,
                    LocationInput(),
                    30.ph,
                    const SignUpGenderField(),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "job_title".tr(),
                    ),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "section".tr(),
                    ),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "city".tr(),
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "identification_number_residence".tr(),
                      keyboardType: TextInputType.number,
                      validate: true,
                      validateMsg: "required".tr(),
                      onChanged: (p0) =>
                          context.read<AuthCubit>().onIdentificationChange(p0),
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "bank_account_number".tr(),
                      validate: true,
                      validateMsg: "required".tr(),
                      keyboardType: TextInputType.number,
                      onChanged: (p0) =>
                          context.read<AuthCubit>().onIbanChange(p0),
                    ),
                    30.ph,
                    const SignUpTermsField(),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state.registerState == RequestState.loading) {
                          return const CustomLoader(
                            padding: 0,
                          );
                        } else {
                          return ButtonForSignUp(
                              title: 'create_account'.tr(),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<AuthCubit>().signUpAdv();
                                }
                              });
                        }
                      },
                    ),
                    30.ph,
                    const SignUPHaveAccField(),
                    60.ph
                  ],
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return PopUp(
                  isVisible: state.showPopup,
                  rollSelected: 1,
                );
              },
            )
          ],
        ),
      ),
    ]);
  }
}
