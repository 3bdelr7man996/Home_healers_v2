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
}
