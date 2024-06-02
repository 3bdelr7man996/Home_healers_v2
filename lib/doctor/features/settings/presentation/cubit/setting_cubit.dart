import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/settings/data/models/app_info_model.dart';
import 'package:dr/doctor/features/settings/data/models/change_password_model.dart';
import 'package:dr/doctor/features/settings/data/models/doctor_points_model.dart';
import 'package:dr/doctor/features/settings/data/models/status_model.dart';
import 'package:dr/doctor/features/settings/data/repository/settings_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required this.repository}) : super(const SettingState());
  final SettingsRepo repository;

  Future<void> getAllDocuments() async {
    try {
      emit(state.copyWith(pullStatus: RequestState.loading));
      List<String>? documentsList = await repository.pushPullDocuments();
      emit(state.copyWith(
        myDocuments: documentsList,
        pullStatus: RequestState.success,
      ));
    } catch (e) {
      emit(state.copyWith(pullStatus: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?========================[ PICK FILE FROM MOBILE & PUSH IT]======================
  ///pick Doctor file Certificate
  Future<void> onPickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'xlsx',
          'csv',
          'png',
          'jpg',
          'jpeg'
        ],
      );

      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        emit(state.copyWith(docFile: files));
        await pushCertificate();
      } else {
        // User canceled the picker
      }
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> pushCertificate() async {
    try {
      emit(state.copyWith(pullStatus: RequestState.loading));
      List<String>? documentsList =
          await repository.pushPullDocuments(files: state.docFile);
      emit(state.copyWith(
        myDocuments: documentsList,
        pullStatus: RequestState.success,
      ));
    } catch (e) {
      emit(state.copyWith(pullStatus: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?========================[ GET APP INFO DATA]===================

  Future<void> getAppInfo() async {
    try {
      InfoData? response = await repository.appInfo();
      emit(state.copyWith(appInfo: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
  //?========================[ GET DOCTOR POINTS DATA]===================

  Future<void> doctorPoints() async {
    try {
      emit(state.copyWith(
        pointState: RequestState.loading,
      ));
      DoctorPointsModel? response = await repository.doctorPoints();
      emit(state.copyWith(
        pointState: RequestState.success,
        pointsData: response,
      ));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
      emit(state.copyWith(
        pointState: RequestState.failed,
      ));
    }
  }

  showIconForOldpassword() =>
      emit(state.copyWith(showOldPassword: !state.showOldPassword));
  showIconForNewpassword() =>
      emit(state.copyWith(showNewPassword: !state.showNewPassword));
  showIconForConfirmpassword() =>
      emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  ////////
  showValueForOldpassword(var value) =>
      emit(state.copyWith(oldPasswordValue: value));
  showValueForNewpassword(var value) =>
      emit(state.copyWith(newPasswordValue: value));
  showValueForConfirmpassword(var value) =>
      emit(state.copyWith(confirmPasswordValue: value));

  Future<void> changePassword(Function _toggleVisibility) async {
    try {
      fieldsValidation();
      var body = {
        "oldPassword": "${state.oldPasswordValue}",
        "newPassword": "${state.newPasswordValue}"
      };
      ChangePasswordModel response = await repository.changePassword(body);
      emit(state.copyWith(changePasswordData: response));
      emit(state.copyWith(oldPasswordValue: ""));
      emit(state.copyWith(newPasswordValue: ""));
      emit(state.copyWith(confirmPasswordValue: ""));
      _toggleVisibility();
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  void fieldsValidation() {
    if (state.newPasswordValue == null || state.newPasswordValue?.length == 0) {
      throw ("ادخل كلمة السر الجديدة");
    }
    if (state.confirmPasswordValue == null ||
        state.confirmPasswordValue?.length == 0) {
      throw ("أكد كلمة السر الجديدة");
    }
    if (state.oldPasswordValue == null || state.oldPasswordValue?.length == 0) {
      throw ("ادخل كلمة السر القديمة");
    }
    if (state.newPasswordValue != state.confirmPasswordValue) {
      throw ("قم بمطابقة كلمة السر الجديدة مع تأكيد كلمة السر");
    }
  }

  //?========================[ CHANGE ACTIVE STATUS ]===========================

  Future<void> changeActiveStatus() async {
    try {
      AdvertiseActiveModel response = await repository.changeActiveStatus(
          status: state.userActive ? "off" : "on");
      if (response.success == true) {
        emit(state.copyWith(userActive: response.data == "on"));
        await CacheHelper.saveData(
          key: AppStrings.isActive,
          value: response.data == "on",
        );
      }
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  void getActiveStatus() {
    if (CacheHelper.dataSaved(key: AppStrings.isActive)) {
      emit(state.copyWith(
        userActive: CacheHelper.getData(key: AppStrings.isActive),
      ));
    } else {
      changeActiveStatus();
    }
  }
}
