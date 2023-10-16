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
}
