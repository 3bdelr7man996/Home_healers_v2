import 'package:dr/core/utils/http_helper.dart';

class FavoriteDS {
  final ApiBaseHelper apiHelper;
  FavoriteDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetFavorite() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/api/user/wishes",
    );
    return response;
  }
}
