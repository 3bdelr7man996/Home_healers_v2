import 'package:dr/doctor/features/notification/data/data_source/notifications_ds.dart';
import 'package:dr/doctor/features/notification/data/models/notifications_model.dart';

class NotificationsRepo {
  final NotificationsDs dataSource;

  NotificationsRepo({required this.dataSource});

  Future<List<Notifications>?> getAllNotifications() async {
    AdvNotifModel response =
        AdvNotifModel.fromJson(await dataSource.getAllNotifications());
    return response.notifications;
  }
}
