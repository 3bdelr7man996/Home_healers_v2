import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/bottom_sheet.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/location_input.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/signup_gender_row.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/signup_name_field.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/submit_button.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_img.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
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
                    15.ph,
                    const ProfileImg(),
                    60.ph,
                    const SignUpNameField(),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.email != current.email ||
                          previous.advertiser != current.advertiser,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          title: "email".tr(),
                          initialValue: state.advertiser?.email,
                          keyboardType: TextInputType.emailAddress,
                          prefixIconPath: AppImages.emailIcon,
                          validate: true,
                          validateMsg: "required".tr(),
                          onChanged: (p0) =>
                              context.read<AuthCubit>().onEmailChange(p0),
                        );
                      },
                    ),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.phone != current.phone ||
                          previous.advertiser != current.advertiser,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          title: "mobile_number".tr(),
                          initialValue: state.advertiser?.mobile,
                          keyboardType: TextInputType.phone,
                          prefixIconPath: AppImages.phoneIcon,
                          validate: true,
                          validateMsg: "required".tr(),
                          onChanged: (p0) =>
                              context.read<AuthCubit>().onPhoneChange(p0),
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
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.identification != current.identification ||
                          previous.advertiser != current.advertiser,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          //todo
                          title: "identification_number_residence".tr(),
                          initialValue: state.advertiser?.nationalId,
                          keyboardType: TextInputType.number,
                          validate: true,
                          validateMsg: "required".tr(),
                          onChanged: (p0) => context
                              .read<AuthCubit>()
                              .onIdentificationChange(p0),
                        );
                      },
                    ),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.iban != current.iban ||
                          previous.advertiser != current.advertiser,
                      builder: (context, state) {
                        return TiteldTextFormField(
                          title: "bank_account_number".tr(),
                          initialValue: state.advertiser?.iban,
                          validate: true,
                          validateMsg: "required".tr(),
                          keyboardType: TextInputType.number,
                          onChanged: (p0) =>
                              context.read<AuthCubit>().onIbanChange(p0),
                        );
                      },
                    ),
                    // 30.ph,
                    // const SignUpTermsField(),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state.registerState == RequestState.loading) {
                          return const CustomLoader(
                            padding: 0,
                          );
                        } else {
                          return ButtonForSignUp(
                              title: "save".tr(),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context
                                      .read<AuthCubit>()
                                      .updateProfile();
                                }
                              });
                        }
                      },
                    ),

                    60.ph
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
