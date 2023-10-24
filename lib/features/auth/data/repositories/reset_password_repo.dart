import 'package:dr/features/auth/data/datasources/reset_password_ds.dart';
import 'package:dr/features/auth/data/models/forget_password_model.dart';

class ResetPasswordRepo {
  final ResetPasswordDS dataSource;

  ResetPasswordRepo({required this.dataSource});

  Future<ForgetPasswordModel>? resetPassword(
      {required Map<String, String> body}) async {
    ForgetPasswordModel? apiResponse = ForgetPasswordModel.fromJson(
        await dataSource.resetPassword(body: body));
    return apiResponse;
  }
}
