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
}