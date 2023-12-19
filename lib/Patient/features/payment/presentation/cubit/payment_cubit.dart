import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/Patient/features/payment/data/models/response_model.dart';
import 'package:dr/Patient/features/payment/data/models/visa_pay_model.dart';
import 'package:dr/Patient/features/payment/data/models/wallet_balance_model.dart';
import 'package:dr/Patient/features/payment/data/repositories/payment_repo.dart';
import 'package:dr/Patient/features/payment/presentation/widgets/dialogs_widgets/confirm_pay_dialog.dart';
import 'package:dr/Patient/features/payment/presentation/widgets/dialogs_widgets/exit_payment_dialog.dart';
import 'package:dr/Patient/features/payment/presentation/widgets/points_bott/earn_points_bottom_sheet.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/http_custom_exception.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.repository}) : super(const PaymentState());
  final PaymentRepository repository;

  void onSelectPayTypeRadioButton(int? index) =>
      emit(state.copyWith(selectedPayIndexRadio: () => index));
  //?============================[ PAY BY VISA ]================================
  Future<bool> payByVisa({required int reservationParentId}) async {
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
      return true;
    } catch (e) {
      emit(state.copyWith(payState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
      return false;
    }
  }

  //?============================[ PAY BY TAMARA ]==============================

  Future<bool> payByTamara({required int reservationParentId}) async {
    try {
      emit(state.copyWith(payState: RequestState.loading));
      VisaPayModel? payResponse = await repository.tamaraPayment({
        "parent_id": "$reservationParentId",
      });
      emit(state.copyWith(
        payState: RequestState.success,
        visaUrl: payResponse?.redirectUrl,
        payId: payResponse?.paymentId,
      ));
      return true;
    } catch (e) {
      emit(state.copyWith(payState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
      return false;
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

  void onSelectPayCard(PayCard type) {
    if (state.payState != RequestState.loading) {
      emit(state.copyWith(selectedPayCard: () => type));
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
      ResponseModel? response = await repository.visaPayResult(fullUrl: path);
      if (response.paySuccess == true) {
        //Map<String, dynamic>? statusResponse =
        await repository.confirmReservationStatus(myOrder: myOrder);
        FirebaseAnalyticUtil.logGoToCheckoutSuccessEvent();

        // log("order Status ${statusResponse}");
        //log("order ${statusResponse}")
      } else {
        FirebaseAnalyticUtil.logGoToCheckoutFailedEvent();
      }
      if (context.mounted) {
        AppConstants.pushRemoveNavigator(context,
            screen: HomeScreenForPatient(
              selectedIndex: 2,
            ));
      }
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => ConfirmPayDialog(
            order: myOrder,
            paymentResponse: response,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?=============================[ PAY BY WALLET]==============================
  ///PAY BY WALLET
  Future<void> payByWallet(
    BuildContext context, {
    required OrderData order,
  }) async {
    try {
      emit(state.copyWith(payWalletState: RequestState.loading));
      ResponseModel response = await repository.payByWallet(parentId: order.id);
      emit(state.copyWith(payWalletState: RequestState.success));

      if (response.paySuccess == true) {
        await repository.confirmReservationStatus(myOrder: order);
        if (context.mounted) {
          AppConstants.pushRemoveNavigator(context,
              screen: HomeScreenForPatient(
                selectedIndex: 2,
              ));
        }
      }

      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => ConfirmPayDialog(
            order: order,
            paymentResponse: response,
          ),
        );
      }
    } on BadRequestException catch (e) {
      emit(state.copyWith(payWalletState: RequestState.failed));
      log(e.toString());
      if (e.toString().contains('Your balance is insufficient')) {
        if (context.mounted) {
          showCupertinoDialog(
            context: context,
            builder: (context) => ConfirmPayDialog(
              order: order,
              paymentResponse: ResponseModel(
                paySuccess: false,
                message: "balance_is_insufficient".tr(),
              ),
            ),
          );
        }
      }
    } catch (e) {
      emit(state.copyWith(payWalletState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?============================[ EARN NEW POINTS ]============================

  ///SHOW BOTTOMSHEET TO EARN POINTS
  void showBottomSheetForEarnPoints(
    BuildContext context, {
    required String? title,
    required String? body,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SheetForEarnMoney(
          title: title,
          body: body,
        );
      },
    );
  }

//?=========================[GET WALLET BALANCE]================================
  Future<void> getBalance() async {
    try {
      emit(state.copyWith(balanceState: RequestState.loading));
      WalletBalanceModel? response = await repository.getWalletBalance();
      emit(state.copyWith(
        balanceState: RequestState.success,
        walletBalance: response?.walletBalance ?? "0",
      ));
    } catch (e) {
      emit(state.copyWith(
        balanceState: RequestState.failed,
        walletBalance: "0",
      ));
    }
  }
}
// RESPONSE[400] => DATA: 
// {
// "status":true,
// "message":"The payment was completed successfully",
//}