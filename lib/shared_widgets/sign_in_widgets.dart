import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      child: TextFormField(
        controller: _controller,
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
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: context.width * 0.01),
          ),
        ),
        validator: (value) {
          if (num == 1) {
            if (value!.isEmpty) {
              return "field_is_empty".tr();
            } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w]{2,4}')
                .hasMatch(value)) {
              return "email_not_correct".tr();
            } else {}
            return null;
          } else {
            if (value!.isEmpty) {
              return "field_is_empty".tr();
            } else if (value.length < 5) {
              return "password_must_be_more_than_5".tr();
            } else {
              return null;
            }
          }
        },
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignInButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {}
      },
      child: Text(
        "sign_in".tr(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
