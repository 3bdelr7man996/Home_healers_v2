// ignore_for_file: must_be_immutable

import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  FilterState({
    this.Loading = false,
    this.category_id,
    this.status_id,
    this.gender,
    this.city_id,
    this.filterDataList,
    this.area_id,
  });
  final bool Loading;
  late final int? category_id;
  late final int? status_id;
  late final int? city_id;
  late final int? area_id;
  late final String? gender;
  final List<Advertiser>? filterDataList;
  @override
  @override
  List<Object?> get props => [
        Loading,
        status_id,
        city_id,
        gender,
        area_id,
        category_id,
        filterDataList
      ];
  FilterState copyWith({
    bool? Loading,
    int? category_id,
    int? area_id,
    String? gender,
    int? status_id,
    int? city_id,
    List<Advertiser>? filterDataList,
  }) =>
      FilterState(
        Loading: Loading ?? this.Loading,
        city_id: city_id ?? this.city_id,
        gender: gender ?? this.gender,
        area_id: area_id ?? this.area_id,
        category_id: category_id ?? this.category_id,
        status_id: status_id ?? this.status_id,
        filterDataList: filterDataList ?? this.filterDataList,
      );
}
