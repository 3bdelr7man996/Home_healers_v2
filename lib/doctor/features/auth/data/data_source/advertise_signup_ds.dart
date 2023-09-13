import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class AdvertiseSignUpDS {
  final ApiBaseHelper apiHelper;

  AdvertiseSignUpDS({required this.apiHelper});

  ///REGISTER NEW ADVERTISER
  Future<Map<String, dynamic>?> signUp({
    required Map<String, dynamic> body,
    required String fileKey,
    required List<File>? files,
    required List<File>? documents,
    required String? documentsKey,
  }) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      AppStrings.advertiseSignUp,
      body: body,
      fileKey: fileKey,
      files: files,
      documents: documents,
      documentsKey: documentsKey,
    );
    return response;
  }

  ///GET ALL DEPARTEMENT
  Future<Map<String, dynamic>?> getAllDepartements() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.advDepartments);
    return response;
  }

  ///GET ALL Status
  Future<Map<String, dynamic>?> getAllStatus() async {
    Map<String, dynamic>? response = await apiHelper.get(AppStrings.advStatus);
    return response;
  }

  ///GET ALL Cities & area
  Future<Map<String, dynamic>?> getAllCitiesArea() async {
    Map<String, dynamic>? response =
        await apiHelper.get(AppStrings.advAllCities);
    return response;
  }
}
