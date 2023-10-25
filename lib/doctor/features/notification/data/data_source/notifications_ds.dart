import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class NotificationsDs {
  final ApiBaseHelper apiHelper;

  NotificationsDs({required this.apiHelper});

  Future<Map<String, dynamic>?> getAllNotifications() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.allNotifications);
    return response;
  }
}
