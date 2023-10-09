import 'package:dr/core/utils/http_helper.dart';

class AddFavoriteDS {
  final ApiBaseHelper apiHelper;

  AddFavoriteDS({required this.apiHelper});

  Future<Map<String, dynamic>?> addFavorite({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/addWish',
      body: body,
    );
    return response;
  }
}
