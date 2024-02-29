import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';
import 'package:dr/doctor/features/home/data/models/reservations_model.dart';
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
  Future<void> getReservations({
    required int statusId,
    ResevationStep reservationStep = ResevationStep.reviewing,
  }) async {
    try {
      emit(state.copyWith(
        reservationState: RequestState.loading,
        filterState: RequestState.loading,
        reservDetailsState: RequestState.initial,
      ));
      reservationsList = [];
      reservationsList =
          await repository.getStatusReservations(statusId: statusId);
      if (reservationsList != null && reservationsList!.isNotEmpty) {
        filtredList = reservationsList?.where((reservation) {
          return (reservation.statusId == statusId &&
              reservation.status == reservationStep.name);
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
  Future<void> updateReservation(
    ReservationData reservation,
    ResevationStep reservationStep, {
    bool subReservation = false,
  }) async {
    try {
      emit(state.copyWith(updateReservationState: RequestState.loading));
      ReservationData? response =
          await repository.updateResevation(body: reservation.toData());

      //!====================== DELETE WHEN HANDLED BY BKND ========================
      //?============ THIS SECTION TO UPDATE ALL SUB RESERVATIONS ===================
      // if (subReservation) {
      //   List<ReservationData>? subReservations = [];
      //   // state.filteredReservList
      //   //     ?.where((e) => reservation.id == e.parentId)
      //   //     .toList();
      //   for (int i = 0; i < state.filteredReservList!.length; i++) {
      //     if (state.filteredReservList![i].parentId == reservation.id) {
      //       subReservations.add(state.filteredReservList![i]);
      //     }
      //   }
      //   log("sub reservation list $subReservations");
      //   for (int i = 0; i < subReservations.length; i++) {
      //     await repository.updateResevation(
      //         body: subReservations[i]
      //             .copyWith(status: reservation.status)
      //             .toData());
      //   }
      // }
      log("pain id ${state.painStatusId}  statusId ${reservation.statusId}");
      if(state.painStatusId!=null||reservation.statusId!=null)
      await getReservations(
        statusId: state.painStatusId??reservation.statusId??0,
        reservationStep: reservationStep,
      );
      // onSelectedTab(selectedTap)
      // filterReservation(
      //     statusId: state.painStatusId, tabValue: ResevationStep.wait_confirm);
      //!===============================================================================
      emit(state.copyWith(
        updateReservationState: RequestState.success,
        reservation: response,
      ));
      onSelectedTab(reservationStep);
    } catch (e) {
      emit(state.copyWith(updateReservationState: RequestState.failed));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

//?========================[ ON CHANGE SECTION ]================================

  onSelectedTab(ResevationStep selectedTap) =>
      emit(state.copyWith(selectedTap: selectedTap));

  onReservationChange(ReservationData reservation) =>
      emit(state.copyWith(reservation: reservation));

  onPainStatusIdChange(int painStatusId) =>
      emit(state.copyWith(painStatusId: painStatusId));

  String? getReservationsDate(
      {required int index, required bool fromNotification}) {
    String? status = "";
    if (fromNotification) {
      if (state.reservChilds != null && state.reservChilds!.isNotEmpty) {
        status = index == 0
            ? state.reservation?.status
            : state.reservChilds?[index - 1].status;
      }
    } else {
      status = state
              .reservationsList![state.reservationsList!
                  .indexWhere((e) => e.id == state.reservation?.id)]
              .status ??
          "";
    }
    return status;
  }

//?===================[ GET SPECIFIC RESERVATION DETAILS ]======================
  Future<void> getReservDetails({required reservId}) async {
    try {
      emit(state.copyWith(reservDetailsState: RequestState.loading));
      ReservationDetailsModel response =
          await repository.getReservDetails(reservId: reservId);
      if (response.success == true &&
          response.data!.userReservations!.isNotEmpty) {
        emit(state.copyWith(
          reservation: response.data?.userReservations?.first,
          reservChilds: response.data?.userReservationsChilds ?? [],
          reservDetailsState: RequestState.success,
        ));
      }
    } catch (e) {
      log("GET RESERVATION DATA ERROR: $e ");
      emit(state.copyWith(reservDetailsState: RequestState.failed));
    }
  }
}
