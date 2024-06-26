import 'dart:convert';
import 'dart:developer';

import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/config/notifications_config/firebase_messages.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/http_custom_exception.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:dr/features/auth/data/repositories/login_repo.dart';
import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:dr/features/auth/presentation/pages/activate_account.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dr/di_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(const LoginState());
  final LoginRepo repository;
  //?===================[ LOG OUT ]======================
  void logOut() {
    if (CacheHelper.dataSaved(key: AppStrings.userToken)) {
      CacheHelper.clearData(key: AppStrings.userInfo);
      CacheHelper.clearData(key: AppStrings.userToken);
      CacheHelper.clearData(key: AppStrings.isAdvertise);
      FirebaseMessaging.instance.deleteToken();
      FirebaseAnalyticUtil.logLogoutEvent();
    }
  }

  //?===========================[ SIGN IN USER ]================================
  UserModel? user;
  Future<void> userLogin(BuildContext context) async {
    try {
      emit(state.copyWith(loginState: RequestState.loading));
      user = await repository.userLogin(body: {
        "email": "${state.email}",
        "password": "${state.password}",
        "fcm_token":
            await di.sl<FirebaseMessagingService>().getFirebaseToken() ?? ""
      });
      bool isAdvertise = user?.success?.advertiser?.id != null;
      if ((!isAdvertise && user?.success?.activated == 0) ||
          (isAdvertise && user?.success?.advertiser?.activated == 0)) {
        emit(state.copyWith(loginState: RequestState.success));
        FirebaseAnalyticUtil.logLogin();
        context
            .read<ForgetPasswordCubit>()
            .resendCode(email: user?.success?.email ?? '');
        AppConstants.customNavigation(
            context,
            ActivateAccountScreen(
              email: user?.success?.email ?? '',
              isAdvertise: isAdvertise,
              cacheData: cacheData,
            ),
            0,
            0);
      } else {
        await cacheData();
        emit(state.copyWith(loginState: RequestState.success));
        FirebaseAnalyticUtil.logLogin();
        if (isAdvertise) {
          if (context.mounted) {
            AppConstants.pushRemoveNavigator(
              context,
              screen: const HomeScreen(
                selectedIndex: 0,
              ),
            );
          }
        } else {
          if (context.mounted) {
            AppConstants.pushRemoveNavigator(
              context,
              screen: HomeScreenForPatient(selectedIndex: 2),
            );
          }
        }
      }
    } on UnauthorisedException {
      emit(state.copyWith(loginState: RequestState.failed));
      ShowToastHelper.showToast(
          msg: "تأكد من البريد و الباسورد", isError: true);
    } catch (e) {
      emit(state.copyWith(loginState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  /// save user data in local
  Future<void> cacheData({BuildContext? context}) async {
    if (user?.success?.advertiser?.email != null) {
      //log("${user?.success?.advertiser?.toJson()}");
      await CacheHelper.saveData(
          key: AppStrings.userInfo,
          value: jsonEncode(user?.success?.advertiser?.toJson()));
      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: true,
      );
    } else {
      log("else patient login ======");
      await CacheHelper.saveData(
          key: AppStrings.userInfo, value: jsonEncode(user?.success?.toJson()));
      await CacheHelper.saveData(
        key: AppStrings.userId,
        value: user?.success?.id,
      );
      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: false,
      );
    }
    if (user?.success?.token != null) {
      log("saveTokkken ");
      await CacheHelper.saveData(
        key: AppStrings.userToken,
        value: user?.success?.token,
      );
      di.sl<ApiBaseHelper>().updateHeader();
    }
  }

  initData() {
    emit(state.copyWith(
      email: "",
      password: "",
      obscurePass: true,
      loginState: RequestState.initial,
    ));
  }

  //?=========================[ ON CHANGE SECTION ]=============================
  onEmailChange(String email) => emit(state.copyWith(email: email));
  onPasswordChange(String password) => emit(state.copyWith(password: password));
  showPassword() => emit(state.copyWith(obscurePass: !state.obscurePass));
  //?=========================[  GET LOCAL USER DATA]===========================
  ///get user info from local data
  Map<String, dynamic> userInfo() {
    final String stringUser = CacheHelper.getData(key: AppStrings.userInfo);
    if (kDebugMode) {
      print(stringUser);
    }
    Map<String, dynamic> user = jsonDecode(stringUser);
    return user;
  }

  ///convert user info from map to Advertiser model or user data model
  dynamic getAdvertiserInfo() {
    Map<String, dynamic> info = userInfo();
    print(info['city_id'].runtimeType);
    print("===========================================");
    if (info['advertiser'] != null) {
      return Advertiser.fromJson(info);
    }
    return UserData.fromJson(info);
  }

  /// check if user login or not
  bool hasToken() {
    final String token = CacheHelper.getData(key: AppStrings.userToken) ?? "";
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //?===========================[ DELETE ACCOUNT ]==============================
  Future<void> deleteAcc(BuildContext context) async {
    try {
      emit(state.copyWith(deleteState: RequestState.loading));
      log("USer Id is ${getAdvertiserInfo().id}");
      await repository.deleteAcc(userId: getAdvertiserInfo().id);
      logOut();
      Navigator.of(context).pop();
      AppConstants.pushRemoveNavigator(context, screen: SelectRollForSignIn());
      emit(state.copyWith(deleteState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(deleteState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
