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

  Future<Map<String, dynamic>?> addFavorite({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/addWish',
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> removeFavorite({
    required int id,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/deleteWish/$id',
    );
    return response;
  }
}
