import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/search_state.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(SearchState());

  //?==================== formFields change ====================

  List<Advertiser> searchDataList = [];
  Future<void> GetSearchResult(BuildContext context) async {
    try {
      emit(state.copyWith(Loading: true));

      SectionModel response = await searchRepo.GetSearch();
      searchDataList.addAll(response.advertisersList);
      emit(state.copyWith(searchDataList: searchDataList, Loading: false));
    } catch (e) {
      emit(state.copyWith(Loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  List<Advertiser>? tempSearchList = [];

  void search(String query) {
    log(query);
    if (query.isEmpty) {
      emit(state.copyWith(searchDataList: searchDataList));
    }
    emit(state.copyWith(Loading: true));
    if (searchDataList.isNotEmpty) {
      tempSearchList = searchDataList.where((doctor) {
        return doctor.nameAr
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      emit(state.copyWith(Loading: false, searchDataList: tempSearchList));
    }
    emit(state.copyWith(Loading: false));
    FirebaseAnalyticUtil.logSearchEvent(term: query);
  }
}
