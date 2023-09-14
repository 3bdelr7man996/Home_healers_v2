import 'package:dr/Patient/features/auth/presentation/widgets/sign_up_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/gender_button.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/submit_button.dart';
import 'package:dr/doctor/features/home/presentation/widgets/report_widgets.dart';
import 'package:dr/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_font.dart';

final formKey = GlobalKey<FormState>();

class SignUpForPatientScreen extends StatefulWidget {
  const SignUpForPatientScreen({super.key});

  @override
  State<SignUpForPatientScreen> createState() => _SignUpForPatientScreenState();
}

class _SignUpForPatientScreenState extends State<SignUpForPatientScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget build(BuildContext context) {
    bool _isChecked = false;

    return Scaffold(
      appBar: customAppBar(context),
      body: CustomScrollView(slivers: <Widget>[
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
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldForSignUpForPatient(
                            num: 1,
                            title: "first_name",
                            icon: AppImages.personIcon,
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: TextFormFieldForSignUpForPatient(
                            num: 2,
                            title: "last_name",
                            icon: AppImages.personIcon,
                          ),
                        ),
                      ],
                    ),
                    30.ph,
                    TextFormFieldForSignUpForPatient(
                      num: 3,
                      title: "email",
                      icon: AppImages.emailIcon,
                    ),
                    30.ph,
                    TextFormFieldForSignUpForPatient(
                      num: 8,
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
                              GenderButton(
                                  gender: "saudi", title: "saudi"), //todo
                              GenderButton(
                                  gender: "other_than_that",
                                  title: "other_than_that")
                            ],
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    TextFormFieldForSignUpForPatient(
                      num: 7,
                      title: "identification_number_residence",
                      icon: AppImages.locationIcon,
                    ),
                    30.ph,
                    TextFormFieldForSignUpForPatient(
                      num: 4,
                      title: "password",
                      icon: AppImages.passwordIcon,
                    ),
                    30.ph,
                    TextFormFieldForSignUpForPatient(
                      num: 5,
                      title: "confirm_password",
                      icon: AppImages.passwordIcon,
                    ),
                    30.ph,
                    ListTile(
                      leading: Checkbox(
                        value: _isChecked,
                        onChanged: (newValue) {},
                        activeColor: AppColors.primaryColor,
                      ),
                      title: Text(
                        'terms'.tr(),
                        style: const TextStyle(
                            color: AppColors.primaryColor, fontSize: 13),
                      ),
                    ),
                    30.ph,
                    ButtonForSignUp(
                      onPressed: () {
                        //todo
                      },
                    ),
                    30.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("do_you_have_account".tr()),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return SignInScreen(
                                    rollSelected: 0,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "sign_in".tr(),
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    60.ph
                  ],
                ),
              ),
              PopUp(
                toggleVisibility: _toggleVisibility,
                isVisible: _isVisible,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
