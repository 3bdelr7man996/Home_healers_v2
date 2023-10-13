import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_packages_repo.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/get_offers_model.dart';
import '../../data/repositories/get_offers_Repo.dart';

part 'offer_state.dart';

class GetPackagesCubit extends Cubit<GetPackagesState> {
  final GetPackagesRepo getPackagesRepo;

  GetPackagesCubit({required this.getPackagesRepo}) : super(GetPackagesState());

  Future<void> GetPackages(BuildContext context) async {
    try {
      GetPackagesModel response = await getPackagesRepo.GetPackages();
      print(response);
      emit(state.copyWith(AllPackages: response));
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}

class GetOffersCubit extends Cubit<GetOffersState> {
  final GetOffersRepo getOffersRepo;

  GetOffersCubit({required this.getOffersRepo}) : super(GetOffersState());

  Future<void> GetOffers(BuildContext context) async {
    try {
      GetOffersModel response = await getOffersRepo.getOffers();
      print(response);
      emit(state.copyWith(AllOffers: response.toJson()));
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
