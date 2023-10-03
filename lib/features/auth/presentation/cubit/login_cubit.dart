import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:dr/features/auth/data/repositories/login_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(const LoginState());
  final LoginRepo repository;
  //?===================[ LOG OUT ]======================
  void logOut() {
    CacheHelper.clearData(key: AppStrings.userInfo);
    CacheHelper.clearData(key: AppStrings.userToken);
    CacheHelper.clearData(key: AppStrings.isAdvertise);
  }

  //?====================[ SIGN IN USER ]===================
  Future<void> userLogin(BuildContext context) async {
    try {
      emit(state.copyWith(loginState: RequestState.loading));
      UserModel? user = await repository.userLogin(body: {
        "email": "${state.email}",
        "password": "${state.password}",
        "fcm_token": "" //todo
      });
      print(user);
      print("aaaaaaaaaaaaaaaaaaaaa");
      await cacheData(user);
      emit(state.copyWith(loginState: RequestState.success));
      print(user?.success?.advertiser?.firstnameAr);
      if (user?.success?.advertiser?.id != null) {
        if (context.mounted) {
          print("1");

          AppConstants.pushRemoveNavigator(
            context,
            screen: const HomeScreen(
              selectedIndex: 0,
            ),
          );
        }
      } else {
        print("2");
        AppConstants.customNavigation(
            context, HomeScreenForPatient(selectedIndex: 2), -1, 0);
      }
    } catch (e) {
      emit(state.copyWith(loginState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  /// save user data in local
  Future<void> cacheData(UserModel? response) async {
    if (response?.success?.advertiser?.email != null) {
      log("this advertiser ==========${response?.success?.advertiser?.email}");
      await CacheHelper.saveData(
          key: AppStrings.userInfo,
          value: jsonEncode(response?.success?.advertiser?.toJson()));
      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: true,
      );
    } else {
      await CacheHelper.saveData(
          key: AppStrings.userInfo,
          value: jsonEncode(response?.success?.toJson()));

      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: false,
      );
    }
    if (response?.success?.token != null) {
      await CacheHelper.saveData(
        key: AppStrings.userToken,
        value: response?.success?.token,
      );
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

  //?====================[ ON CHANGE SECTION ]================
  onEmailChange(String email) => emit(state.copyWith(email: email));
  onPasswordChange(String password) => emit(state.copyWith(password: password));
  showPassword() => emit(state.copyWith(obscurePass: !state.obscurePass));
}
