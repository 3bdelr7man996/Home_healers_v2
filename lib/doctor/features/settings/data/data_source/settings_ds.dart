import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class SettingsDs {
  final ApiBaseHelper apiHelper;

  SettingsDs({required this.apiHelper});

  Future<Map<String, dynamic>?> pushPullDocuments({List<File>? files}) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      AppStrings.advCertification,
      body: {},
      fileKey: "images[0]",
      files: files,
    );
    return response;
  }

  Future<Map<String, dynamic>?> appInfo() async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.appInfo,
    );
    return response;
  }
}
