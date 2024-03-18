import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/filter_state.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_result_screen.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class FilterCubit extends Cubit<FilterState> {
  final FilterRepo filterRepo;

  FilterCubit({required this.filterRepo}) : super(FilterState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));

  changeSectionNumber(int num) => emit(state.copyWith(status_id: num));
  changeCategoryNumber(int num) => {emit(state.copyWith(category_id: num))};
  changeGender(String gender) => emit(state.copyWith(gender: gender));
  changeCity(int city) => emit(state.copyWith(city_id: city));
  changeArea(int area) => emit(state.copyWith(area_id: area));

  Future<void> GetFilterResult(BuildContext context) async {
    try {
      emit(state.copyWith(
          listOfResponse: SectionModel(success: false, data: [], message: "")));

      SectionModel response = await filterRepo.GetFilter(
          areaId: state.area_id,
          category_id: state.category_id,
          gender: state.gender,
          sectionNumber: state.status_id,
          cityId: state.city_id);
      emit(state.copyWith(
          listOfResponse: response,
          area_id: -1,
          category_id: -1,
          status_id: -1,
          city_id: -1,
          gender: "-1"));

      FirebaseAnalyticUtil.logSearchEvent(term: "Filter", param: {
        "area_id": "${state.area_id}",
        "category_id": "${state.category_id}",
        "cityId": "${state.city_id}",
      });
      AppConstants.customNavigation(context, FilterResultScreen(), -1, 0);
    } catch (e) {
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
