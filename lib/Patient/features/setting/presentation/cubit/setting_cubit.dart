import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/data/models/update_info_model.dart';
import 'package:dr/Patient/features/setting/data/models/update_reservation_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_info_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final MyOrdersRepo myOrdersRepo;

  MyOrdersCubit({required this.myOrdersRepo}) : super(MyOrdersState());

  Future<void> GetOrders(BuildContext context) async {
    try {
      MyOrdersModel response = await myOrdersRepo.GetMyOrders();
      emit(state.copyWith(AllOrders: response.data));

      print(response);
      var arrayForReviewing = [];
      var arrayForConfirmed = [];
      var arrayForWaitConfirmed = [];
      var arrayForPending = [];
      var arrayForCompleted = [];
      var arrayForCanceled = [];
      for (var order in response.data) {
        if (order.status == "reviewing") {
          arrayForReviewing.add(order);
        } else if (order.status == "confirmed") {
          arrayForConfirmed.add(order);
        } else if (order.status == "wait_confirm") {
          arrayForWaitConfirmed.add(order);
        } else if (order.status == "pending") {
          arrayForPending.add(order);
        } else if (order.status == "completed") {
          arrayForCompleted.add(order);
        } else {
          arrayForCanceled.add(order);
        }
      }
      emit(state.copyWith(ReviewingOrders: arrayForReviewing));
      emit(state.copyWith(ConfirmedOrders: arrayForConfirmed));
      emit(state.copyWith(WaitConfirmOrders: arrayForWaitConfirmed));
      emit(state.copyWith(PendingOrders: arrayForPending));
      emit(state.copyWith(CompletedOrders: arrayForCompleted));
      emit(state.copyWith(CanceledOrders: arrayForCanceled));
      print(state.ConfirmedOrders);
      print("asd");
      // print(state.ReviewingOrders);
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////
class UpdateReservationCubit extends Cubit<UpdateReservationState> {
  final UpdateReservationRepo updateReservationRepo;

  UpdateReservationCubit({required this.updateReservationRepo})
      : super(UpdateReservationState());

  //?==================== formFields change ====================
  onIdChange(String value) => emit(state.copyWith(id: value));
  onStartAtChange(String value) => emit(state.copyWith(start_at: value));
  onEndAtChange(String value) => emit(state.copyWith(end_at: value));
  onStatusChange(String value) => emit(state.copyWith(status: value));

  Future<void> updateSelectedReservation(BuildContext context) async {
    print(state.id);
    print(state.start_at);
    print(state.end_at);
    print(state.status);
    try {
      print(state.id);
      print(state.start_at);
      print(state.end_at);
      print(state.status);
      fieldsValidation();
      Map<String, dynamic> body = {
        "id": "${state.id}",
        "start_at": "${state.start_at}",
        "end_at": "${state.end_at}",
        "status": "${state.status}",
      };

      UpdateReservationModel response =
          await updateReservationRepo.updateReservation(body: body);
      context.read<MyOrdersCubit>().GetOrders(context);
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);

      emit(state.copyWith(showPoUp: true));
      print(response);
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////
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

  Future<void> UpdateInfoForUser(BuildContext context) async {
    List<File> images = [];
    if (state.image != null) images.add(state.image);
    print(images);
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
      emit(state.copyWith(email: ""));
      emit(state.copyWith(fullName: ""));
      emit(state.copyWith(mobile: ""));
      emit(state.copyWith(cityId: ""));
      emit(state.copyWith(gender: ""));
      await cacheData(response);
      Navigator.pop(context);
      print(response);
    } catch (e) {
      print(e.toString());
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

    print(jsonData);
    print("asdfasdf");

    // Save the updated jsonData object to the shared preferences
    CacheHelper.saveData(key: AppStrings.userInfo, value: jsonEncode(jsonData));
  });
}
