import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/auth/presentation/widgets/sign_up_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/sign_up/submit_button.dart';
import 'package:dr/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:dr/shared_widgets/pop_up.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_font.dart';

class SignUpForPatientScreen extends StatefulWidget {
  const SignUpForPatientScreen({super.key});

  @override
  State<SignUpForPatientScreen> createState() => _SignUpForPatientScreenState();
}

class _SignUpForPatientScreenState extends State<SignUpForPatientScreen> {
  Widget build(BuildContext context) {
    bool Request = context
        .select((AuthCubitForPatient cubit) => cubit.state.requestStatus);
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
                    SizedBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "choose_nationality".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GenderButtonForSignUpForPatient(
                                gender: "male",
                                title: "male",
                              ), //todo
                              GenderButtonForSignUpForPatient(
                                gender: "female",
                                title: "female",
                              )
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
                    LocationInput(),
                    30.ph,
                    BottomSheetForSignUP(
                      title: "select_city".tr(),
                    ),
                    30.ph,
                    SizedBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "رمز المدينة",
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectCityButtonForSignUpForPatient(
                                value: "SA",
                                title: "SA",
                              ), //todo
                              SelectCityButtonForSignUpForPatient(
                                value: "Any",
                                title: "غير ذلك",
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    SizedBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "choose_nationality".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              nationalityButtonForSignUpForPatient(
                                value: "SA",
                                title: "SA",
                              ), //todo
                              nationalityButtonForSignUpForPatient(
                                value: "Any",
                                title: "غير ذلك",
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    BirthdayPicker(),
                    30.ph,
                    ListTile(
                      leading: Checkbox(
                        value: context.select(
                            (AuthCubitForPatient cubit) => cubit.state.term),
                        onChanged: (newValue) {
                          context
                              .read<AuthCubitForPatient>()
                              .onTermChange(newValue);
                        },
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
                      onPressed: () async {
                        Request
                            ? null
                            : await context
                                .read<AuthCubitForPatient>()
                                .signUpPatient(context);
                      },
                      title: 'create_account'.tr(),
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
              PopUpDialog(
                isVisible: context.select(
                    (AuthCubitForPatient cubit) => cubit.state.isVisible),
                rollSelected: 0,
              )
              // PopUp(
              //   rollSelected: 0,
              //   toggleVisibility: () {},
              //   isVisible: context.select(
              //       (AuthCubitForPatient cubit) => cubit.state.isVisible),
              // )
            ],
          ),
        ),
      ]),
    );
  }
}
