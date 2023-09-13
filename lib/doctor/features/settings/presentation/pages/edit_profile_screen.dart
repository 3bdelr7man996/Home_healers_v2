import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/bottom_sheet.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:dr/shared_widgets/gender_button.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/edit_widgets.dart';

import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context,
          backButton: true,
          title: "edit_setting".tr(),
          fromSetting: true,
        ),
        body: Column(
          children: [
            20.ph,
            const ProfileImage(),
            20.ph,
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TiteldTextFormField(
                            title: "first_name".tr(),
                            prefixIconPath: AppImages.personIcon,
                            validateMsg: "required".tr(),
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: TiteldTextFormField(
                              title: "last_name".tr(),
                              prefixIconPath: AppImages.personIcon,
                              validateMsg: "required".tr()),
                        ),
                      ],
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "email",
                      prefixIconPath: AppImages.emailIcon,
                      validateMsg: "required".tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "mobile_number".tr(),
                      prefixIconPath: AppImages.phoneIcon,
                      keyboardType: TextInputType.phone,
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "location",
                      prefixIconPath: AppImages.locationIcon,
                    ),
                    30.ph,
                    SizedBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "gender".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GenderButton(gender: "male", title: "male"),
                              GenderButton(gender: "female", title: "female")
                            ],
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "job_title".tr(),
                    ),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "section".tr(),
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "identification_number_residence".tr(),
                      prefixIconPath: AppImages.locationIcon,
                    ),
                    30.ph,
                    TiteldTextFormField(
                      title: "bank_account_number".tr(),
                      prefixIconPath: AppImages.locationIcon,
                    ),
                    30.ph,
                    SizedBox(
                      width: context.width,
                      height: context.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('save'.tr()),
                      ),
                    ),
                    30.ph,
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
