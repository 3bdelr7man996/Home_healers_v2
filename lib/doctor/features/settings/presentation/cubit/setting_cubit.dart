import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/settings/data/models/app_info_model.dart';
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
}
