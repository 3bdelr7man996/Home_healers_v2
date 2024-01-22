import 'package:dr/core/utils/http_helper.dart';

class ShowNotificationDS {
  final ApiBaseHelper apiHelper;

  ShowNotificationDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetReports({
    required String id,
  }) async {
    Map<String, dynamic>? response = await apiHelper.get(
      '/api/reservaionGetByID?id=$id',
    );
    return response;
  }
}
