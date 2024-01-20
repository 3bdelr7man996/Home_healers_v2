// ignore_for_file: must_be_immutable

part of 'setting_cubit.dart';

class MyOrdersState extends Equatable {
  MyOrdersState({
    this.allOrders,
    this.reviewingOrders,
    this.confirmedOrders,
    this.waitConfirmOrders,
    this.pendingOrders,
    this.completedOrders,
    this.canceledOrders,
    this.loading = false,
    this.inVoice,
  });

  List<OrderData>? reviewingOrders,
      confirmedOrders,
      allOrders,
      waitConfirmOrders,
      pendingOrders,
      completedOrders,
      canceledOrders;
  bool loading;

  var inVoice;
  @override
  List<Object?> get props => [
        reviewingOrders,
        confirmedOrders,
        waitConfirmOrders,
        allOrders,
        pendingOrders,
        completedOrders,
        canceledOrders,
        loading,
        inVoice
      ];
  MyOrdersState copyWith(
          {List<OrderData>? reviewingOrders,
          confirmedOrders,
          waitConfirmOrders,
          allOrders,
          pendingOrders,
          completedOrders,
          canceledOrders,
          loading,
          inVoice}) =>
      MyOrdersState(
        reviewingOrders: reviewingOrders ?? this.reviewingOrders,
        confirmedOrders: confirmedOrders ?? this.confirmedOrders,
        waitConfirmOrders: waitConfirmOrders ?? this.waitConfirmOrders,
        pendingOrders: pendingOrders ?? this.pendingOrders,
        completedOrders: completedOrders ?? this.completedOrders,
        canceledOrders: canceledOrders ?? this.canceledOrders,
        allOrders: allOrders ?? this.allOrders,
        loading: loading ?? this.loading,
        inVoice: inVoice ?? this.inVoice,
      );
}

////////////////////////////////////////////////////////// NEW CLASS //////////////////////////////

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

////////////////////////////////////////////////////////// NEW CLASS //////////////////////////////

class UpdateInfoState extends Equatable {
  UpdateInfoState(
      {this.Loading = false,
      this.fullName,
      this.email,
      this.mobile,
      this.gender,
      this.cityId,
      this.image,
      this.citySelected});
  final bool Loading;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? gender;
  final String? cityId;
  var image;
  var citySelected;

  @override
  @override
  List<Object?> get props =>
      [Loading, fullName, email, mobile, gender, cityId, image, citySelected];
  UpdateInfoState copyWith({
    bool? Loading,
    String? fullName,
    String? email,
    String? mobile,
    String? gender,
    String? cityId,
    var image,
    var citySelected,
  }) =>
      UpdateInfoState(
          Loading: Loading ?? this.Loading,
          email: email ?? this.email,
          mobile: mobile ?? this.mobile,
          gender: gender ?? this.gender,
          image: image ?? this.image,
          cityId: cityId ?? this.cityId,
          citySelected: citySelected ?? this.citySelected,
          fullName: fullName ?? this.fullName);
}

////////////////////////////////////////////////////////////////////
class GetPointsState extends Equatable {
  GetPointsState({
    this.Data = false,
  });
  var Data;

  @override
  @override
  List<Object?> get props => [
        Data,
      ];
  GetPointsState copyWith({
    var Data,
  }) =>
      GetPointsState(
        Data: Data ?? this.Data,
      );
}

////////////////////////////////////////////////////////////////////
class evaluationsState extends Equatable {
  evaluationsState({
    this.Data = false,
    this.rate,
    this.showEvaluationPopUp = 0,
  });
  var Data, rate, showEvaluationPopUp;

  @override
  @override
  List<Object?> get props => [Data, rate, showEvaluationPopUp];
  evaluationsState copyWith({var Data, rate, showEvaluationPopUp}) =>
      evaluationsState(
        Data: Data ?? this.Data,
        rate: rate ?? this.rate,
        showEvaluationPopUp: showEvaluationPopUp ?? this.showEvaluationPopUp,
      );
}

////////////////////////////////////////////////////////////////////
class ReportsState extends Equatable {
  ReportsState(
      {this.Data = false, this.reportsForPatient, this.reportsForDoctors});
  var Data, reportsForPatient, reportsForDoctors;

  @override
  @override
  List<Object?> get props => [Data, reportsForPatient, reportsForDoctors];
  ReportsState copyWith({var Data, reportsForPatient, reportsForDoctors}) =>
      ReportsState(
        Data: Data ?? this.Data,
        reportsForPatient: reportsForPatient ?? this.reportsForPatient,
        reportsForDoctors: reportsForDoctors ?? this.reportsForDoctors,
      );
}

////////////////////////////////////////////////////////////////////
class AddReportState extends Equatable {
  AddReportState({
    this.Data = false,
  });
  var Data;
  @override
  @override
  List<Object?> get props => [
        Data,
      ];
  AddReportState copyWith({
    var Data,
  }) =>
      AddReportState(
        Data: Data ?? this.Data,
      );
}
