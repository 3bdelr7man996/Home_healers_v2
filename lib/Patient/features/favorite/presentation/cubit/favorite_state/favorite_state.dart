// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';
import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  FavoriteState({
    this.Loading = false,
    this.data,
  });
  final bool Loading;
  FavoriteModel? data;
  @override
  @override
  List<Object?> get props => [Loading, data];
  FavoriteState copyWith({
    bool? Loading,
    var page,
    FavoriteModel? data,
  }) =>
      FavoriteState(
        Loading: Loading ?? this.Loading,
        data: data ?? this.data,
      );
}
