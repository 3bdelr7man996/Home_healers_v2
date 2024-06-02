// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:equatable/equatable.dart';

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
