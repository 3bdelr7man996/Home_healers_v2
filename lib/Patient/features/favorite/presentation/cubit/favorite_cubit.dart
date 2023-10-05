import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/favorite/data/models/AddFavoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/repositories/addFavorite_repo.dart';
import 'package:dr/Patient/features/favorite/data/repositories/favorite_repo.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteState());

  //?==================== formFields change ====================

  Future<void> GetFavorite(BuildContext context) async {
    try {
      var response = await favoriteRepo.GetFavorite();
      print(
          "============================================================================================");
      emit(await state.copyWith(data: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}

////////////////////////////////////////////////// New Class ////////////////////////////////////////////////////////////////

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  final AddFavoriteRepo addFavoriteRepo;

  AddFavoriteCubit({required this.addFavoriteRepo}) : super(AddFavoriteState());

  Future<void> AddFavorite(BuildContext context, var advertiser_id) async {
    try {
      fieldsValidation();
      Map<String, dynamic> body = {"advertiser_id": advertiser_id};

      AddFavoriteModel response = await addFavoriteRepo.AddFavorite(body: body);
      print(response);
      print("Ghaith");
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}
}
