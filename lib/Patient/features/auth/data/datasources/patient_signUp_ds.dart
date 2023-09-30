import 'dart:io';

import 'package:dr/core/utils/http_helper.dart';

class PatientSignUpDS {
  final ApiBaseHelper apiHelper;

  PatientSignUpDS({required this.apiHelper});

  ///REGISTER NEW Patient
  Future<Map<String, dynamic>?> signUp({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
    List<File>? documents,
    String? documentsKey,
  }) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      "/api/user/register",
      body: body,
      fileKey: fileKey ?? "",
      files: files,
      documents: documents,
      documentsKey: documentsKey,
    );
    return response;
  }
}
