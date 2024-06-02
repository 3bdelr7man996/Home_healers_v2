// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/favorite/data/models/addFavoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/repositories/addFavorite_repo.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_state/addFavorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  final AddFavoriteRepo addFavoriteRepo;

  AddFavoriteCubit({required this.addFavoriteRepo}) : super(AddFavoriteState());

  Future<void> AddFavorite(BuildContext context, var advertiser_id) async {
    try {
      Map<String, dynamic> body = {"advertiser_id": advertiser_id};

      AddFavoriteModel response =
          (await addFavoriteRepo.AddFavorite(body: body)) as AddFavoriteModel;
    } catch (e) {}
  }
}
