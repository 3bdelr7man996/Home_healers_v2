import 'package:dr/Patient/features/payment/data/datasources/payment_ds.dart';
import 'package:dr/Patient/features/payment/data/models/response_model.dart';
import 'package:dr/Patient/features/payment/data/models/visa_pay_model.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:easy_localization/easy_localization.dart';

class PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepository({required this.dataSource});

  Future<VisaPayModel>? visaPayment(
    Map<String, dynamic> body,
  ) async {
    Map<String, dynamic>? response = await dataSource.visaPayment(body: body);
    return VisaPayModel.fromJson(response);
  }

  Future<VisaPayModel>? tamaraPayment(
    Map<String, dynamic> body,
  ) async {
    Map<String, dynamic>? response = await dataSource.tamaraPayment(body: body);
    return VisaPayModel.fromJson(response);
  }

  Future<ResponseModel> visaPayResult({
    required String fullUrl,
  }) async {
    ResponseModel response =
        ResponseModel.fromJson(await dataSource.visaPayResult(url: fullUrl));
    ResponseModel payResponse;
    if (response.status != null && response.status!.isNotEmpty) {
      if (response.status == "faild payment") {
        payResponse = ResponseModel(
          paySuccess: false,
          message: "reservation_failed".tr(),
        );
      } else {
        payResponse = ResponseModel(
          paySuccess: true,
          message: "reservation_been_confirmed".tr(),
        );
      }
    } else if (response.success != null &&
        response.message != null &&
        response.success!.isNotEmpty &&
        response.message!.isNotEmpty) {
      if (response.success!.contains("true") &&
          response.message!.contains("Message payment sucess")) {
        payResponse = ResponseModel(
          paySuccess: true,
          message: "reservation_been_confirmed".tr(),
        );
      } else {
        payResponse = ResponseModel(
          paySuccess: false,
          message: "reservation_failed".tr(),
        );
      }
    } else {
      payResponse = ResponseModel(
        paySuccess: false,
        message: "reservation_failed".tr(),
      );
    }
    return payResponse;
  }

  Future<Map<String, dynamic>?> confirmReservationStatus(
      {required OrderData myOrder}) async {
    Map<String, dynamic>? response =
        await dataSource.updateReservationStatus(body: {
      'id': '${myOrder.id}',
      'start_at': '${myOrder.startAt}',
      'end_at': '${myOrder.endAt}',
      'status': 'confirmed'
    });
    return response;
  }

  Future<ResponseModel> payByWallet({required int parentId}) async {
    Map<String, dynamic>? respone =
        await dataSource.payByWallet(parentId: parentId);
    return ResponseModel(
      paySuccess: respone?['status'],
      message: respone?['message'] == "Your balance is insufficient"
          ? "balance_is_insufficient".tr()
          : respone?['status'] == true
              ? "reservation_been_confirmed".tr()
              : "reservation_failed".tr(),
    );
  }
}
