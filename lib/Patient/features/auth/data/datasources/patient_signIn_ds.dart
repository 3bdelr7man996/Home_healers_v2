import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class PatientSignInDS {
  final ApiBaseHelper apiHelper;

  PatientSignInDS({required this.apiHelper});

  Future<Map<String, dynamic>?> signUp({
    required Map<String, String> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      AppStrings.patientSignIn,
      body: body,
    );
    return response;
  }
}
