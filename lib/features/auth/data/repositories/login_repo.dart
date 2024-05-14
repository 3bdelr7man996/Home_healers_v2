import 'package:dr/features/auth/data/datasources/login_ds.dart';
import 'package:dr/features/auth/data/models/user_model.dart';

class LoginRepo {
  final LoginDs dataSource;

  LoginRepo({required this.dataSource});

  Future<UserModel>? userLogin({required Map<String, String> body}) async {
    print("body is $body");
    UserModel? apiResponse =
        UserModel.fromJson(await dataSource.userLogin(body: body));
    return apiResponse;
  }

  Future<String> deleteAcc({required int userId}) async {
    Map<String, dynamic>? apiResponse =
        await dataSource.deleteAcc(userId: userId);
    return apiResponse?['message'] ?? "فشل حذف الحساب";
  }
}
