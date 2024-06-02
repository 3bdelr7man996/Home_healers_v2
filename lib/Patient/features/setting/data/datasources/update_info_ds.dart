import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class UpdateInfoDS {
  final ApiBaseHelper apiHelper;

  UpdateInfoDS({required this.apiHelper});

  ///REGISTER NEW Patient
  Future<Map<String, dynamic>?> updateInfo({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
    List<File>? documents,
    String? documentsKey,
  }) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      "/api/user/update",
      body: body,
      fileKey: "image",
      files: files!.length == 0 ? null : files,
      documents: documents,
      documentsKey: documentsKey,
    );
    return response;
  }

  ///GET ALL Cities & area
  Future<Map<String, dynamic>?> getAllCitiesArea() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.advAllCities);
    return response;
  }
}
