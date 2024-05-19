// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UpdateReservationState extends Equatable {
  UpdateReservationState({
    this.Loading = false,
    this.id,
    this.start_at,
    this.end_at,
    this.status,
    this.showPoUp = false,
    this.loadingUpdateResevation = false,
  });
  final bool Loading;
  String? id;
  var start_at;
  var end_at;
  String? status;
  bool showPoUp;
  bool loadingUpdateResevation;
  @override
  @override
  List<Object?> get props => [
        Loading,
        id,
        start_at,
        end_at,
        status,
        showPoUp,
        loadingUpdateResevation
      ];
  UpdateReservationState copyWith({
    bool? Loading,
    bool? loadingUpdateResevation,
    String? id,
    var start_at,
    var end_at,
    var status,
    bool? showPoUp,
  }) =>
      UpdateReservationState(
          Loading: Loading ?? this.Loading,
          id: id ?? this.id,
          end_at: end_at ?? this.end_at,
          loadingUpdateResevation:
              loadingUpdateResevation ?? this.loadingUpdateResevation,
          status: status ?? this.status,
          showPoUp: showPoUp ?? this.showPoUp,
          start_at: start_at ?? this.start_at);
}
