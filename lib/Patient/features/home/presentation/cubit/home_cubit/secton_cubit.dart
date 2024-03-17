import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/auth/data/models/sign_up_patient_model.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/section_state.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';

import '../../../data/models/section-model.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo sectionRepo;

  SectionCubit({required this.sectionRepo}) : super(SectionState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));
  changeSectionNumber(int num) => emit(state.copyWith(sectionNumber: num));

  Future<void> GetSectionDetails(BuildContext context) async {
    try {
      emit(state.copyWith(
          listOfResponse: SectionModel(success: false, data: [], message: ""),
          Loading: true));
      SectionModel response =
          await sectionRepo.GetSection(sectionNumber: state.sectionNumber);
      emit(state.copyWith(listOfResponse: response, Loading: false));
      print("Hi");
    } catch (e) {
      emit(state.copyWith(Loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
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
}
