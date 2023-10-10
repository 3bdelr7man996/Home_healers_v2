import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class reservationDs {
  final ApiBaseHelper apiHelper;

  reservationDs({required this.apiHelper});

  Future<Map<String, dynamic>?> MakeReservation({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/reservation',
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> visaPayment({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.visaPayment,
      newBaseUrl: "https://testing.home-healers.com",
      queryParameters: body,
    );
    return response;
  }
}
