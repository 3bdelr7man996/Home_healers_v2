import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/doctor/features/auth/data/model/departements_model.dart';
import 'package:dr/doctor/features/auth/data/model/sign_up_adv_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:map_location_picker/map_location_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpAdvertiserRepo signUpAdverRepo;
  AuthCubit({required this.signUpAdverRepo}) : super(AuthState());

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

  //?==================== formFields change ====================
  ///TO GET SELECTED ADDRESS
  void onAddressChange({
    String? address,
    Location? location,
  }) {
    log("current address $address");
    emit(state.copyWith(
      location: location,
      address: address,
    ));
  }

  onGenderChange(String gender) => emit(state.copyWith(gender: gender));

  ///////////Editing By Ghaith///////////////////
  onAreasChange(String value) {
    if (state.citiesList != null) {
      List areas = state.citiesList!
          .map((city) {
            if (city.nameAr == value) {
              return city.area!.map((area) {
                return {
                  "name": area.nameAr,
                  "id": area.id,
                };
              }).toList();
            } else {
              return null;
            }
          })
          .where((element) => element != null)
          .toList();
      if (areas != null) areas = areas[0] as List<dynamic>;
      emit(state.copyWith(areasList: areas));
    }
  }

  onSelectCategory(int id) {
    List<int>? selectedCateg = state.selectedCategories?.toList() ?? [];
    var allCateg = state.departemensList?.toList();
    bool isChecked = selectedCateg.contains(id);
    if (!isChecked) {
      selectedCateg.add(id);
      emit(state.copyWith(
          selectedCategories: selectedCateg, departemensList: allCateg));
    } else {
      selectedCateg.remove(id);
      emit(
        state.copyWith(
            selectedCategories: selectedCateg, departemensList: allCateg),
      );
    }
  }

  onSelectStatus(int id) {
    List<int>? selectedStatus = state.selectedStatus?.toList() ?? [];
    var allStatus = state.statusList?.toList();
    bool isChecked = selectedStatus.contains(id);
    if (!isChecked) {
      selectedStatus.add(id);
      emit(state.copyWith(
          selectedStatus: selectedStatus, statusList: allStatus));
    } else {
      selectedStatus.remove(id);
      emit(
        state.copyWith(selectedStatus: selectedStatus, statusList: allStatus),
      );
    }
  }

  onSelectCity(int id) {
    emit(state.copyWith(selectedCity: id));
  }

  onFNameChange(String fname) => emit(state.copyWith(firstName: fname));

  onLNameChange(String lname) => emit(state.copyWith(lastName: lname));

  onEmailChange(String email) => emit(state.copyWith(email: email));

  onPhoneChange(String phone) => emit(state.copyWith(phone: phone));

  onPassWordChange(String password) => emit(state.copyWith(password: password));

  onConfPassChange(String confPassword) =>
      emit(state.copyWith(password: confPassword));

  showPassword() => emit(state.copyWith(obscurePass: !state.obscurePass));

  showConfPassword() =>
      emit(state.copyWith(obscureConfPass: !state.obscureConfPass));

  onIdentificationChange(String identification) =>
      emit(state.copyWith(identification: identification));

  onIbanChange(String iban) => emit(state.copyWith(iban: iban));

  onTermChange() => emit(state.copyWith(term: !state.term));

  //?====================[  GET ALL DEPARTEMENT  ]====================
  List<Categories>? departList = [];
  Future<void> getAllDepartements() async {
    try {
      if (state.departemensList == null || state.departemensList == []) {
        emit(state.copyWith(departementState: RequestState.loading));
        departList = [];
        departList = await signUpAdverRepo.getAllDepartements();

        emit(state.copyWith(
          departemensList: departList,
          departementState: RequestState.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(departementState: RequestState.failed));
      log(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?====================[  GET ALL STATUS  ]====================
  List<StatusData>? statusList = [];
  Future<void> getAllStatus() async {
    try {
      if (state.statusList == null || state.statusList == []) {
        emit(state.copyWith(statusState: RequestState.loading));
        statusList = [];
        statusList = await signUpAdverRepo.getAllStatus();
        emit(state.copyWith(
          statusList: statusList,
          statusState: RequestState.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(statusState: RequestState.failed));
      log(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?====================[  GET ALL CITIES & AREAS  ]====================
  List<CityData>? citiesList = [];
  Future<void> getAllCities() async {
    try {
      if (state.citiesList == null || state.citiesList == []) {
        emit(state.copyWith(citiesState: RequestState.loading));
        citiesList = [];
        citiesList = await signUpAdverRepo.getCitiesArea();
        emit(state.copyWith(
          citiesList: citiesList,
          citiesState: RequestState.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(citiesState: RequestState.failed));
      log(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?====================[  SIGN UP NEW ACC  ]==========================

  ///Register new advertiser
  Future<void> signUpAdv() async {
    try {
      fieldsValidation();
      Map<String, String> body = {
        "name": "${state.firstName} ${state.lastName}",
        "firstname_ar": "${state.firstName}",
        "firstname_en": "${state.firstName}",
        "lastname_en": "${state.lastName}",
        "desc_ar": "",
        "desc_en": "",
        "iban": "${state.iban}",
        "lastname_ar": "${state.lastName}",
        "email": "${state.email}",
        "country_id": "1",
        "mobile": "${state.phone}",
        "gender": "${state.gender}",
        "city_id": "${state.selectedCity}",
        "lng": "${state.location?.lng}",
        "lat": "${state.location?.lat}",
        "location": "${state.address}",
        "address_ar": "${state.address}",
        "password": "${state.password}",
        "c_password": "${state.confPassword}",
        "fcm_token": "", //todo
      };
      if (state.selectedCategories != null) {
        for (var i = 0; i < state.selectedCategories!.length; i++) {
          body.addAll({"category_ids[$i]": "${state.selectedCategories?[i]}"});
        }
      }
      if (state.selectedStatus != null) {
        for (var i = 0; i < state.selectedStatus!.length; i++) {
          body.addAll({"status_ids[$i]": "${state.selectedStatus?[i]}"});
        }
      }
      emit(state.copyWith(registerState: RequestState.loading));
      SignUpAdvertiseModel response = await signUpAdverRepo.signUP(
        body: body,
      );
      await cacheData(response);
      log("Register Success");
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.selectedCategories == null || state.selectedCategories!.isEmpty) {
      throw ("job_title_required".tr());
    }
    if (state.selectedCity == null) {
      throw ("citiy_required".tr());
    }
    if (state.selectedStatus == null || state.selectedStatus!.isEmpty) {
      throw ("section_required".tr());
    }
    if (state.gender == null || state.gender!.isEmpty) {
      throw ("gender_required".tr());
    }
    if (state.term == false) {
      throw ("accept_term".tr());
    }
  }

  /// save user data in local
  Future<void> cacheData(SignUpAdvertiseModel response) async {
    await CacheHelper.saveData(
        key: AppStrings.userInfo,
        value: jsonEncode(response.success?.advertiser?.toJson()));
    await CacheHelper.saveData(
      key: AppStrings.userToken,
      value: response.success?.token,
    );
    await CacheHelper.saveData(
      key: AppStrings.isAdvertise,
      value: true,
    );
  }

  ///get user info from local data
  Map<String, dynamic> userInfo() {
    final String stringUser = CacheHelper.getData(key: AppStrings.userInfo);
    print(stringUser);
    Map<String, dynamic> user = jsonDecode(stringUser);
    return user;
  }

  ///convert user info from map to Advertiser model
  Future<Advertiser> getAdvertiserInfo() async {
    Map<String, dynamic> info = userInfo();
    return Advertiser.fromJson(info);
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
