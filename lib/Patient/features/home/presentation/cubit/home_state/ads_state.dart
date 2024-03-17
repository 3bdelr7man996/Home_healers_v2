// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class GetAllAdsState extends Equatable {
  GetAllAdsState({
    this.Loading = false,
    this.data,
  });
  final bool Loading;
  var data;

  @override
  @override
  List<Object?> get props => [
        Loading,
        data,
      ];
  GetAllAdsState copyWith({
    bool? Loading,
    var data,
  }) =>
      GetAllAdsState(
        Loading: Loading ?? this.Loading,
        data: data ?? this.data,
      );
}
