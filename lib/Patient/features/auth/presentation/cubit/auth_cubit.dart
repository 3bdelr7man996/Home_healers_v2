import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/auth/data/repositories/patient_signUp_repo.dart';
import 'package:dr/config/notifications_config/firebase_messages.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:dr/features/auth/presentation/pages/activate_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:dr/di_container.dart' as di;

import '../../data/models/sign_up_patient_model.dart';

part 'auth_state.dart';

class AuthCubitForPatient extends Cubit<AuthStateForPatient> {
  final SignUpPatientRepo signUpPatientRepo;

  AuthCubitForPatient({required this.signUpPatientRepo})
      : super(AuthStateForPatient());

  //?==================== formFields change ====================
  ///TO DETECT CURRENT LOCATION(LAT,LONG)
  Future<void> getCurrentPosition() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      log("location is ${position.latitude}");
      emit(state.copyWith(
          location: Location(
        lat: position.latitude,
        lng: position.longitude,
      )));

      // You can use latitude and longitude for your desired purpose.
      log("Latitude: ${state.location?.lat}, Longitude: ${position.longitude}");
    } catch (e) {
      log("Error: $e");
    }
  }

  void onAddressChange({
    String? address,
    Location? location,
  }) {
    print("current address $address");
    print("location ${location?.lng}");
    emit(state.copyWith(
      location: location,
      address: address,
    ));
  }

  onGenderChange(String gender) => emit(state.copyWith(gender: gender));
  onIsVisibleChange() => emit(state.copyWith(isVisible: !state.isVisible));
  oncountryCodeChange(String CountryCode) =>
      emit(state.copyWith(country_code: CountryCode));
  onNationalityChange(String nationality) =>
      emit(state.copyWith(nationality: nationality));

  onFNameChange(String fname) => emit(state.copyWith(firstName: fname));

  onLNameChange(String lname) => emit(state.copyWith(lastName: lname));

  onEmailChange(String email) => emit(state.copyWith(email: email));

  onCityChange(var CityId) => emit(state.copyWith(cityId: CityId));

  onPhoneChange(String phone) => emit(state.copyWith(phone: phone));
  onbirthdayChange(String birthday) => emit(state.copyWith(birthday: birthday));
  onageChange(String age) => emit(state.copyWith(age: age));

  onPassWordChange(String password) => emit(state.copyWith(password: password));

  onConfPassChange(String confirmPassword) =>
      emit(state.copyWith(confirmPassword: confirmPassword));

  showPassword() => emit(state.copyWith(obscurePass: !state.obscurePass));

  showConfPassword() =>
      emit(state.copyWith(obscureConfPass: !state.obscureConfPass));

  onIdentificationChange(String identity) =>
      emit(state.copyWith(identificationNum: identity));

  onTermChange(bool? newValue) => emit(state.copyWith(term: !state.term));
  onRequestStatusChange() =>
      {emit(state.copyWith(requestStatus: !state.requestStatus))};

  // showPopUpAfterSignUp() => emit(state.copyWith(isVisible: !state.isVisible));
  //?====================[  SIGN UP NEW ACC  ]==========================
  SignUpForPatientModel? patient;

  ///Register new patient
  Future<void> signUpPatient(BuildContext context) async {
    try {
      fieldsValidation();
      var inputFormat = DateFormat('MM/dd/yyyy', "en");
      var outputFormat = DateFormat('yyyy-MM-dd', "en");

      var parsedDate = inputFormat.parse(state.birthday);
      var formattedDate = outputFormat.format(parsedDate);

      Map<String, String> body = {
        "name": "${state.firstName} ${state.lastName}",
        "email": "${state.email}",
        "mobile": "${state.phone}",
        "gender": "${state.gender}",
        "password": "${state.password}",
        "c_password": "${state.confirmPassword}",
        "city_id": "${state.cityId}",
        "line1": "${state.location?.lat}",
        "line2": "${state.location?.lng}",
        "nationality": "${state.nationality}",
        "age": "${state.age}",
        "birthday": "${formattedDate}",
        "country_code": "${state.country_code}",
        "region": "${state.address}",
        "national_id": "${state.identificationNum}",
        "fcm_token":
            await di.sl<FirebaseMessagingService>().getFirebaseToken() ?? ""
      };

      emit(state.copyWith(
        registerState: RequestState.loading,
        requestStatus: true,
      ));
      patient = await signUpPatientRepo.signUP(body: body);
      print(patient);
      AppConstants.customNavigation(
          context,
          ActivateAccountScreen(
            email: state.email!,
            isAdvertise: false,
            cacheData: cacheData,
          ),
          0,
          0);

      //await cacheData(response);
      emit(state.copyWith(requestStatus: false));
      FirebaseAnalyticUtil.logSignUpEvent();
      log("Register Success");
    } catch (e) {
      print(e);
      emit(state.copyWith(requestStatus: false));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    emit(state.copyWith(requestStatus: !state.requestStatus));

    if (state.gender == null || state.gender!.isEmpty) {
      throw ("gender_required".tr());
    }
    if (state.password != state.confirmPassword &&
        state.password != null &&
        state.confirmPassword != null) {
      throw ("لا يوجد مطابقة في كلمة السر");
    }
    if (state.term == false) {
      throw ("accept_term".tr());
    }
    if (state.phone == false) {
      throw ("ادخل رقم الموبايل");
    }
    if (state.firstName == null) {
      throw ("ادخل الاسم الأول");
    }
    if (state.password == null) {
      throw ("ادخل كلمة السر");
    }
    if (state.confirmPassword == null) {
      throw ("ادخل تأكيد كلمة السر ");
    }
    if (state.lastName == null) {
      throw ("ادخل الاسم الثاني");
    }
    if (state.email == null) {
      throw ("ادخل  الايميل");
    }
    if ((!RegExp(r'^[\w-.]+@([\w-]+.)+[\w]{2,4}').hasMatch(state.email!))) {
      throw ("البريد الالكتروني غير صحيح");
    }
    if (state.city_id == null) {
      throw ("ادخل  رقم الهوية");
    }
    if (state.cityId == null) {
      throw ("اختر مدينتك");
    }
    if (state.address == null) {
      throw ("حدد موقعك");
    }
    if (state.nationality == null) {
      throw ("حدد جنسيتك");
    }
    if (state.country_code == null) {
      throw ("حدد رمز مدينتك");
    }
    if (state.identificationNum?.length != 10 ||
        state.identificationNum?.length != 14) {
      throw ("تأكد من رقم الهوية ");
    }
  }

  /// save user data in local
  Future<void> cacheData({BuildContext? context}) async {
    if (patient != null) {
      print("Token");
      print(patient!.success.token);
      await CacheHelper.saveData(
          key: AppStrings.userInfo,
          value: jsonEncode(patient!.success.toJson()));
      await CacheHelper.saveData(
        key: AppStrings.userToken,
        value: patient!.success.token,
      );
      await CacheHelper.saveData(
        key: AppStrings.isAdvertise,
        value: false,
      );
      di.sl<ApiBaseHelper>().updateHeader();
    }
  }

  ///get user info from local data
  Map<String, dynamic> userInfo() {
    final String stringUser = CacheHelper.getData(key: AppStrings.userInfo);
    print(stringUser);
    Map<String, dynamic> user = jsonDecode(stringUser);
    return user;
  }

  ///get user info as model
  UserData getUserInfo() {
    Map<String, dynamic> info = userInfo();
    return UserData.fromJson(info);
  }

  /// check if user login or not
  bool hasToken() {
    final String token = CacheHelper.getData(key: AppStrings.userToken) ?? "";
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
