import 'dart:developer';
import 'dart:io';

import 'package:dr/doctor/features/diagnose_report/data/datasources/diagnose_report_ds.dart';

class DiagnoseReportRepo {
  final DiagnosereportDs dataSource;

  DiagnoseReportRepo({required this.dataSource});

  Future<bool> submitFormReport({required Map<String, String> body}) async {
    Map<String, dynamic>? response =
        await dataSource.submitFormReport(body: body);
    if (response?['success'] == true && response?['data'] != null) {
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>?>? getDiagnoseSections() async {
    Map<String, dynamic>? response = await dataSource.getDiagnoseSections();
    if (response?['success'] == true) {
      return response?['data'];
    }
    return response;
  }

  Future<Map<String, dynamic>?> addFileReport(
      {required Map<String, String> body,
      required String fileKey,
      required List<File>? files}) async {
    Map<String, dynamic>? response = await dataSource.addFileReport(
        body: body, fileKey: fileKey, files: files);
    log("file key $fileKey file path ${files?.first.path}");
    return response;
  }
}
