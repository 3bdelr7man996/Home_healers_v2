import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class DiagnosereportDs {
  final ApiBaseHelper apiHelper;

  DiagnosereportDs({required this.apiHelper});

  Future<Map<String, dynamic>?> submitFormReport(
      {required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await apiHelper.post(AppStrings.addDiagnoseReport, body: body);
    return response;
  }

  Future<Map<String, dynamic>?> getDiagnoseSections() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.diagnoseSections);
    return response;
  }

  Future<Map<String, dynamic>?> addFileReport(
      {required Map<String, String> body,
      required String fileKey,
      required List<File>? files}) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      AppStrings.addFileReport,
      body: body,
      fileKey: fileKey,
      files: files,
    );
    return response;
  }
}
