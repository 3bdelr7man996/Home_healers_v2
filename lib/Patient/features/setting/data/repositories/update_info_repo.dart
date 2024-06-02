import 'dart:io';

import 'package:dr/Patient/features/setting/data/datasources/update_info_ds.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/features/auth/data/models/user_model.dart';

class UpdateInfoRepo {
  final UpdateInfoDS dataSource;

  UpdateInfoRepo({required this.dataSource});

  Future<UserModel> UpdateInfo(
      {required Map<String, String> body, required List<File> Files}) async {
    print("bodyyyy== $body");
    print(Files);
    UserModel signUpResponse = UserModel.fromJson(
      await dataSource.updateInfo(
        body: body,
        files: Files,
      ),
    );
    return signUpResponse;
  }

  Future<List<CityData>>? getCitiesArea() async {
    CitiesAreaModel response =
        CitiesAreaModel.fromJson(await dataSource.getAllCitiesArea());
    return response.data;
  }
}
