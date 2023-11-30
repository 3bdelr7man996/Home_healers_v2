import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class ReservationOrdersDS {
  final ApiBaseHelper apiHelper;

  ReservationOrdersDS({required this.apiHelper});

  Future<Map<String, dynamic>?> getResOrdersStatus() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.resOrdersStatus);
    return response;
  }

  Future<Map<String, dynamic>?> getStatusReservations(
      {required int statusId}) async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.statusReservations, queryParameters: {
      'status_id': '$statusId',
    });
    return response;
  }

  Future<Map<String, dynamic>?> updateResevation(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post(AppStrings.advUpdateReservation, body: body);
    return response;
  }

  Future<Map<String, dynamic>?> getReservDetails({required reservId}) async {
    Map<String, dynamic>? response = await apiHelper.get(
        AppStrings.reservationDetails,
        queryParameters: {"id": "$reservId"});
    return response;
  }
}
