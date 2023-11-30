import 'package:dr/doctor/features/diagnose_report/data/models/diagonse_form_model.dart';
import 'package:dr/doctor/features/home/data/models/reservations_model.dart';

class ReservationDetailsModel {
  bool? success;
  UserReservationsData? data;
  String? message;

  ReservationDetailsModel({this.success, this.data, this.message});

  ReservationDetailsModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = json?['data'] != null
        ? UserReservationsData.fromJson(json?['data'])
        : null;
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserReservationsData {
  List<ReservationData>? userReservations;
  List<UserReservationsChilds>? userReservationsChilds;

  UserReservationsData({this.userReservations, this.userReservationsChilds});

  UserReservationsData.fromJson(Map<String, dynamic>? json) {
    if (json?['userReservations'] != null) {
      userReservations = <ReservationData>[];
      json?['userReservations'].forEach((v) {
        userReservations!.add(ReservationData.fromJson(v));
      });
    }
    if (json?['userReservations_childs'] != null) {
      userReservationsChilds = <UserReservationsChilds>[];
      json?['userReservations_childs'].forEach((v) {
        userReservationsChilds!.add(UserReservationsChilds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userReservations != null) {
      data['userReservations'] =
          this.userReservations!.map((v) => v.toJson()).toList();
    }
    if (this.userReservationsChilds != null) {
      data['userReservations_childs'] =
          this.userReservationsChilds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserReservationsChilds {
  int? id;
  String? status;
  String? qrCode;
  List<DoctorReports>? reports;
  DiagnoseForm? diagnoseForm;

  UserReservationsChilds(
      {this.id, this.status, this.qrCode, this.reports, this.diagnoseForm});

  UserReservationsChilds.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    status = json?['status'];
    qrCode = json?['qr_code'];
    if (json?['reports'] != null) {
      reports = [];
      json?['reports'].forEach((v) {
        reports?.add(DoctorReports.fromJson(v));
      });
    }
    diagnoseForm = json?['diagnose_form'] != null
        ? DiagnoseForm.fromJson(json?['diagnose_form'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['qr_code'] = this.qrCode;
    if (this.reports != null) {
      data['reports'] = this.reports!.map((v) => v.toJson()).toList();
    }
    data['diagnose_form'] = this.diagnoseForm;
    return data;
  }
}
