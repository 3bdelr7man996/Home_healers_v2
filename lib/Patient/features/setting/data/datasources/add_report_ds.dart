import 'dart:io';

import 'package:dr/core/utils/http_helper.dart';

class AddReportDS {
  final ApiBaseHelper apiHelper;

  AddReportDS({required this.apiHelper});

  Future<Map<String, dynamic>?> sendReport({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
  }) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      "/api/user/addReport",
      body: body,
      fileKey: "rep_image",
      files: files,
    );

    return response;
  }
}
