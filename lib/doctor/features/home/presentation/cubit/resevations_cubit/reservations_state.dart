part of 'reservations_cubit.dart';

class ReservationsState extends Equatable {
  const ReservationsState({
    this.resrvationStatusList,
    this.reservationsList,
    this.filteredReservList,
    this.reservation,
    this.painStatusId,
    this.updateReservationState = RequestState.initial,
    this.reservStatusState = RequestState.initial,
    this.reservationState = RequestState.initial,
    this.filterState = RequestState.initial,
    this.selectedTap = ResevationStep.reviewing,
  });
  final int? painStatusId;
  final List<ReservationStatus>? resrvationStatusList;
  final List<ReservationData>? reservationsList;
  final List<ReservationData>? filteredReservList;
  final ReservationData? reservation;
  final RequestState reservStatusState;
  final RequestState reservationState;
  final RequestState filterState;
  final RequestState updateReservationState;
  final ResevationStep selectedTap;

  @override
  List<Object?> get props => [
        painStatusId,
        resrvationStatusList,
        filteredReservList,
        reservation,
        updateReservationState,
        reservStatusState,
        reservationsList,
        reservationState,
        filterState,
        selectedTap,
      ];

  ReservationsState copyWith({
    int? painStatusId,
    List<ReservationStatus>? resrvationStatusList,
    List<ReservationData>? reservationsList,
    List<ReservationData>? filteredReservList,
    ReservationData? reservation,
    RequestState? updateReservationState,
    RequestState? reservStatusState,
    RequestState? reservationState,
    RequestState? filterState,
    ResevationStep? selectedTap,
  }) =>
      ReservationsState(
        painStatusId: painStatusId ?? this.painStatusId,
        resrvationStatusList: resrvationStatusList ?? this.resrvationStatusList,
        filteredReservList: filteredReservList ?? this.filteredReservList,
        reservStatusState: reservStatusState ?? this.reservStatusState,
        reservationsList: reservationsList ?? this.reservationsList,
        reservationState: reservationState ?? this.reservationState,
        filterState: filterState ?? this.filterState,
        selectedTap: selectedTap ?? this.selectedTap,
        reservation: reservation ?? this.reservation,
        updateReservationState:
            updateReservationState ?? this.updateReservationState,
      );
}
