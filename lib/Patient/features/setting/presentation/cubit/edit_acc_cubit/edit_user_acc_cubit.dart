import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_user_acc_state.dart';

class EditUserAccCubit extends Cubit<EditUserAccState> {
  EditUserAccCubit({required this.repository}) : super(EditUserAccState());
  final UpdateInfoRepo repository;

  List<CityData>? citiesList = [];

  onFullNameChange(String name) => emit(state.copyWith(fullName: name));
  onEmailChange(String email) => emit(state.copyWith(email: email));
  onNumberChange(String mobile) => emit(state.copyWith(mobile: mobile));
  onGenderChange(String gender) => emit(state.copyWith(gender: gender));
  onCityIdChange(CityData city) => emit(state.copyWith(city: city));
  // onimageChange(var img) => emit(state.copyWith(img: value));
  void pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(state.copyWith(img: File(pickedFile.path)));
      }
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  void initProfileData() {
    UserData userInfo = getUserInfo();
    emit(state.copyWith(
      userInfo: userInfo,
      avatar: userInfo.image,
      email: userInfo.email,
      fullName: userInfo.name,
      gender: userInfo.gender,
      mobile: userInfo.mobile,
      city: citiesList!.isNotEmpty
          ? citiesList?.firstWhere((city) => city.id == userInfo.cityId)
          : null,
    ));
  }

  ///get user info from local data
  UserData getUserInfo() {
    final String stringUser = CacheHelper.getData(key: AppStrings.userInfo);
    if (kDebugMode) {
      print(stringUser);
    }
    UserData user = UserData.fromJson(jsonDecode(stringUser));
    return user;
  }

  Future<void> UpdateInfoForUser(BuildContext context) async {
    emit(state.copyWith(updateState: RequestState.loading));
    List<File> images = [];
    if (state.img != null) images.add(state.img!);
    try {
      fieldsValidation();
      Map<String, String> body = {
        "name": "${state.fullName}",
        "mobile": "${state.mobile}",
        "email": "${state.userInfo?.email}",
        "gender": "${state.gender}",
        "city_id": "${state.city?.id}",
      };

      UserModel response =
          await repository.UpdateInfo(body: body, Files: images);
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
      await cacheData(context, userData: response.success);
      emit(state.copyWith(
        updateState: RequestState.success,
        userInfo: response.success,
      ));
      Navigator.pop(context);
      print(response);
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(updateState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.fullName == null || state.fullName!.isEmpty) {
      throw ("ادخل الاسم الكامل");
    }

    if (state.mobile == null || state.mobile!.isEmpty) {
      throw ("ادخل رقم الموبايل ");
    }
    if (state.city == null) {
      throw ("اختر المدينة");
    }
    if (state.gender == null || state.gender!.isEmpty) {
      throw ("حدد جنسك");
    }
  }

  /// save user data in local
  Future<void> cacheData(BuildContext? context,
      {required UserData? userData}) async {
    if (state.userInfo != null) {
      await CacheHelper.saveData(
          key: AppStrings.userInfo, value: jsonEncode(userData?.toJson()));

      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: false,
      );
    }
  }

  //?====================[  GET ALL CITIES & AREAS  ]====================
  Future<void> getAllCities() async {
    try {
      if (state.citiesList == null || state.citiesList == []) {
        emit(state.copyWith(citiesState: RequestState.loading));
        citiesList = [];
        citiesList = await repository.getCitiesArea();
        emit(state.copyWith(
          citiesList: citiesList,
          citiesState: RequestState.success,
        ));
        initProfileData();
      }
    } catch (e) {
      emit(state.copyWith(citiesState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
