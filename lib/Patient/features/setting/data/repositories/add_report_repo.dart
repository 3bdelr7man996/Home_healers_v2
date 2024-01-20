import 'dart:io';

import 'package:dr/Patient/features/setting/data/datasources/add_report_ds.dart';
import 'package:dr/Patient/features/setting/data/models/add_report_model.dart';

class AddReportRepo {
  final AddReportDS dataSource;

  AddReportRepo({required this.dataSource});

  Future<AddReportModel> sendReport(
      {required Map<String, String> body, required List<File> Files}) async {
    AddReportModel signUpResponse = AddReportModel.fromJson(
      await dataSource.sendReport(
        body: body,
        files: Files,
      ),
    );
    return signUpResponse;
  }
}
