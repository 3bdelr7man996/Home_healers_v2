import 'package:dr/core/utils/http_helper.dart';

class ResetPasswordDS {
  final ApiBaseHelper apiHelper;

  ResetPasswordDS({required this.apiHelper});

  Future<Map<String, dynamic>?> resetPassword(
      {required Map<String, String> body}) async {
    print(body);
    Map<String, dynamic>? response =
        await apiHelper.post("/api/resetPassword", body: body);
    return response;
  }
}
