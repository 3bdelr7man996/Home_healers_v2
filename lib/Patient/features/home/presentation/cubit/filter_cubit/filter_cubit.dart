import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_result_screen.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this.repositorie) : super(FilterState());
  final FilterRepo repositorie;

  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));

  changeSectionNumber(Item? num) => emit(state.copyWith(status_id: () => num));
  changeCategoryNumber(Item? num) =>
      {emit(state.copyWith(category_id: () => num))};
  changeGender(Item? gender) => emit(state.copyWith(gender: () => gender));
  changeCity(Item? city) => emit(state.copyWith(city_id: () => city));
  changeArea(Item? area) => emit(state.copyWith(area_id: () => area));
  showCateg() => emit(state.copyWith(showCateg: !state.showCateg));
  showCities() => emit(state.copyWith(showCity: !state.showCity));
  showArea() => emit(state.copyWith(showArea: !state.showArea));
  showGender() => emit(state.copyWith(showGender: !state.showGender));
  showStatus() => emit(state.copyWith(showStatus: !state.showStatus));

  List<Area>? areaList = [];
  onfillAreaList(List<Area>? arList) {
    areaList = [];
    areaList?.addAll(arList ?? []);
    areaItemList =
        areaList!.map((e) => Item(id: e.id, nameAr: e.nameAr ?? '')).toList();
    emit(state.copyWith(areaList: areaList));
  }

  Future<void> GetFilterResult(BuildContext context) async {
    try {
      emit(state.copyWith(Loading: true));
      SectionModel response = await repositorie.GetFilter(
          areaId: state.area_id?.id,
          category_id: state.category_id?.id,
          gender: state.gender?.id != null
              ? state.gender?.id == 2
                  ? "male"
                  : "female"
              : "",
          sectionNumber: state.status_id?.id,
          cityId: state.city_id?.id);
      emit(state.copyWith(Loading: false, specialistList: response.toJson()));
      FirebaseAnalyticUtil.logSearchEvent(term: "Filter", param: {
        "area_id": "${state.area_id?.nameAr}",
        "category_id": "${state.category_id?.nameAr}",
        "cityId": "${state.city_id?.nameAr}",
      });
      AppConstants.customNavigation(context, FilterResultScreen(), -1, 0);
    } catch (e) {
      emit(state.copyWith(Loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  List<Item> catgList = [];
  List<Item> statusList = [];
  List<Item> citiesList = [];
  List<Item> areaItemList = [];
  Future<void> initData(BuildContext context) async {
    emit(state.copyWith(
      Loading: true,
      category_id: () => null,
      city_id: () => null,
      area_id: () => null,
      gender: () => null,
      status_id: () => null,
      showArea: false,
      showCateg: false,
      showCity: false,
      showGender: false,
      showStatus: false,
      specialistList: {},
    ));
    await context.read<AuthCubit>().getAllCities();
    await context.read<AuthCubit>().getAllDepartements();
    await context.read<AuthCubit>().getAllStatus();

    catgList = context
        .read<AuthCubit>()
        .departList!
        .map((e) => Item(id: e.id, nameAr: e.nameAr ?? ''))
        .toList();
    statusList = context
        .read<AuthCubit>()
        .statusList!
        .map((e) => Item(id: e.id, nameAr: e.nameAr ?? ''))
        .toList();
    citiesList = context
        .read<AuthCubit>()
        .citiesList!
        .map((e) => Item(id: e.id, nameAr: e.nameAr ?? ''))
        .toList();
    emit(state.copyWith(Loading: false));
  }
}
