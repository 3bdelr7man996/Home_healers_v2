// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/setting/data/models/my_points_model.dart';
import 'package:dr/Patient/features/setting/data/models/points_to_cashback_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_points_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/get_point_state.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPointsCubit extends Cubit<GetPointsState> {
  final GetPointsRepo getPointrepo;

  GetPointsCubit({required this.getPointrepo}) : super(GetPointsState());

  Future<void> GetMyPoints(BuildContext context) async {
    try {
      MyPointsModel response = await getPointrepo.GetPoints();
      emit(state.copyWith(myPointsData: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> pointsToCashback(var points, BuildContext context) async {
    try {
      fieldsValidation(points);
      emit(state.copyWith(pointState: RequestState.loading));
      Map<String, dynamic> body = {
        "num_of_points": "${points}",
      };

      pointsToCashbackModel response =
          await getPointrepo.pointsToCashback(body: body);
      await GetMyPoints(context);
      emit(state.copyWith(pointState: RequestState.success));
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
    } catch (e) {
      emit(state.copyWith(pointState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation(var points) {
    if (points == null || points == 0) {
      throw ("لا يوجد لديك نقاط");
    }
  }
}
