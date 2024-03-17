import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/search_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(SearchState());

  //?==================== formFields change ====================

  Future<void> GetSearchResult(BuildContext context) async {
    try {
      emit(state.copyWith(listOfResponse: {}));

      SectionModel response = await searchRepo.GetSearch();
      emit(state.copyWith(listOfResponse: response.toJson()));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
