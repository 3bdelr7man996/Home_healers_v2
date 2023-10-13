import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';
import 'package:dr/doctor/features/home/data/models/resevations_status_model.dart';
import 'package:dr/doctor/features/home/data/repositories/reservation_orders_repo.dart';
import 'package:equatable/equatable.dart';

part 'reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> {
  final ReservationOrdersRepo repository;
  ReservationsCubit({required this.repository})
      : super(const ReservationsState());

  List<ReservationStatus>? responseStatusList = [];
  Future<void> getReservationStatus() async {
    try {
      emit(state.copyWith(reservStatusState: RequestState.loading));
      responseStatusList = [];
      responseStatusList = await repository.getResOrdersStatus();
      emit(state.copyWith(
          reservStatusState: RequestState.success,
          resrvationStatusList: responseStatusList));
    } catch (e) {
      emit(state.copyWith(reservStatusState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?========================[ GET RESERVATION DETAILS ]========================

  List<ReservationData>? reservationsList = [];
  Future<void> getReservations({required int? statusId}) async {
    try {
      emit(state.copyWith(
        reservationState: RequestState.loading,
        filterState: RequestState.loading,
      ));
      reservationsList = [];
      reservationsList = await repository.getReservationDetails();
      if (reservationsList != null && reservationsList!.isNotEmpty) {
        filtredList = reservationsList?.where((reservation) {
          return (reservation.statusId == statusId &&
              reservation.status == ResevationStep.reviewing.name);
        }).toList();
      }

      emit(state.copyWith(
        reservationState: RequestState.success,
        filterState: RequestState.success,
        reservationsList: reservationsList,
        filteredReservList: filtredList,
      ));
    } catch (e) {
      emit(state.copyWith(
        reservationState: RequestState.failed,
        filterState: RequestState.failed,
      ));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

//?========================[ FILTER RESERVATIONS ]========================
  List<ReservationData>? filtredList = [];

  void filterReservation(
      {required ResevationStep tabValue, required int? statusId}) {
    try {
      emit(state.copyWith(filterState: RequestState.loading));
      filtredList = [];
      reservationsList = [];
      //List<ReservationData>? tempList = [];
      reservationsList = state.reservationsList;
      if (reservationsList != null && reservationsList!.isNotEmpty) {
        // filtredList = reservationsList!
        //     .where((reservation) => (reservation.statusId == statusId &&
        //         reservation.status?.compareTo(tabValue.name) == 0))
        //     .toList();
        for (var i = 0; i < reservationsList!.length; i++) {
          if (reservationsList?[i].statusId == statusId &&
              reservationsList?[i].status?.compareTo(tabValue.name) == 0) {
            filtredList?.add(reservationsList![i]);
          }
        }
      }
      emit(state.copyWith(
        filterState: RequestState.success,
        filteredReservList: filtredList,
      ));
    } catch (e) {
      emit(state.copyWith(filterState: RequestState.failed));
    }
  }

//?========================[ UPDATE RESERVATION ]========================
  /// subReservation true if want change all sub reservation status
  Future<void> updateReservation(ReservationData reservation,
      {bool subReservation = false}) async {
    try {
      emit(state.copyWith(updateReservationState: RequestState.loading));
      ReservationData? response =
          await repository.updateResevation(body: reservation.toData());

      //!====================== DELETE WHEN HANDLED BY BKND ========================
      //?============ THIS SECTION TO UPDATE ALL SUB RESERVATIONS ===================
      if (subReservation) {
        List<ReservationData>? subReservations = [];
        // state.filteredReservList
        //     ?.where((e) => reservation.id == e.parentId)
        //     .toList();
        for (int i = 0; i < state.filteredReservList!.length; i++) {
          if (state.filteredReservList![i].parentId == reservation.id) {
            subReservations.add(state.filteredReservList![i]);
          }
        }
        log("sub reservation list $subReservations");
        for (int i = 0; i < subReservations.length; i++) {
          await repository.updateResevation(
              body: subReservations[i]
                  .copyWith(status: reservation.status)
                  .toData());
        }
      }
      await getReservations(statusId: state.painStatusId);
      // onSelectedTab(selectedTap)
      // filterReservation(
      //     statusId: state.painStatusId, tabValue: ResevationStep.wait_confirm);
      //!===============================================================================
      emit(state.copyWith(
        updateReservationState: RequestState.success,
        reservation: response,
      ));
    } catch (e) {
      emit(state.copyWith(updateReservationState: RequestState.failed));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

//?========================[ ON CHANGE SECTION ]========================

  onSelectedTab(ResevationStep selectedTap) =>
      emit(state.copyWith(selectedTap: selectedTap));

  onReservationChange(ReservationData reservation) =>
      emit(state.copyWith(reservation: reservation));

  onPainStatusIdChange(int painStatusId) =>
      emit(state.copyWith(painStatusId: painStatusId));
}