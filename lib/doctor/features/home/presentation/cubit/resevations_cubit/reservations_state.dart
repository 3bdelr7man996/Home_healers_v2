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
    this.reservDetailsState = RequestState.initial,
    this.reservChilds,
  });
  final int? painStatusId;
  final List<ReservationStatus>? resrvationStatusList;
  final List<ReservationData>? reservationsList;
  final List<ReservationData>? filteredReservList;
  final List<UserReservationsChilds>? reservChilds;
  final ReservationData? reservation;
  final RequestState reservStatusState;
  final RequestState reservationState;
  final RequestState reservDetailsState;
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
        reservChilds,
        reservationState,
        reservDetailsState,
        filterState,
        selectedTap,
      ];

  ReservationsState copyWith({
    int? painStatusId,
    List<ReservationStatus>? resrvationStatusList,
    List<ReservationData>? reservationsList,
    List<ReservationData>? filteredReservList,
    List<UserReservationsChilds>? reservChilds,
    ReservationData? reservation,
    RequestState? updateReservationState,
    RequestState? reservStatusState,
    RequestState? reservationState,
    RequestState? filterState,
    RequestState? reservDetailsState,
    ResevationStep? selectedTap,
  }) =>
      ReservationsState(
        painStatusId: painStatusId ?? this.painStatusId,
        resrvationStatusList: resrvationStatusList ?? this.resrvationStatusList,
        filteredReservList: filteredReservList ?? this.filteredReservList,
        reservStatusState: reservStatusState ?? this.reservStatusState,
        reservationsList: reservationsList ?? this.reservationsList,
        reservationState: reservationState ?? this.reservationState,
        reservChilds: reservChilds ?? this.reservChilds,
        filterState: filterState ?? this.filterState,
        selectedTap: selectedTap ?? this.selectedTap,
        reservation: reservation ?? this.reservation,
        reservDetailsState: reservDetailsState ?? this.reservDetailsState,
        updateReservationState:
            updateReservationState ?? this.updateReservationState,
      );
}
