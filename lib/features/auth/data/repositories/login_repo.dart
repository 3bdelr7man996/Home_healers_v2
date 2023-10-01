import 'package:dr/features/auth/data/datasources/login_ds.dart';
import 'package:dr/features/auth/data/models/user_model.dart';

class LoginRepo {
  final LoginDs dataSource;

  LoginRepo({required this.dataSource});

  Future<UserModel>? userLogin({required Map<String, String> body}) async {
    UserModel? apiResponse =
        UserModel.fromJson(await dataSource.userLogin(body: body));
    return apiResponse;
  }
}
