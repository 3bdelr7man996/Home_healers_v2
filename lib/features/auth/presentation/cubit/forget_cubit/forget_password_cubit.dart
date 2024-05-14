// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_custom_exception.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/features/auth/data/models/activation_model.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';
import 'package:dr/features/auth/data/repositories/forget_password_repo.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/shared_widgets/forget_password_dialog.dart';
import 'package:dr/shared_widgets/pop_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(state.copyWith(
        showPopUp: !state.showPopUp!,
        loading: false,
      ));
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopUpForForgetPassword(email: state.email ?? ''),
        builder: (context) => PopUpForForgetPassword(email: state.email ?? ''),
      );
      //ShowToastHelper.showToast(msg: user!.message, isError: false);
    } on UnauthorisedException catch (e) {
      if (e.toString().contains("Email not found")) {
        ShowToastHelper.showToast(msg: "هذا الحساب غير موجود", isError: true);
      } else {
        ShowToastHelper.showToast(msg: e.toString(), isError: true);
      }
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

  //?====================[ ACTIVATE ACCOUNT ]==================================

  Future<void> activateAccount(
    BuildContext context, {
    required String email,
    required String code,
    required bool isAdvertise,
    Function({BuildContext? context})? cacheData,
    bool fromForgetPass = false,
  }) async {
    try {
      emit(state.copyWith(activeState: RequestState.loading));
      ActivationModel? response = await repository.activateAccount(body: {
        'email': '$email',
        'activation_code': '$code',
      });
      if (response?.success == true) {
        if (cacheData != null) {
          cacheData(context: context);
          if (!fromForgetPass) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return PopUpDialog(
                  isAdvertise: isAdvertise,
                );
              },
            );
          }
        }
        // ShowToastHelper.showToast(
        //   msg: response?.message ?? "تم التأكيد",
        //   isError: false,
        // );
        emit(state.copyWith(activeState: RequestState.success));
      } else {
        ShowToastHelper.showToast(
          msg: response?.message ?? "فشل التأكيد",
          isError: true,
        );
        emit(state.copyWith(activeState: RequestState.failed));
      }
    } on BadRequestException {
      ShowToastHelper.showToast(
        msg: "الكود الذي ادخلته غير صحيح",
        isError: true,
      );
      emit(state.copyWith(activeState: RequestState.failed));
    } catch (e) {
      ShowToastHelper.showToast(
        msg: e.toString(),
        isError: true,
      );
      emit(state.copyWith(activeState: RequestState.failed));
    }
  }

  onCodeChange(String code) {
    emit(state.copyWith(code: code));
  }

  Future<void> resendCode({required String email}) async {
    try {
      emit(state.copyWith(resendCodeState: RequestState.loading));
      String? response = await repository.resendCode(body: {'email': '$email'});
      emit(state.copyWith(resendCodeState: RequestState.success));
      ShowToastHelper.showToast(
        msg: response ?? 'تم ارسال الكود الي البريد الالكتروني',
        isError: false,
      );
    } catch (e) {
      emit(state.copyWith(resendCodeState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?============================[RESET PASSWORD]======================================
  Future<void> resetPass(BuildContext context) async {
    try {
      resetFieldsValid();
      emit(state.copyWith(loading: true));

      ForgetPasswordModel? user = await repository.resetPassword(body: {
        "password": "${state.newPassword}",
        "activation_code": "${state.code}",
        "email": "${state.email}"
      });
      print(user);
      emit(state.copyWith(loading: false));
      context.read<LoginCubit>().logOut();
      AppConstants.pushRemoveNavigator(context, screen: SelectRollForSignIn());
    } catch (e) {
      emit(state.copyWith(loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  onShowPassChange() => emit(state.copyWith(showPass: !state.showPass));

  onpasswordChange(String password) =>
      emit(state.copyWith(newPassword: password));

  onconfirmPasswordChange(String password) =>
      emit(state.copyWith(confPassword: password));

  void resetFieldsValid() {
    if (state.newPassword == null) {
      throw ("ادخل كلمة السر");
    }
    if (state.confPassword == null) {
      throw ("ادخل تأكيد كلمة السر");
    }
    if (state.newPassword != state.confPassword) {
      throw ("الرجاء المطابقة بين كلمة السر وتأكيد كلمة السر");
    }
  }
}
