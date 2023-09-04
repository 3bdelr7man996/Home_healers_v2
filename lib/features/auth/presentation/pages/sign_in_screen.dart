import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:dr/shared_widgets/sign_in_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
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
                  const TitleForTextFormField(title: "email"),
                  5.ph,
                  TextFormFieldForLogIn(num: 1),
                  20.ph,
                  const TitleForTextFormField(title: "password"),
                  5.ph,
                  TextFormFieldForLogIn(num: 2),
                  5.ph,
                  Padding(
                    padding: EdgeInsets.only(left: context.width * 0.05),
                    child: Container(
                      width: context.width,
                      child: Text(
                        "forget_your_password".tr(),
                        style: TextStyle(color: Color(0xFF37D2F4)),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  40.ph,
                  SizedBox(
                    width: context.width * 0.9,
                    child: SignInButton(
                      formKey: formKey,
                    ),
                  ),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                    begin: const Offset(0, -1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "register_new_account".tr(),
                          style: const TextStyle(color: AppColors.primaryColor),
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
    );
  }
}
