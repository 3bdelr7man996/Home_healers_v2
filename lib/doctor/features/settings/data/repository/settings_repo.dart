import 'dart:io';

import 'package:dr/doctor/features/settings/data/data_source/settings_ds.dart';
import 'package:dr/doctor/features/settings/data/models/app_info_model.dart';
import 'package:dr/doctor/features/settings/data/models/documents_model.dart';

class SettingsRepo {
  final SettingsDs dataSource;

  SettingsRepo({required this.dataSource});

  Future<List<String>?>? pushPullDocuments({List<File>? files}) async {
    DocumentsModel response = DocumentsModel.fromJson(
        await dataSource.pushPullDocuments(files: files));
    return response.success?.images;
  }

  Future<InfoData?>? appInfo() async {
    AppInfoModel response =
        AppInfoModel.fromJson(await dataSource.pushPullDocuments());
    return response.data;
  }
}
