import 'package:dr/Patient/features/setting/data/datasources/show_notification_ds.dart';
import 'package:dr/Patient/features/setting/data/models/reports_model.dart';

class ShowNotificationRepo {
  final ShowNotificationDS dataSource;

  ShowNotificationRepo({required this.dataSource});

  Future ShowNotification({required String id}) async {
    var getReposts = await dataSource.GetReports(
      id: id,
    );
    return getReposts;
  }
}
