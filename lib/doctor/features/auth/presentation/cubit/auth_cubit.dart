import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/doctor/features/auth/data/model/departements_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';
import 'package:dr/doctor/features/auth/data/repository/advertise_signup_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:map_location_picker/map_location_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpAdvertiserRepo signUpAdverRepo;
  AuthCubit({required this.signUpAdverRepo}) : super(const AuthState());

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
      emit(state.copyWith(
          location: Location(
        lat: position.latitude,
        lng: position.longitude,
      )));

      // You can use latitude and longitude for your desired purpose.
      log("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
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
    List<int>? selectedCity = state.selectedCity?.toList() ?? [];
    var allCities = state.citiesList?.toList();
    bool isChecked = selectedCity.contains(id);
    if (!isChecked) {
      selectedCity.add(id);
      emit(state.copyWith(selectedCity: selectedCity, citiesList: allCities));
    } else {
      selectedCity.remove(id);
      emit(
        state.copyWith(selectedCity: selectedCity, citiesList: allCities),
      );
    }
  }

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
}
