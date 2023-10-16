// ignore_for_file: must_be_immutable

import 'package:dr/core/utils/http_helper.dart';
import 'package:equatable/equatable.dart';

class SectionState extends Equatable {
  SectionState({
    this.Loading = false,
    this.sectionNumber,
    this.listOfResponse,
  });
  final bool Loading;
  final int? sectionNumber;
  Map<String, dynamic>? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, sectionNumber, listOfResponse];
  SectionState copyWith({
    bool? Loading,
    int? sectionNumber,
    Map<String, dynamic>? listOfResponse,
  }) =>
      SectionState(
        Loading: Loading ?? this.Loading,
        sectionNumber: sectionNumber ?? this.sectionNumber,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}

//////////////// ⁡⁢⁣⁢New Class For Filter⁡ ///////////////////////////////////////////

class FilterState extends Equatable {
  FilterState({
    this.Loading = false,
    this.category_id,
    this.status_id,
    this.gender,
    this.city_id,
    this.listOfResponse,
    this.area_id,
  });
  final bool Loading;
  late final int? category_id;
  late final int? status_id;
  late final int? city_id;
  late final int? area_id;
  late final String? gender;
  Map<String, dynamic>? listOfResponse;
  @override
  @override
  List<Object?> get props => [
        Loading,
        status_id,
        city_id,
        gender,
        area_id,
        category_id,
        listOfResponse
      ];
  FilterState copyWith({
    bool? Loading,
    int? category_id,
    int? area_id,
    String? gender,
    int? status_id,
    int? city_id,
    Map<String, dynamic>? listOfResponse,
  }) =>
      FilterState(
        Loading: Loading ?? this.Loading,
        city_id: city_id ?? this.city_id,
        gender: gender ?? this.gender,
        area_id: area_id ?? this.area_id,
        category_id: category_id ?? this.category_id,
        status_id: status_id ?? this.status_id,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}

/////////////////////////////// ⁡⁢⁣⁢New Class For Search⁡ ///////////////

class SearchState extends Equatable {
  SearchState({
    this.Loading = false,
    this.listOfResponse,
  });
  final bool Loading;

  Map<String, dynamic>? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, listOfResponse];
  SearchState copyWith({
    bool? Loading,
    Map<String, dynamic>? listOfResponse,
  }) =>
      SearchState(
        Loading: Loading ?? this.Loading,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}

///////////////////////////////////////////// New Class For Reservation ////////////////////////

class ReservationState extends Equatable {
  ReservationState(
      {this.Loading = false,
      this.advertiser_id,
      this.start_at,
      this.end_at,
      this.notes = "",
      this.sessions_count = 1,
      this.status_id,
      this.days,
      this.coupon,
      this.offer,
      this.painPlace});

  final bool Loading;
  var advertiser_id;
  String? start_at;
  String? end_at;
  String? painPlace;
  String notes;
  var coupon;
  var offer;
  final int? sessions_count;
  final int? status_id;
  List<DateTime>? days;

  @override
  @override
  List<Object?> get props => [
        Loading,
        advertiser_id,
        start_at,
        offer,
        notes,
        end_at,
        painPlace,
        status_id,
        coupon,
        sessions_count,
        days,
      ];
  ReservationState copyWith({
    bool? Loading,
    var advertiser_id,
    var offer,
    String? start_at,
    String? notes,
    String? end_at,
    var coupon,
    String? painPlace,
    int? sessions_count,
    int? status_id,
    List<DateTime>? days,
    String? visaUrl,
    RequestState? payState,
  }) =>
      ReservationState(
          Loading: Loading ?? this.Loading,
          advertiser_id: advertiser_id ?? this.advertiser_id,
          start_at: start_at ?? this.start_at,
          end_at: end_at ?? this.end_at,
          status_id: status_id ?? this.status_id,
          days: days ?? this.days,
          painPlace: painPlace ?? this.painPlace,
          notes: notes ?? this.notes,
          coupon: coupon ?? this.coupon,
          offer: offer ?? this.offer,
          sessions_count: sessions_count ?? this.sessions_count);
}

/////////////// ⁡⁢⁣⁢New Class For ADs /////////////////////////////////////////

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
