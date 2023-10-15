import 'package:dr/core/utils/http_helper.dart';

class GetAllAdsDS {
  final ApiBaseHelper apiHelper;
  GetAllAdsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> getAllAds() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/api/ads",
    );
    return response;
  }
}
