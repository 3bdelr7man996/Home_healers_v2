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

  Future<Map<String, dynamic>?> deleteAcc({required int userId}) async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.delete_acc,
      newBaseUrl: AppStrings.divSecondUrl,
      queryParameters: {"account_id": "$userId"},
    );
    return response;
  }
}
