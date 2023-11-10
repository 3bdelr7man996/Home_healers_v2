import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class PaymentDataSource {
  final ApiBaseHelper apiHelper;

  PaymentDataSource({required this.apiHelper});

  Future<Map<String, dynamic>?> visaPayment({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.visaPayment,
      newBaseUrl: AppStrings.visaBaseUrl,
      queryParameters: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> tamaraPayment({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.tamaraPayment,
      newBaseUrl: AppStrings.visaBaseUrl,
      queryParameters: body,
    );
    return response;
  }

  ///GET RESULT OF VISA PAYMENT BY SEND RETURNED URL FROM WEB VIEW AS GET REQUEST
  Future<Map<String, dynamic>?> visaPayResult({
    required String url,
  }) async {
    Map<String, dynamic>? response = await apiHelper.get(
      "",
      newBaseUrl: url,
    );
    return response;
  }

  Future<Map<String, dynamic>?> updateReservationStatus({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      AppStrings.pUpdateReservation,
      body: body,
    );
    return response;
  }
}
