// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/home/data/repositories/reservation_repo.dart';
import 'package:dr/Patient/features/home/data/repositories/reservation_with_offer_repo.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/reservation_state.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

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
  onAddressChange(String address) =>
      {emit(state.copyWith(address: () => address))};
  onLocationChange(Location location) =>
      {emit(state.copyWith(location: () => location))};

  onChangeadvertiserId(value) => {emit(state.copyWith(advertiser_id: value))};
  onChangestatus_id(value) => {emit(state.copyWith(status_id: ()=>value))};
  onChangeDays(value) => {emit(state.copyWith(days: () => value))};
  makesessions_countOne() => {emit(state.copyWith(sessions_count: 1))};
  onChangeNotes(value) => {emit(state.copyWith(notes: value))};
  makeNotesEmpty() => {emit(state.copyWith(notes: ""))};
  onChangePainPlace(value) => {emit(state.copyWith(painPlace: value))};
  OnOfferChange(var offer) => emit(state.copyWith(offer: offer));
  onCouponChange(String coupon) => emit(state.copyWith(coupon: () => coupon));
  initReservationData() {
    //daysArray = [];
    emit(state.copyWith(
      days: () => [],
      start_at: () => null,
      end_at: () => null,
      location: () => null,
      address: () => null,
      notes: "",
      coupon: () => null,
      offer: null,
    ));
  }

  Future<void> MakeReservation(
    BuildContext context,
    bool withOffer,
  ) async {
    var userId = await CacheHelper.getData(key: AppStrings.userId);
    try {
      fieldsValidation(withOffer);

      List<DateTime>? sortedDates = state.days;
      sortedDates?.sort((a, b) => a.compareTo(b));
      String start_at;
      if (state.days!.length > 1) {
        start_at = sortedDates!.first.toString();
        start_at = start_at.substring(0, start_at.length - 4);
        emit(state.copyWith(start_at: () => start_at));
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
        emit(state.copyWith(start_at: () => start_at));
      }
      String end_at = sortedDates.last.toString();
      end_at = end_at.substring(0, end_at.length - 4);
      emit(state.copyWith(end_at: () => end_at));
      List<String> daysArray = sortedDates
          .map((date) =>
              date.toString().substring(0, date.toString().length - 4))
          .toList();

      emit(state.copyWith(Loading: true));

      Map<String, dynamic> body;

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
          "pain_place": "${state.painPlace}",
          "status_id": "${state.status_id}",
          "coupon": "${state.coupon}"
        };
      } else {
        body = {
          "advertiser_id": "${state.advertiser_id}", //"162",
          "lat": "${state.location?.lat}",
          "lang": "${state.location?.lng}",
          "user_id": "${userId}",
          "start_at": "${state.start_at}",
          "end_at": "${state.end_at}",
          "sessions_count": "${state.sessions_count}",
          "status_id": "${state.status_id}",
          "notes": "${state.notes}",
          "days": daysArray,
          "pain_place": "${state.painPlace}",
          "coupon": "${state.coupon ?? ''}"
          //coupon ===ToDo===
        };
      }

      var response;
      if (withOffer) {
        response = await reservationWithOfferRepo.MakeReservation(body: body);
      } else {
        response = await reservationRepo.MakeReservation(body: body);
      }
      emit(state.copyWith(Loading: false));
      // AppConstants.customNavigation(context, MyRequestsForPatient(), -1, 0);
      emit(state.copyWith(
        sessions_count: 1,
        days: () => [],
        location: () => null,
        notes: "",
        address: () => null,
        status_id:()=> -1,
      ));

      daysArray = [];
      sortedDates = [];
      makeNotesEmpty();
      body.removeWhere((key, value) => key.startsWith('days['));
      FirebaseAnalyticUtil.logAddReservationEvent();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyRequestsForPatient()),
      );
    } catch (e) {
      emit(state.copyWith(Loading: false));

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///////////////////////////////////////// validate on fields /////////////////////////////////////////
  void fieldsValidation(bool withOffer) {
    if (state.location == null || state.address == null) {
      throw ("ادخل موقع الزيارة المنزلية");
    }
    if (state.status_id == null || state.status_id == -1) {
      throw ("حدد الاختصاص ");
    }
    if (state.days == null || state.days!.isEmpty) {
      throw (" حدد تواريخ الجلسات ");
    }

    if (state.sessions_count != state.days!.length) {
      throw ("عدد الجلسات لا يساوي الأيام المحددة");
    }
    if (state.notes?.length == 0 && !withOffer) {
      throw ("الرجاء قم بإدخال المزيد من التفاصيل");
    }
  }

  //?========================[ GET CURRENT POSITION ]===========================
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
      emit(
        state.copyWith(
          location: () => Location(
            lat: position.latitude,
            lng: position.longitude,
          ),
        ),
      );

      // You can use latitude and longitude for your desired purpose.
    } catch (e) {}
  }
}
