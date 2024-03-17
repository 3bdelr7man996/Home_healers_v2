import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/get_all_ads_model.dart';
import 'package:dr/Patient/features/home/data/repositories/get_all_ads_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/ads_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class GetAllAdsCubit extends Cubit<GetAllAdsState> {
  final GetAllAdsRepo getAllAdsRepo;

  GetAllAdsCubit({required this.getAllAdsRepo}) : super(GetAllAdsState());

  Future<void> GetAllAds(BuildContext context) async {
    try {
      GetAllAdsModel response = await getAllAdsRepo.GetAllAds();

      emit(state.copyWith(data: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
