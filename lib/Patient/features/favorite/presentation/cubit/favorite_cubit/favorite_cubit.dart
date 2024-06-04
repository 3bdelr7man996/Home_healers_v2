import 'package:dr/Patient/features/favorite/data/models/AddFavoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/repositories/favorite_repo.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_state/favorite_state.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/popUp_favourite_widget.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteState());

  //?==================== formFields change ====================

  List<FavoriteData> favList = [];
  Future<void> GetFavorite(BuildContext context, {bool reload = false}) async {
    try {
      if (favList.isEmpty || reload) {
        emit(state.copyWith(Loading: true));
        favList = [];
        FavoriteModel response = await favoriteRepo.GetFavorite();
        favList.addAll(response.data);
        emit(await state.copyWith(Loading: false, favList: favList));
      }
    } catch (e) {
      emit(state.copyWith(Loading: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?===========================[add to favorite ]=============================
  Future<void> AddFavorite(BuildContext context,
      {required int? advId, bool isFav = false}) async {
    try {
      if (!isFav) {
        Map<String, dynamic> body = {"advertiser_id": "${advId}"};

        AddFavoriteModel response = await favoriteRepo.AddFavorite(body: body);
        if (response.success) {
          favList = List<FavoriteData>.from(state.favList ?? [])
            ..add(FavoriteData(
              id: response.data.id,
              userId: response.data.userId,
              advertiserId: int.parse(response.data.advertiserId.toString()),
            ));
          emit(state.copyWith(favList: favList));
          showDialog(
            context: context,
            builder: (context) => PopUpForAddToFavourite(),
          );
        }
      } else {
        bool response = await favoriteRepo.RemoveFavorite(
            favId: favList.firstWhere((e) => e.advertiserId == advId).id);
        if (response) {
          favList = List<FavoriteData>.from(state.favList ?? [])
            ..removeWhere((e) => e.advertiserId == advId);
          emit(state.copyWith(favList: favList));
        }
      }
    } catch (e) {}
  }
}
