// ignore_for_file: must_be_immutable

part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  FavoriteState({
    this.Loading = false,
    this.data,
  });
  final bool Loading;

  var data;
  @override
  @override
  List<Object?> get props => [Loading, data];
  FavoriteState copyWith({
    bool? Loading,
    var data,
  }) =>
      FavoriteState(
        Loading: Loading ?? this.Loading,
        data: data ?? this.data,
      );
}

////////// New Class ///////////////////////////////
class AddFavoriteState extends Equatable {
  AddFavoriteState({
    this.Loading = false,
    this.Response,
    this.advertiser_id,
  });
  final bool Loading;
  var advertiser_id;
  Map<String, dynamic>? Response;
  @override
  @override
  List<Object?> get props => [Loading, Response, advertiser_id];
  AddFavoriteState copyWith({
    bool? Loading,
    var advertiser_id,
    Map<String, dynamic>? Response,
  }) =>
      AddFavoriteState(
          Loading: Loading ?? this.Loading,
          Response: Response ?? this.Response,
          advertiser_id: advertiser_id ?? this.advertiser_id);
}
