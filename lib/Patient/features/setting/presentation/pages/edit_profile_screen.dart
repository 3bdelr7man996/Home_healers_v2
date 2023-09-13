import 'package:dr/Patient/features/setting/presentation/widgets/edit_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileScreenForPatient extends StatefulWidget {
  const EditProfileScreenForPatient({Key? key}) : super(key: key);

  @override
  State<EditProfileScreenForPatient> createState() =>
      _EditProfileScreenForPatientState();
}

class _EditProfileScreenForPatientState
    extends State<EditProfileScreenForPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context,
          backButton: true,
          title: "edit_setting",
        ),
        body: Column(
          children: [
            20.ph,
            ProfileImageForPatient(),
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
                          child: TextFormFieldForSignUp(
                            num: 1,
                            title: "first_name",
                            icon: AppImages.personIcon,
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: TextFormFieldForSignUp(
                            num: 2,
                            title: "last_name",
                            icon: AppImages.personIcon,
                          ),
                        ),
                      ],
                    ),
                    30.ph,
                    TextFormFieldForSignUp(
                      num: 3,
                      title: "email",
                      icon: AppImages.emailIcon,
                    ),
                    30.ph,
                    TextFormFieldForSignUp(
                      num: 2,
                      title: "mobile_number",
                      icon: AppImages.phoneIcon,
                    ),
                    30.ph,
                    Container(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "choose_nationality".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GenderButton(num: 1, title: "saudi"),
                              GenderButton(num: 2, title: "other_than_that")
                            ],
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    TextFormFieldForSignUp(
                      num: 6,
                      title: "location",
                      icon: AppImages.locationIcon,
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
