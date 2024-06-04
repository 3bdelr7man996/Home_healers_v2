import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/section_state.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/section-model.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo sectionRepo;

  SectionCubit({required this.sectionRepo}) : super(SectionState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));
  changeSectionNumber(int num) => emit(state.copyWith(sectionNumber: num));

  List<Advertiser> sectionDoctorsList = [];

  Future<void> GetSectionDetails(BuildContext context) async {
    try {
      emit(state.copyWith(Loading: true));
      SectionModel response =
          await sectionRepo.GetSection(sectionNumber: state.sectionNumber);
      sectionDoctorsList = [];
      sectionDoctorsList.addAll(response.advertisersList);

      emit(state.copyWith(
        sectionDoctorsList: sectionDoctorsList,
        Loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(Loading: false, sectionDoctorsList: []));
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

  List<Advertiser> searchResults = [];
  void search(String query) {
    print("fffffff $query");
    if (query.isEmpty) {
      emit(state.copyWith(sectionDoctorsList: sectionDoctorsList));
    }
    if (sectionDoctorsList.isNotEmpty) {
      emit(state.copyWith(Loading: true));
      searchResults = sectionDoctorsList.where((doctor) {
        log("${doctor.nameAr} == $query");
        return doctor.nameAr!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(state.copyWith(Loading: false, sectionDoctorsList: searchResults));
    }
  }
}
