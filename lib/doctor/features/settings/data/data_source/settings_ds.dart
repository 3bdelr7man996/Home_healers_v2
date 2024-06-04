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
    Map<String, dynamic>? response = await apiHelper.post(
      AppStrings.appInfo,
    );
    return response;
  }

  Future<Map<String, dynamic>?> doctorPoints() async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.doctorsPoints,
    );
    return response;
  }

  Future<Map<String, dynamic>?> changePassword(body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      '/api/resetAuthUserPassword',
      body: body,
    );

    return response;
  }

  Future<Map<String, dynamic>?> changeActiveStatus({required status}) async {
    Map<String, dynamic>? response =
        await apiHelper.post(AppStrings.activeStatus, body: {
      "status": status,
    });
    return response;
  }
}
