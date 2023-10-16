import 'package:dr/core/utils/http_helper.dart';

class ReservationWithOfferDS {
  final ApiBaseHelper apiHelper;

  ReservationWithOfferDS({required this.apiHelper});

  Future<Map<String, dynamic>?> MakeReservationWithOffer({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/reservationWithOffer',
      body: body,
    );
    return response;
  }
}
