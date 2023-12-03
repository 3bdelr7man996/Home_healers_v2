import 'package:bloc/bloc.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/data/repositories/filter_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/get_all_ads_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_with_offer_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/search_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/section_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_result_screen.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../setting/presentation/pages/my_requests_screen_for_patient.dart';
import '../../data/models/get_all_ads_model.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo sectionRepo;

  SectionCubit({required this.sectionRepo}) : super(SectionState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));
  changeSectionNumber(int num) => emit(state.copyWith(sectionNumber: num));

  Future<void> GetSectionDetails(BuildContext context) async {
    try {
      emit(state.copyWith(listOfResponse: {}));
      fieldsValidation();
      SectionModel response =
          await sectionRepo.GetSection(sectionNumber: state.sectionNumber);
      emit(state.copyWith(listOfResponse: response.toJson()));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}

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

////////////////////////⁡⁢⁣⁢New Class For Filter⁡//////////////////////////////////////////////

class FilterCubit extends Cubit<FilterState> {
  final FilterRepo filterRepo;

  FilterCubit({required this.filterRepo}) : super(FilterState());

  //?==================== formFields change ====================
  showConfPassword() => emit(state.copyWith(Loading: !state.Loading));

  changeSectionNumber(int num) =>
      {emit(state.copyWith(status_id: num)), print(state.status_id)};
  changeCategoryNumber(int num) => {emit(state.copyWith(category_id: num))};
  changeGender(String gender) => emit(state.copyWith(gender: gender));
  changeCity(int city) => emit(state.copyWith(city_id: city));
  changeArea(int area) =>
      {emit(state.copyWith(area_id: area)), print(state.area_id)};

  Future<void> GetFilterResult(BuildContext context) async {
    try {
      emit(state.copyWith(listOfResponse: {}));
      fieldsValidation();

      SectionModel response = await filterRepo.GetFilter(
          areaId: state.area_id,
          category_id: state.category_id,
          gender: state.gender,
          sectionNumber: state.status_id,
          cityId: state.city_id);
      emit(state.copyWith(listOfResponse: response.toJson()));

      emit(state.copyWith(area_id: -1));
      emit(state.copyWith(category_id: -1));
      emit(state.copyWith(status_id: -1));
      emit(state.copyWith(city_id: -1));
      emit(state.copyWith(area_id: -1));
      emit(state.copyWith(gender: "-1"));

      AppConstants.customNavigation(context, FilterResultScreen(), -1, 0);
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {}

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

///////////////////////////////// ⁡⁢⁣⁢New Class For Search⁡ ////////

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(SearchState());

  //?==================== formFields change ====================

  Future<void> GetSearchResult(BuildContext context) async {
    try {
      emit(state.copyWith(listOfResponse: {}));

      SectionModel response = await searchRepo.GetSearch();
      emit(state.copyWith(listOfResponse: response.toJson()));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}

/////////////// ⁡⁢⁣⁢New Class For reservation⁡ /////////////////////////////////////////
class ReservationCubit extends Cubit<ReservationState> {
  final ReservationRepo reservationRepo;
  final ReservationWithOfferRepo reservationWithOfferRepo;

  ReservationCubit(
      {required this.reservationRepo, required this.reservationWithOfferRepo})
      : super(ReservationState());

  //?==================== formFields change ====================

  increaseSessionsCount() =>
      {emit(state.copyWith(sessions_count: state.sessions_count! + 1))};
  decraseSessionsCount() =>
      {emit(state.copyWith(sessions_count: state.sessions_count! - 1))};
  OnChangeSessionCount(value) => {emit(state.copyWith(sessions_count: value))};
  onAddressChange(var address) => {emit(state.copyWith(address: address))};
  onLocationChange(var location) => {emit(state.copyWith(location: location))};

  onChangeadvertiserId(value) => {emit(state.copyWith(advertiser_id: value))};
  onChangestatus_id(value) => {emit(state.copyWith(status_id: value))};
  onChangeDays(value) => {emit(state.copyWith(days: value))};
  makesessions_countOne() => {emit(state.copyWith(sessions_count: 1))};
  onChangeNotes(value) => {emit(state.copyWith(notes: value))};
  makeNotesEmpty() => {emit(state.copyWith(notes: ""))};
  onChangePainPlace(value) => {emit(state.copyWith(painPlace: value))};
  OnOfferChange(var offer) => emit(state.copyWith(offer: offer));

  Future<void> MakeReservation(BuildContext context, bool withOffer) async {
    var userId = await CacheHelper.getData(key: AppStrings.userId);
    try {
      List<DateTime>? sortedDates = state.days;
      sortedDates?.sort((a, b) => a.compareTo(b));
      String start_at;
      if (state.days!.length > 1) {
        start_at = sortedDates!.first.toString();
        start_at = start_at.substring(0, start_at.length - 4);
        emit(state.copyWith(start_at: start_at));
      } else {
        var newDateTime = sortedDates!.first;
        start_at = DateTime(
          newDateTime.year,
          newDateTime.month,
          newDateTime.day,
          00,
          00,
          00,
        ).toString();
        start_at = start_at.substring(0, start_at.length - 4);
        emit(state.copyWith(start_at: start_at));
      }
      String end_at = sortedDates.last.toString();
      end_at = end_at.substring(0, end_at.length - 4);
      emit(state.copyWith(end_at: end_at));
      List<String> daysArray = sortedDates
          .map((date) =>
              date.toString().substring(0, date.toString().length - 4))
          .toList();
      fieldsValidation(withOffer);
      emit(state.copyWith(Loading: true));

      Map<String, dynamic> body;
      // var lat, lng;
      // var permission = await Geolocator.checkPermission();
      // if (permission == LocationPermission.denied ||
      //     permission == LocationPermission.deniedForever) {
      //   Geolocator.requestPermission();
      // }
      // Position position = await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // );

      // print("location is ${position.latitude}");

      // lat = position.latitude;
      // lng = position.longitude;

      // // You can use latitude and longitude for your desired purpose.
      // print("Latitude: ${lat}, Longitude: ${lng}");

      if (withOffer) {
        body = {
          "start_at": "${state.start_at}",
          "end_at": "${state.end_at}",
          "days": daysArray,
          "offer": state.offer,
          "advertiser_id": "${state.advertiser_id}",
          "lat": "${state.location?.lat}",
          "lang": "${state.location?.lng}",
          "user_id": "${userId}",
        };
      } else {
        print("asdf");
        body = {
          "advertiser_id": "${state.advertiser_id}",
          "lat": "${state.location?.lat}",
          "lang": "${state.location?.lng}",
          "user_id": "${userId}",
          "start_at": "${state.start_at}",
          "end_at": "${state.end_at}",
          "sessions_count": "${state.sessions_count}",
          "status_id": "${state.status_id}",
          "notes": "${state.notes}",
          "days": daysArray,
          "pain_place": "${state.painPlace}"
          //coupon ===ToDo===
        };
      }
      print(body);
      // for (int i = 0; i < daysArray.length; i++) {
      //   body['days[$i]'] = daysArray[i];
      // }\

      var response;
      if (withOffer) {
        response = await reservationWithOfferRepo.MakeReservation(body: body);
        print("lad phg hguvmqq");
      } else {
        response = await reservationRepo.MakeReservation(body: body);
      }
      emit(state.copyWith(Loading: false));

      print(response);
      print("Ghaith");

      // AppConstants.customNavigation(context, MyRequestsForPatient(), -1, 0);
      emit(state.copyWith(sessions_count: 1));
      emit(state.copyWith(days: []));
      emit(state.copyWith(notes: ""));
      daysArray = [];
      sortedDates = [];
      makeNotesEmpty();
      state.location = null;
      // ignore: use_build_context_synchronously
      body.removeWhere((key, value) => key.startsWith('days['));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyRequestsForPatient()),
      );
    } catch (e) {
      emit(state.copyWith(Loading: false));
      print(state.status_id);
      print(e.toString());
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation(bool withOffer) {
    if (state.location == null) {
      throw ("ادخل موقعك");
    }
    if (state.status_id == null) {
      throw ("حدد الاختصاص ");
    }
    if (state.sessions_count != state.days!.length) {
      throw ("عدد الجلسات لا يساوي الأيام المحددة");
    }
    if (state.sessions_count! > state.days!.length) {
      throw ("قم بتحديد الأيام التي تريد حجز موعد بها");
    }
    if (state.location == null) {
      throw ("ادخل موقعك");
    }
    if (state.notes.length == 0 && !withOffer) {
      throw ("الرجاء قم بإدخال المزيد من التفاصيل");
    }
  }
}

/////////////// ⁡⁢⁣⁢New Class For ADs /////////////////////////////////////////
class GetAllAdsCubit extends Cubit<GetAllAdsState> {
  final GetAllAdsRepo getAllAdsRepo;

  GetAllAdsCubit({required this.getAllAdsRepo}) : super(GetAllAdsState());

  Future<void> GetAllAds(BuildContext context) async {
    try {
      GetAllAdsModel response = await getAllAdsRepo.GetAllAds();
      print(
          "AHmad Mohsen AHmad Mohsen AHmad Mohsen AHmad Mohsen AHmad Mohsen AHmad Mohsen AHmad Mohsen AHmad MohsenAHmad Mohsen  AHmad Mohsen AHmad Mohsen");
      emit(state.copyWith(data: response));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
