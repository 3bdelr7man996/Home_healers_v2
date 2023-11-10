import 'package:dr/Patient/features/setting/data/datasources/reports_ds.dart';
import 'package:dr/Patient/features/setting/data/models/reports_model.dart';

class ReportsRepo {
  final ReportsDS dataSource;

  ReportsRepo({required this.dataSource});

  Future<ReportsModel> getReports({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    ReportsModel getReposts = ReportsModel.fromJson(
      await dataSource.GetReports(
        body: body,
      ),
    );
    return getReposts;
  }
}
