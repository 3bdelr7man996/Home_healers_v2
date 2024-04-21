import 'package:dr/core/utils/app_strings.dart';
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

  //ACTIVATE ACCOUNT
  Future<Map<String, dynamic>?> activateAccount(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response = await apiHelper.post(
      AppStrings.activate_acc,
      body: body,
    );
    return response;
  }

  //RESEND CODE TO EMAIL
  Future<Map<String, dynamic>?> resendCode(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response = await apiHelper.post(
      AppStrings.forget_pass,
      body: body,
    );
    return response;
  }

  //RESET PASSWORD
  Future<Map<String, dynamic>?> resetPassword(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/api/resetPassword", body: body);
    return response;
  }
}
