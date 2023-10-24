import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';
import 'package:dr/features/auth/data/repositories/reset_password_repo.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.repository}) : super(ResetPasswordState());
  final ResetPasswordRepo repository;

  //?====================[ SIGN IN USER ]===================
  Future<void> resetPass(BuildContext context) async {
    try {
      fieldsValidation();
      emit(state.copyWith(loading: true));

      ForgetPasswordModel? user = await repository.resetPassword(body: {
        "password": "${state.newPassword}",
        "activation_code":
            "${state.sixthTextFormFieldValue}${state.fifthTextFormFieldValue}${state.fourthTextFormFieldValue}${state.thirdTextFormFieldValue}${state.secondTextFormFieldValue}${state.firstTextFormFieldValue}",
        "email": "${state.email}"
      });
      print(user);

      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?====================[ Validations ]================
  void fieldsValidation() {
    if (state.email == null) {
      throw ("ادخل الايميل");
    }
    if (state.firstTextFormFieldValue == null ||
        state.secondTextFormFieldValue == null ||
        state.thirdTextFormFieldValue == null ||
        state.fourthTextFormFieldValue == null ||
        state.fifthTextFormFieldValue == null ||
        state.sixthTextFormFieldValue == null) {
      throw ("ادخل رمز التأكيد بالكامل");
    }
    if (state.newPassword == null) {
      throw ("ادخل كلمة السر");
    }
    if (state.confirmPass == null) {
      throw ("ادخل تأكيد كلمة السر");
    }
    if (state.newPassword != state.newPassword) {
      throw ("الرجاء المطابقة بين كلمة السر وتأكيد كلمة السر");
    }
  }

  //?====================[ ON CHANGE SECTION ]================
  onEmailChange(String email) => emit(state.copyWith(email: email));

  onShowPassChange() => emit(state.copyWith(showNewPass: !state.showNewPass));

  onShowConfirmPassChange() =>
      emit(state.copyWith(showConfirmPass: !state.showConfirmPass));

  onpasswordChange(String password) =>
      emit(state.copyWith(newPassword: password));

  onconfirmPasswordChange(String password) =>
      emit(state.copyWith(confirmPass: password));

  onTextFormFieldValueChange(var value, int i) {
    if (i == 0)
      emit(state.copyWith(firstTextFormFieldValue: value));
    else if (i == 1)
      emit(state.copyWith(secondTextFormFieldValue: value));
    else if (i == 2)
      emit(state.copyWith(thirdTextFormFieldValue: value));
    else if (i == 3)
      emit(state.copyWith(fourthTextFormFieldValue: value));
    else if (i == 4)
      emit(state.copyWith(fifthTextFormFieldValue: value));
    else
      emit(state.copyWith(sixthTextFormFieldValue: value));
  }
}
