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
  });

  List<OrderData>? reviewingOrders,
      confirmedOrders,
      allOrders,
      waitConfirmOrders,
      pendingOrders,
      completedOrders,
      canceledOrders;

  @override
  List<Object?> get props => [
        reviewingOrders,
        confirmedOrders,
        waitConfirmOrders,
        allOrders,
        pendingOrders,
        completedOrders,
        canceledOrders,
      ];
  MyOrdersState copyWith({
    List<OrderData>? reviewingOrders,
    confirmedOrders,
    waitConfirmOrders,
    allOrders,
    pendingOrders,
    completedOrders,
    canceledOrders,
  }) =>
      MyOrdersState(
        reviewingOrders: reviewingOrders ?? this.reviewingOrders,
        confirmedOrders: confirmedOrders ?? this.confirmedOrders,
        waitConfirmOrders: waitConfirmOrders ?? this.waitConfirmOrders,
        pendingOrders: pendingOrders ?? this.pendingOrders,
        completedOrders: completedOrders ?? this.completedOrders,
        canceledOrders: canceledOrders ?? this.canceledOrders,
        allOrders: allOrders ?? this.allOrders,
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
  });
  final bool Loading;
  String? id;
  var start_at;
  var end_at;
  String? status;
  bool showPoUp;
  @override
  @override
  List<Object?> get props => [Loading, id, start_at, end_at, status, showPoUp];
  UpdateReservationState copyWith({
    bool? Loading,
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
          status: status ?? this.status,
          showPoUp: showPoUp ?? this.showPoUp,
          start_at: start_at ?? this.start_at);
}

////////////////////////////////////////////////////////// NEW CLASS //////////////////////////////

class UpdateInfoState extends Equatable {
  UpdateInfoState({
    this.Loading = false,
    this.fullName,
    this.email,
    this.mobile,
    this.gender,
    this.cityId,
    this.image,
  });
  final bool Loading;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? gender;
  final String? cityId;
  var image;

  @override
  @override
  List<Object?> get props =>
      [Loading, fullName, email, mobile, gender, cityId, image];
  UpdateInfoState copyWith({
    bool? Loading,
    String? fullName,
    String? email,
    String? mobile,
    String? gender,
    String? cityId,
    var image,
  }) =>
      UpdateInfoState(
          Loading: Loading ?? this.Loading,
          email: email ?? this.email,
          mobile: mobile ?? this.mobile,
          gender: gender ?? this.gender,
          image: image ?? this.image,
          cityId: cityId ?? this.cityId,
          fullName: fullName ?? this.fullName);
}
