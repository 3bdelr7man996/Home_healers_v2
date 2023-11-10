import 'package:dr/core/utils/http_helper.dart';

class ReportsDS {
  final ApiBaseHelper apiHelper;

  ReportsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetReports({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/details',
      body: body,
    );
    return response;
  }
}
