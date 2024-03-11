import 'package:dr/features/auth/data/models/activation_model.dart';
import 'package:dr/features/auth/data/datasources/forget_password_ds.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';

class ForgetPasswordRepo {
  final ForgetPasswordDs dataSource;

  ForgetPasswordRepo({required this.dataSource});

  Future<ForgetPasswordModel>? forgetPassword(
      {required Map<String, String> body}) async {
    ForgetPasswordModel? apiResponse = ForgetPasswordModel.fromJson(
        await dataSource.forgetPassword(body: body));
    return apiResponse;
  }

  //?======================[ ACTIVATE ACCOUNT ]======================
  Future<ActivationModel>? activateAccount(
      {required Map<String, String> body}) async {
    ActivationModel response =
        ActivationModel.fromJson(await dataSource.activateAccount(body: body));
    return response;
  }

  //?======================[ RESEND VERFICATION CODE ]======================
  Future<String>? resendCode({required Map<String, String> body}) async {
    Map<String, dynamic>? response = await dataSource.resendCode(body: body);

    return response?['message'];
  }

  //?=======================[ RESET PASSWORD ]===============================
  Future<ForgetPasswordModel>? resetPassword(
      {required Map<String, String> body}) async {
    ForgetPasswordModel? apiResponse = ForgetPasswordModel.fromJson(
        await dataSource.resetPassword(body: body));
    return apiResponse;
  }
}
