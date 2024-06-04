// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';
import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  FavoriteState({
    this.Loading = false,
    this.favList,
  });
  final bool Loading;
  List<FavoriteData>? favList;
  @override
  @override
  List<Object?> get props => [Loading, favList];
  FavoriteState copyWith({
    bool? Loading,
    var page,
    List<FavoriteData>? favList,
  }) =>
      FavoriteState(
        Loading: Loading ?? this.Loading,
        favList: favList ?? this.favList,
      );
}
