// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

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
