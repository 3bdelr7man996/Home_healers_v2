import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_offers_Repo.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_state/offer_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  final GetOffersRepo getOffersRepo;

  GetOffersCubit({required this.getOffersRepo}) : super(GetOffersState());

  Future<void> GetOffers(BuildContext context) async {
    try {
      GetOffersModel response = await getOffersRepo.getOffers();
      emit(state.copyWith(AllOffers: response));
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
