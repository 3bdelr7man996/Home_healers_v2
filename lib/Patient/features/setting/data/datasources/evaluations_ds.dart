import 'package:dr/core/utils/http_helper.dart';

class evaluationsDS {
  final ApiBaseHelper apiHelper;

  evaluationsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> sendEvaluation({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/user/evaluations',
      body: body,
    );
    return response;
  }
}
