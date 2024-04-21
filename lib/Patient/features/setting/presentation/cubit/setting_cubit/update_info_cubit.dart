import 'dart:convert';
import 'dart:io';

import 'package:dr/Patient/features/setting/data/models/update_info_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/update_info_state.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  final UpdateInfoRepo UpdateInfo;

  UpdateInfoCubit({required this.UpdateInfo}) : super(UpdateInfoState());

  //?==================== formFields change ====================
  onFullNameChange(String value) => emit(state.copyWith(fullName: value));
  onEmailChange(String value) => emit(state.copyWith(email: value));
  onNumberChange(String value) => emit(state.copyWith(mobile: value));
  onGenderChange(String value) => emit(state.copyWith(gender: value));
  onCityIdChange(String value) => emit(state.copyWith(cityId: value));
  onimageChange(var value) => emit(state.copyWith(image: value));
  oncitySelectedChange(var value) => emit(state.copyWith(citySelected: value));

  Future<void> UpdateInfoForUser(BuildContext context) async {
    List<File> images = [];
    if (state.image != null) images.add(state.image);
    try {
      fieldsValidation();
      Map<String, String> body = {};
      if (state.fullName != null && !state.fullName!.isEmpty) {
        body['name'] = state.fullName!;
      }
      if (state.mobile != null && !state.mobile!.isEmpty) {
        body['mobile'] = state.mobile!;
      }
      if (state.email != null && !state.email!.isEmpty) {
        body['email'] = state.email!;
      }
      if (state.gender != null && !state.gender!.isEmpty) {
        body['gender'] = state.gender!;
      }
      if (state.cityId != null && !state.cityId!.isEmpty) {
        body['city_id'] = state.cityId!;
      }

      UpdateInfoModel response =
          await UpdateInfo.UpdateInfo(body: body, Files: images);
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
      emit(state.copyWith(
          gender: "", cityId: "", email: "", mobile: "", fullName: ""));

      await cacheData(response);
      Navigator.pop(context);
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.fullName == null || state.fullName!.isEmpty) {
      throw ("ادخل الاسم الكامل");
    }
    if (state.email == null || state.email!.isEmpty) {
      throw ("ادخل الإيميل ");
    }
    if (state.mobile == null || state.mobile!.isEmpty) {
      throw ("ادخل رقم الموبايل ");
    }
    if (state.cityId == null || state.cityId!.isEmpty) {
      throw ("اختر المدينة");
    }
    if (state.gender == null || state.gender!.isEmpty) {
      throw ("حدد جنسك");
    }
  }
}

Future<void> cacheData(UpdateInfoModel response) async {
  var userInfo;
  var jsonData;
  getAttributeFromSharedPreferences().then((value) {
    userInfo = value;
    jsonData = jsonDecode(userInfo);

    // Change the value of email
    jsonData["name"] = response.success.name;
    jsonData["city_id"] = response.success.cityId;
    jsonData["email"] = response.success.email;
    jsonData["image"] = response.success.image;
    jsonData["mobile"] = response.success.mobile;
    jsonData["gender"] = response.success.gender;

    // Save the updated jsonData object to the shared preferences
    CacheHelper.saveData(key: AppStrings.userInfo, value: jsonEncode(jsonData));
  });
}
