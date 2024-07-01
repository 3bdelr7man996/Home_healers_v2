import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerficationForm extends StatelessWidget {
  const VerficationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: VerificationCode(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
        keyboardType: TextInputType.number,
        fullBorder: true,
        length: 6,
        clearAll:Container(padding: EdgeInsets.all(10.0),
        child: Text("مسح الرمز",style: TextStyle(color: Colors.grey),)) ,
        cursorColor: AppColors.primaryColor,
        onCompleted: (String code) {
          context.read<ForgetPasswordCubit>().onCodeChange(code);
        },
        onEditing: (bool value) {
          if (!value) FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
