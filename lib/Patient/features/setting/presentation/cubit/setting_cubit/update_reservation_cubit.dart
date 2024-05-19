// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/setting/data/models/update_reservation_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/update_reservation_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateReservationCubit extends Cubit<UpdateReservationState> {
  final UpdateReservationRepo updateReservationRepo;

  UpdateReservationCubit({required this.updateReservationRepo})
      : super(UpdateReservationState());

  //?==================== formFields change ====================
  onIdChange(String value) => emit(state.copyWith(id: value));
  onStartAtChange(String value) => emit(state.copyWith(start_at: value));
  onEndAtChange(String value) => emit(state.copyWith(end_at: value));
  onStatusChange(String value) => emit(state.copyWith(status: value));

  Future<void> updateSelectedReservation(BuildContext context) async {
    try {
      emit(state.copyWith(loadingUpdateResevation: true));
      Map<String, dynamic> body = {
        "id": "${state.id}",
        "start_at": "${state.start_at}",
        "end_at": "${state.end_at}",
        "status": "${state.status}",
      };

      UpdateReservationModel response =
          await updateReservationRepo.updateReservation(body: body);
      await context.read<MyOrdersCubit>().GetOrders(context);
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
      emit(state.copyWith(loadingUpdateResevation: false, showPoUp: true));
    } catch (e) {
      emit(state.copyWith(loadingUpdateResevation: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
