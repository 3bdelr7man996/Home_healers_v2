import 'package:dr/core/utils/http_helper.dart';

class MyPointsDS {
  final ApiBaseHelper apiHelper;

  MyPointsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetPoints() async {
    Map<String, dynamic>? response = await apiHelper.get("/api/user/getWallet");
    return response;
  }
}
