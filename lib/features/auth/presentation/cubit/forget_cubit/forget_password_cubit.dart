import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/http_custom_exception.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/features/auth/data/models/activation_model.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';
import 'package:dr/features/auth/data/repositories/forget_password_repo.dart';
import 'package:dr/shared_widgets/forget_password_dialog.dart';
import 'package:dr/shared_widgets/pop_up.dart';
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
      emit(state.copyWith(
        showPopUp: !state.showPopUp!,
        loading: false,
      ));
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopUpForForgetPassword(),
      );
      ShowToastHelper.showToast(msg: user!.message, isError: false);
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
    Function? cacheData,
  }) async {
    try {
      emit(state.copyWith(activeState: RequestState.loading));
      ActivationModel? response = await repository.activateAccount(body: {
        'email': '$email',
        'activation_code': '$code',
      });
      if (response?.success == true) {
        if (cacheData != null) {
          cacheData();
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
        ShowToastHelper.showToast(
          msg: response?.message ?? "تم التأكيد",
          isError: false,
        );
        emit(state.copyWith(activeState: RequestState.success));
      } else {
        ShowToastHelper.showToast(
          msg: response?.message ?? "فشل التأكيد",
          isError: true,
        );
        emit(state.copyWith(activeState: RequestState.failed));
      }
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
}
