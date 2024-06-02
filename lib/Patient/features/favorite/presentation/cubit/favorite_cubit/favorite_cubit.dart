import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/repositories/favorite_repo.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_state/favorite_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteState());

  //?==================== formFields change ====================

  Future<void> GetFavorite(BuildContext context) async {
    try {
      FavoriteModel response = await favoriteRepo.GetFavorite();
      emit(await state.copyWith(data: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
