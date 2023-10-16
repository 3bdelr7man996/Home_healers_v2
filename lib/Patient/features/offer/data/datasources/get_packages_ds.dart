import 'package:dr/core/utils/http_helper.dart';

class GetPackagesDS {
  final ApiBaseHelper apiHelper;

  GetPackagesDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetPackages() async {
    Map<String, dynamic>? response = await apiHelper.get("/api/getPackages");
    return response;
  }
}
