import 'package:dr/core/utils/http_helper.dart';

class GetOffersDS {
  final ApiBaseHelper apiHelper;

  GetOffersDS({required this.apiHelper});

  Future<Map<String, dynamic>?> getOffers() async {
    Map<String, dynamic>? response = await apiHelper.get("/api/getOffers");
    return response;
  }
}
