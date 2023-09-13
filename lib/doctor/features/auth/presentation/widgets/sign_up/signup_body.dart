import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';
import 'location_input.dart';
import 'signup_gender_row.dart';
import 'signup_have_acc_field.dart';
import 'signup_name_field.dart';
import 'signup_terms_field.dart';
import 'submit_button.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                    validateMsg: "required".tr(),
                  ),
                  30.ph,
                  TiteldTextFormField(
                    title: "password".tr(),
                    prefixIconPath: AppImages.passwordIcon,
                    suffixIconPath:
                        AppImages.showPasswordIcon, //AppImages.hiddenPassIcon
                    obscureText: true,
                    validateMsg: "required".tr(),
                  ),
                  30.ph,
                  TiteldTextFormField(
                    title: "confirm_password".tr(),
                    prefixIconPath: AppImages.passwordIcon,
                    suffixIconPath:
                        AppImages.showPasswordIcon, //AppImages.hiddenPassIcon
                    obscureText: true,
                    validateMsg: "required".tr(),
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
                    prefixIconPath: AppImages.locationIcon,
                    keyboardType: TextInputType.number,
                  ),
                  30.ph,
                  TiteldTextFormField(
                    title: "bank_account_number".tr(),
                    prefixIconPath: AppImages.locationIcon,
                    validateMsg: "required".tr(),
                    keyboardType: TextInputType.number,
                  ),
                  30.ph,
                  const SignUpTermsField(),
                  30.ph,
                  ButtonForSignUp(
                    isVisible: false, //todo
                    toggleVisibility: () {}, //todo
                  ),
                  30.ph,
                  const SignUPHaveAccField(),
                  60.ph
                ],
              ),
            ),
            // PopUp(
            //   toggleVisibility: () {
            //     //todo
            //   },
            //   isVisible: true, //todo
            //   rollSelected: 1,
            // ),
          ],
        ),
      ),
    ]);
  }
}
