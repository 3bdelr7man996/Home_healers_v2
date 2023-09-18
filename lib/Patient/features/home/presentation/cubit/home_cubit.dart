import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo sectionRepo;

  SectionCubit({required this.sectionRepo}) : super(SectionState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));
  changeSectionNumber(int num) => emit(state.copyWith(sectionNumber: num));

  ///Register new patient
  Future<void> GetSectionDetails(BuildContext context) async {
    try {
      emit(state.copyWith(listOfResponse: {}));
      print("aha ");
      fieldsValidation();
      SectionModel response =
          await sectionRepo.GetSection(sectionNumber: state.sectionNumber);
      emit(state.copyWith(listOfResponse: response.toJson()));
      print("Ghaithhhhh");
      print(state.listOfResponse);
      print("Ghaithhhhh");
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}

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
