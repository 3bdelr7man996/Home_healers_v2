import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';
import 'package:dr/features/auth/data/repositories/forget_password_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.repository})
      : super(ForgetPasswordState());
  final ForgetPasswordRepo repository;

  //?====================[ SIGN IN USER ]===================
  Future<void> forgetPassword(BuildContext context) async {
    try {
      fieldsValidation();
      emit(state.copyWith(loading: true));

      ForgetPasswordModel? user =
          await repository.forgetPassword(body: {"email": "${state.email}"});
      print(user);
      emit(state.copyWith(showPopUp: !state.showPopUp!));

      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: user!.message, isError: false);
    } catch (e) {
      emit(state.copyWith(loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?====================[ Validations ]================
  void fieldsValidation() {
    emit(state.copyWith(loading: !state.loading!));

    if (state.email == null) {
      throw ("ادخل الايميل");
    }
  }

  //?====================[ ON CHANGE SECTION ]================
  onEmailChange(String email) => emit(state.copyWith(email: email));
  onShowPopUpChange() => emit(state.copyWith(showPopUp: !state.showPopUp));
}
