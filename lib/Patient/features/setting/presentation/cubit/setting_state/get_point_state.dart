// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_points_model.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:equatable/equatable.dart';

class GetPointsState extends Equatable {
  GetPointsState({
    this.myPointsData,
    this.pointState = RequestState.initial,
  });
  MyPointsModel? myPointsData;
  RequestState pointState;
  @override
  @override
  List<Object?> get props => [
        myPointsData,
        pointState,
      ];
  GetPointsState copyWith({
    MyPointsModel? myPointsData,
    RequestState? pointState,
  }) =>
      GetPointsState(
        myPointsData: myPointsData ?? this.myPointsData,
        pointState: pointState ?? this.pointState,
      );
}
