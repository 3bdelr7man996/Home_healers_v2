import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/Patient/features/payment/data/models/visa_pay_model.dart';
import 'package:dr/Patient/features/payment/data/repositories/payment_repo.dart';
import 'package:dr/Patient/features/payment/presentation/widgets/dialogs_widgets/confirm_pay_dialog.dart';
import 'package:dr/Patient/features/payment/presentation/widgets/dialogs_widgets/exit_payment_dialog.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.repository}) : super(const PaymentState());
  final PaymentRepository repository;
  //?============================[ PAY BY VISA ]================================
  Future<void> payByVisa({required int reservationParentId}) async {
    try {
      emit(state.copyWith(payState: RequestState.loading));
      VisaPayModel? payResponse = await repository.visaPayment({
        "parent_id": "$reservationParentId",
      });
      emit(state.copyWith(
        payState: RequestState.success,
        visaUrl: payResponse?.redirectUrl,
        payId: payResponse?.paymentId,
      ));
    } catch (e) {
      emit(state.copyWith(payState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  void resetPayData() {
    emit(state.copyWith(
      selectedPayType: () => null,
      payState: RequestState.initial,
      visaUrl: "",
      payId: "",
    ));
  }

  void onSelectPayType(PayType type) {
    if (state.payState != RequestState.loading) {
      emit(state.copyWith(selectedPayType: () => type));
    }
  }

  ///when exit from payment process
  Future<bool> exitApp(
    BuildContext context, {
    required InAppWebViewController? controllerGlobal,
  }) async {
    //log("can go back${controllerGlobal.canGoBack()}");
    if (await controllerGlobal!.canGoBack()) {
      controllerGlobal.goBack();
      return Future.value(false);
    } else {
      if (context.mounted) {
        Navigator.pop(context);
      }
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => const CancelPayDialog(),
        );
      }
      return Future.value(true);
    }
  }

  Future<void> getVisaResponse(
    BuildContext context, {
    required String path,
    required OrderData myOrder,
  }) async {
    try {
      //String? result =
      await repository.visaPayResult(fullUrl: path);
      if (context.mounted) {
        AppConstants.pushRemoveNavigator(context,
            screen: HomeScreenForPatient(
              selectedIndex: 2,
            ));
      }
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => ConfirmPayDialog(order: myOrder),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}