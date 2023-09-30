import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleForTextFormField extends StatelessWidget {
  const TitleForTextFormField({super.key, required String title})
      : _title = title;

  final String? _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.width * 0.05),
      child: Container(
        width: context.width,
        child: Text(
          _title!.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.width * 0.05,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFieldForLogIn extends StatelessWidget {
  final int num;

  TextFormFieldForLogIn({super.key, required this.num});

  // TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      child: TextFormField(
        obscureText: num == 1
            ? false
            : !context.select(
                (SignInCubitForPatient cubit) => cubit.state.showPassword),
        // controller: _controller,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.right,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText:
              num == 1 ? "enter_your_email".tr() : "enter_your_password".tr(),
          suffixIcon:
              num == 1 ? const Icon(Icons.email) : const Icon(Icons.lock),
          prefixIcon: num == 1
              ? null
              : context.select(
                      (SignInCubitForPatient cubit) => cubit.state.showPassword)
                  ? IconButton(
                      onPressed: () {
                        context
                            .read<SignInCubitForPatient>()
                            .onShowPasswordChange();
                      },
                      icon: const Icon(Icons.visibility_off),
                    )
                  : IconButton(
                      onPressed: () {
                        context
                            .read<SignInCubitForPatient>()
                            .onShowPasswordChange();
                      },
                      icon: const Icon(Icons.visibility),
                    ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: context.width * 0.01),
          ),
        ),
        onChanged: (value) {
          if (num == 1)
            context.read<SignInCubitForPatient>().onEmailChange(value);
          else
            context.read<SignInCubitForPatient>().onPassWordChange(value);
        },
        // validator: (value) {
        //   if (num == 1) {
        //     if (value!.isEmpty) {
        //       return "field_is_empty".tr();
        //     } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w]{2,4}')
        //         .hasMatch(value)) {
        //       return "email_not_correct".tr();
        //     } else {}
        //     return null;
        //   } else {
        //     if (value!.isEmpty) {
        //       return "field_is_empty".tr();
        //     } else if (value.length < 5) {
        //       return "password_must_be_more_than_5".tr();
        //     } else {
        //       return null;
        //     }
        //   }
        // },
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignInButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    bool Request = context
        .select((SignInCubitForPatient cubit) => cubit.state.requestStatus);
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.width * 0.03),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 50),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            Request ? Colors.grey : AppColors.primaryColor),
      ),
      onPressed: () async {
        Request
            ? null
            : await context
                .read<SignInCubitForPatient>()
                .SignInPatient(context);
      },
      child: Request
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              "sign_in".tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
