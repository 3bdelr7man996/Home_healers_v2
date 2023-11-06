import 'dart:io';

import 'package:dr/core/utils/http_helper.dart';

class AddReportDS {
  final ApiBaseHelper apiHelper;

  AddReportDS({required this.apiHelper});

  ///REGISTER NEW Patient
  Future<Map<String, dynamic>?> sendReport({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
    List<File>? documents,
    String? documentsKey,
  }) async {
    print("//////");
    print(files.runtimeType);
    print(body.runtimeType);
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      "/api/user/addReport",
      body: body,
      fileKey: "rep_image",
      files: files,
      documents: documents,
      documentsKey: documentsKey,
    );
    print("asdfasdfasdfasdfasdfasdf");
    print(response);
    return response;
  }
}
