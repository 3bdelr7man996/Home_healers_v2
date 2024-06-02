import 'package:dr/Patient/features/setting/data/models/inVoice_model.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/show_notification_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/my_order_state.dart';
import 'package:dr/Patient/features/setting/presentation/pages/bill_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/requests_details_screen.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final MyOrdersRepo myOrdersRepo;
  final ShowBillRepo showBillRepo;
  final GetInvoiceRepo getInvoiceRepo;
  final ShowNotificationRepo showNotificationRepo;

  MyOrdersCubit(
      {required this.myOrdersRepo,
      required this.showBillRepo,
      required this.showNotificationRepo,
      required this.getInvoiceRepo})
      : super(MyOrdersState());
  ////////////////////////// Show  Notification  ///////////////////////
  Future<void> ShowNotification(BuildContext context, String id) async {
    try {
      var response = await showNotificationRepo.ShowNotification(id: id);
      int num = 1;
      if (response['data']['userReservations'][0]['status'] == 'reviewing') {
        num = 0;
      } else if (response['data']['userReservations'][0]['status'] ==
          'wait_confirm') {
        num = 1;
      } else if (response['data']['userReservations'][0]['status'] ==
          'confirmed') {
        num = 2;
      } else if (response['data']['userReservations'][0]['status'] ==
          'completed') {
        num = 3;
      } else if (response['data']['userReservations'][0]['status'] ==
          'canceled') {
        num = 4;
      }

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RequestsDetailsScreenForPatient(
            fromNotification: true,
            TabIndexClicked: num,
            notificationOrder: response['data']['userReservations']),
      ));
    } catch (e) {
      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> ShowBillScreen(BuildContext context, var id) async {
    try {
      OrderData response = await showBillRepo.ShowBillScreen(id);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => BillScreen(
                  oneOrder: response,
                )),
        (Route route) => false,
      );
    } catch (e) {
      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> GetOrders(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));

      MyOrdersModel response = await myOrdersRepo.GetMyOrders();
      emit(state.copyWith(allOrders: response.data));

      List<OrderData>? arrayForReviewing = [];
      List<OrderData>? arrayForConfirmed = [];
      List<OrderData>? arrayForWaitConfirmed = [];
      List<OrderData>? arrayForPending = [];
      List<OrderData>? arrayForCompleted = [];
      List<OrderData>? arrayForCanceled = [];
      for (var order in response.data!) {
        if (order.status == "reviewing") {
          arrayForReviewing.add(order);
        } else if (order.status == "confirmed") {
          arrayForConfirmed.add(order);
        } else if (order.status == "wait_confirm") {
          arrayForWaitConfirmed.add(order);
        } else if (order.status == "pending") {
          arrayForPending.add(order);
        } else if (order.status == "completed") {
          arrayForCompleted.add(order);
        } else {
          arrayForCanceled.add(order);
        }
      }
      emit(state.copyWith(
          reviewingOrders: arrayForReviewing,
          confirmedOrders: arrayForConfirmed,
          waitConfirmOrders: arrayForWaitConfirmed,
          pendingOrders: arrayForPending,
          completedOrders: arrayForCompleted,
          canceledOrders: arrayForCanceled,
          loading: false));
      debugPrint("${state.waitConfirmOrders}");
    } catch (e) {
      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> GetInvoiceDetails(int id) async {
    try {
      inVoiceModel response = await getInvoiceRepo.Getinvoice(id);
      emit(state.copyWith(inVoice: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
