// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/Patient/features/setting/data/models/add_report_model.dart';
import 'package:dr/Patient/features/setting/data/models/evaluations_model.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/data/models/my_points_model.dart';
import 'package:dr/Patient/features/setting/data/models/points_to_cashback_model.dart';
import 'package:dr/Patient/features/setting/data/models/reports_model.dart';
import 'package:dr/Patient/features/setting/data/models/update_info_model.dart';
import 'package:dr/Patient/features/setting/data/models/update_reservation_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/add_report_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/evaluation_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_orders_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/my_points_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/reports_repo.dart';
import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/inVoice_model.dart';
import '../../../data/repositories/show_notification_repo.dart';
import '../../pages/bill_screen.dart';
import '../../pages/requests_details_screen.dart';

part 'setting_state.dart';

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
      print(response['data']);
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
      print(num);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RequestsDetailsScreenForPatient(
            fromNotification: true,
            num: num,
            notificationOrder: response['data']['userReservations']),
      ));
    } catch (e) {
      print(e);
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
      print(e);
      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> GetOrders(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));

      MyOrdersModel response = await myOrdersRepo.GetMyOrders();
      emit(state.copyWith(allOrders: response.data));

      //print(response.data![0].parentId.runtimeType);
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
      emit(state.copyWith(reviewingOrders: arrayForReviewing));
      emit(state.copyWith(confirmedOrders: arrayForConfirmed));
      emit(state.copyWith(waitConfirmOrders: arrayForWaitConfirmed));
      emit(state.copyWith(pendingOrders: arrayForPending));
      emit(state.copyWith(completedOrders: arrayForCompleted));
      emit(state.copyWith(canceledOrders: arrayForCanceled));
      debugPrint("${state.waitConfirmOrders}");
      print("asd");
      // print(state.ReviewingOrders);
      emit(state.copyWith(loading: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  Future<void> GetInvoiceDetails(int id) async {
    try {
      inVoiceModel response = await getInvoiceRepo.Getinvoice(id);
      emit(state.copyWith(inVoice: response));

      print(response);
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////
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
    print(state.id);
    print(state.start_at);
    print(state.end_at);
    print(state.status);
    try {
      emit(state.copyWith(loadingUpdateResevation: true));
      print(state.loadingUpdateResevation);
      print(state.id);
      print(state.start_at);
      print(state.end_at);
      print(state.status);
      fieldsValidation();
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
      emit(state.copyWith(loadingUpdateResevation: false));

      emit(state.copyWith(showPoUp: true));
      print(response);
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(loadingUpdateResevation: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    // if (state.start_at == state.end_at) {
    //   throw ("لا يمكن حذف هذا الطلب");
    // }
  }
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////
Future<void> cacheData(UpdateInfoModel response) async {
  var userInfo;
  var jsonData;
  getAttributeFromSharedPreferences().then((value) {
    userInfo = value;
    jsonData = jsonDecode(userInfo);

    // Change the value of email
    jsonData["name"] = response.success.name;
    jsonData["city_id"] = response.success.cityId;
    jsonData["email"] = response.success.email;
    jsonData["image"] = response.success.image;
    jsonData["mobile"] = response.success.mobile;
    jsonData["gender"] = response.success.gender;

    print(jsonData);
    print("asdfasdf");

    // Save the updated jsonData object to the shared preferences
    CacheHelper.saveData(key: AppStrings.userInfo, value: jsonEncode(jsonData));
  });
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////

class GetPointsCubit extends Cubit<GetPointsState> {
  final GetPointsRepo getPointrepo;

  GetPointsCubit({required this.getPointrepo}) : super(GetPointsState());

  Future<void> GetMyPoints(BuildContext context) async {
    try {
      MyPointsModel response = await getPointrepo.GetPoints();
      print(response);
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

      print(response);
    } catch (e) {
      emit(state.copyWith(pointState: RequestState.failed));
      print(e.toString());
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

class evaluationCubit extends Cubit<evaluationsState> {
  final evaluationsRepo eevaluationsRepo;

  evaluationCubit({required this.eevaluationsRepo}) : super(evaluationsState());

  //?==================== formFields change ====================

  onRateChange(var value) => emit(state.copyWith(rate: value));
  onshowEvaluationPopUpChange() =>
      emit(state.copyWith(showEvaluationPopUp: state.showEvaluationPopUp + 1));

  Future<void> sendEvaluation(BuildContext context, var advertiser_id,
      var user_id, Function _onSendCommentPressed) async {
    try {
      Map<String, dynamic> body = {
        "advertiser_id": "${advertiser_id}",
        "user_id": "${user_id}",
        "rate": "${state.rate}",
      };

      evaluationsModel response =
          await eevaluationsRepo.sendEvaluation(body: body);
      emit(state.copyWith(showEvaluationPopUp: state.showEvaluationPopUp + 1));
      _onSendCommentPressed();
      Future.delayed(Duration(milliseconds: 700), () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
      print(response);
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.rate == null) {
      throw ("قم بتقييم الجلسة");
    }
  }
}

///////////////////////////////////

class ReportsCubit extends Cubit<ReportsState> {
  final ReportsRepo repositry;

  ReportsCubit({required this.repositry}) : super(ReportsState());

  //?==================== formFields change ====================

  // onRateChange(var value) => emit(state.copyWith(rate: value));

  Future<void> GetReports() async {
    try {
      Map<String, dynamic> body = {};

      ReportsModel response = await repositry.getReports(body: body);
      emit(state.copyWith(reportsForDoctors: response.success.doctorReports));
      emit(state.copyWith(reportsForPatient: response.success.reports));
      print("\\\\\\\\\\\\\\\\");
      print(state.reportsForDoctors);
      print("\\\\\\\\\\\\\\\\");
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}
}

///////////////////////////////////////////// NEW CLASS //////////////////////////////
class AddReportCubit extends Cubit<AddReportState> {
  final AddReportRepo repositry;

  AddReportCubit({required this.repositry}) : super(AddReportState());

  //?==================== formFields change ====================

  Future<void> sendReport(BuildContext context, var image, var title) async {
    List<File> images = [];
    images.add(image);
    print(title);
    print(images);
    try {
      Map<String, String> body = {};

      body['rep_title'] = title;

      AddReportModel response =
          await repositry.sendReport(body: body, Files: images);
      await context.read<ReportsCubit>().GetReports();
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
    } catch (e) {
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
