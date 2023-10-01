import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class LoginDs {
  final ApiBaseHelper apiHelper;

  LoginDs({required this.apiHelper});

  Future<Map<String, dynamic>?> userLogin(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post(AppStrings.userSignIn, body: body);
    return response;
  }
}
