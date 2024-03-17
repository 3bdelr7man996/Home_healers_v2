// ignore_for_file: must_be_immutable

import 'package:dr/core/utils/http_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:map_location_picker/map_location_picker.dart';

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
      this.coupon = "",
      this.location,
      this.offer,
      this.address,
      this.painPlace});

  final bool Loading;
  var advertiser_id;
  String? start_at;
  String? end_at;
  String? painPlace;
  String? notes;
  String? coupon;
  var offer;
  String? address;
  Location? location;
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
        address,
        end_at,
        location,
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
    String? Function()? address,
    String? Function()? start_at,
    String? notes,
    String? Function()? end_at,
    String? Function()? coupon,
    Location? Function()? location,
    String? painPlace,
    int? sessions_count,
    int? status_id,
    List<DateTime>? Function()? days,
    String? visaUrl,
    RequestState? payState,
  }) =>
      ReservationState(
          Loading: Loading ?? this.Loading,
          advertiser_id: advertiser_id ?? this.advertiser_id,
          start_at: start_at != null ? start_at() : this.start_at,
          end_at: end_at != null ? end_at() : this.end_at,
          status_id: status_id ?? this.status_id,
          days: days != null ? days() : this.days,
          painPlace: painPlace ?? this.painPlace,
          address: address != null ? address() : this.address,
          notes: notes ?? this.notes,
          coupon: coupon != null ? coupon() : this.coupon,
          location: location != null ? location() : this.location,
          offer: offer ?? this.offer,
          sessions_count: sessions_count ?? this.sessions_count);
}
