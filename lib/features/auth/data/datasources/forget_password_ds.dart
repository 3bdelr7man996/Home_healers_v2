import 'package:dr/core/utils/http_helper.dart';

class ForgetPasswordDs {
  final ApiBaseHelper apiHelper;

  ForgetPasswordDs({required this.apiHelper});

  Future<Map<String, dynamic>?> forgetPassword(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/api/forgetPassword", body: body);
    return response;
  }
}
