import 'dart:io';

import 'package:dr/Patient/features/auth/data/datasources/patient_signUp_ds.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_info_ds.dart';
import 'package:dr/Patient/features/setting/data/models/update_info_model.dart';

class UpdateInfoRepo {
  final UpdateInfoDS dataSource;

  UpdateInfoRepo({required this.dataSource});

  Future<UpdateInfoModel> UpdateInfo(
      {required Map<String, String> body, required List<File> Files}) async {
    print("bodyyyy== $body");
    print(Files);
    UpdateInfoModel signUpResponse = UpdateInfoModel.fromJson(
      await dataSource.updateInfo(
        body: body,
        files: Files,
      ),
    );
    return signUpResponse;
  }
}
