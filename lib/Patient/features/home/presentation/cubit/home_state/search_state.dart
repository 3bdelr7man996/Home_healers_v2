// ignore_for_file: must_be_immutable

import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  SearchState({
    this.Loading = false,
    this.searchDataList,
  });
  final bool Loading;
  final List<Advertiser>? searchDataList;

  @override
  @override
  List<Object?> get props => [Loading, searchDataList];
  SearchState copyWith({
    bool? Loading,
    List<Advertiser>? searchDataList,
  }) =>
      SearchState(
        Loading: Loading ?? this.Loading,
        searchDataList: searchDataList ?? this.searchDataList,
      );
}
