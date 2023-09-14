import 'dart:developer';
import 'dart:io';

import 'package:dr/doctor/features/auth/data/data_source/advertise_signup_ds.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/doctor/features/auth/data/model/departements_model.dart';
import 'package:dr/doctor/features/auth/data/model/sign_up_adv_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';

class SignUpAdvertiserRepo {
  final AdvertiseSignUpDS dataSource;

  SignUpAdvertiserRepo({required this.dataSource});

  Future<SignUpAdvertiseModel> signUP({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
    List<File>? documents,
    String? documentsKey,
  }) async {
    log("bodyyyy== $body");
    SignUpAdvertiseModel signUpResponse = SignUpAdvertiseModel.fromJson(
      await dataSource.signUp(
        body: body,
        files: files,
        documents: documents,
        documentsKey: documentsKey,
        fileKey: fileKey,
      ),
    );
    return signUpResponse;
  }

  //?======================[ GET ALL DEPARTEMENTS ]======================
  Future<List<Categories>>? getAllDepartements() async {
    Map<String, dynamic>? response = await dataSource.getAllDepartements();
    List<Categories> departList = [];
    if (response?['success'] == true) {
      for (int i = 0; i < response?['data'].length; i++) {
        departList.add(
          Categories.fromJson(response?['data'][i]),
        );
      }
    }
    return departList;
  }

  //?======================[ GET ALL STATUS ]======================
  Future<List<StatusData>>? getAllStatus() async {
    StatusModel response =
        StatusModel.fromJson(await dataSource.getAllStatus());
    return response.statusData;
  }

  //?======================[ GET ALL CITIES & AREAS ]======================
  Future<List<CityData>>? getCitiesArea() async {
    CitiesAreaModel response =
        CitiesAreaModel.fromJson(await dataSource.getAllCitiesArea());
    return response.data;
  }
}
