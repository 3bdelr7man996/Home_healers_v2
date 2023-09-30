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

  Future<Map<String, dynamic>?> getReservationDetails() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.reservationDetails);
    return response;
  }

  Future<Map<String, dynamic>?> updateResevation(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post(AppStrings.advUpdateReservation, body: body);
    return response;
  }
}
