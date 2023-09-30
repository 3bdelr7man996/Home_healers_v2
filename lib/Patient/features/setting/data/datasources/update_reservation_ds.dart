import 'package:dr/core/utils/http_helper.dart';

class UpdateReservationDS {
  final ApiBaseHelper apiHelper;

  UpdateReservationDS({required this.apiHelper});

  Future<Map<String, dynamic>?> updateReservation({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/updateReservation',
      body: body,
    );
    return response;
  }
}
