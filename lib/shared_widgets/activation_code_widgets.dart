import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:dr/features/auth/presentation/cubit/reset_pass_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeForm extends StatelessWidget {
  const VerificationCodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email =
        context.select((ForgetPasswordCubit cubit) => cubit.state.email);
    context.read<ResetPasswordCubit>().onEmailChange(email!);
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 6; i++)
            Container(
              width: 50,
              height: 50,
              child: TextFormField(
                onChanged: (value) {
                  context
                      .read<ResetPasswordCubit>()
                      .onTextFormFieldValueChange(value, i);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.all(10.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
