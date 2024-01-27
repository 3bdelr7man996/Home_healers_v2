import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../diagnose_report/data/models/diagonse_form_model.dart';
import 'user_reservation_model.dart';

class ResevationsModel {
  bool? success;
  List<ReservationData>? data;
  String? message;

  ResevationsModel({this.success, this.data, this.message});

  ResevationsModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    if (json?['data'] != null) {
      data = <ReservationData>[];
      json?['data'].forEach((v) {
        data!.add(ReservationData.fromJson(v));
      });
    }
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ReservationData {
  int? id;
  int? parentId;
  int? userId;
  int? advertiserId;
  String? notes;
  String? coupon;
  List<String>? days;
  String? startAt;
  String? endAt;
  int? sessionsCount;
  int? subTotal;
  String? vat;
  num? fees;
  int? amount;
  int? isPaid;
  String? paymentDetails;
  String? status;
  String? lat;
  String? lang;
  int? statusId;
  int? canReview;
  String? qrCode;
  String? painPlace;
  List<DoctorReports>? reports;
  DiagnoseForm? diagnoseForm;
  Advertiser? advertiser;
  UserReservation? user;

  ReservationData(
      {this.id,
      this.parentId,
      this.userId,
      this.advertiserId,
      this.notes,
      this.coupon,
      this.days,
      this.startAt,
      this.endAt,
      this.sessionsCount,
      this.subTotal,
      this.vat,
      this.fees,
      this.amount,
      this.isPaid,
      this.paymentDetails,
      this.status,
      this.lat,
      this.lang,
      this.statusId,
      this.canReview,
      this.qrCode,
      this.painPlace,
      this.reports,
      this.diagnoseForm,
      this.advertiser,
      this.user});

  ReservationData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    parentId = json?['parent_id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    notes = json?['notes'] ?? "";
    coupon = json?['coupon'] ?? "";
    days = json?['days'] != null ? json!['days'].cast<String>() : [];
    startAt = json?['start_at'];
    endAt = json?['end_at'];
    sessionsCount = json?['sessions_count'];
    subTotal = json?['sub_total'];
    vat = json?['vat'];
    fees = json?['fees'];
    amount = json?['amount'];
    isPaid = json?['is_paid'];
    paymentDetails = json?['payment_details'];
    status = json?['status'];
    lat = json?['lat'];
    lang = json?['lang'];
    statusId = json?['status_id'];
    canReview = json?['can_review'];
    qrCode = json?['qr_code'];
    painPlace = json?['pain_place'];
    if (json?['reports'] != null) {
      reports = [];
      json?['reports'].forEach((v) {
        reports?.add(DoctorReports.fromJson(v));
      });
    }
    diagnoseForm = json?['diagnose_form'] != null
        ? DiagnoseForm.fromJson(json?['diagnose_form'])
        : null;
    advertiser = json?['advertiser'] != null
        ? Advertiser.fromJson(json?['advertiser'])
        : null;
    user =
        json?['user'] != null ? UserReservation.fromJson(json?['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['user_id'] = userId;
    data['advertiser_id'] = advertiserId;
    data['notes'] = notes;
    data['coupon'] = coupon;
    data['days'] = days;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    data['sessions_count'] = sessionsCount;
    data['sub_total'] = subTotal;
    data['vat'] = vat;
    data['fees'] = fees;
    data['amount'] = amount;
    data['is_paid'] = isPaid;
    data['payment_details'] = paymentDetails;
    data['status'] = status;
    data['lat'] = lat;
    data['lang'] = lang;
    data['status_id'] = statusId;
    data['pain_place'] = painPlace;
    data['can_review'] = canReview;
    data['qr_code'] = qrCode;
    if (reports != null) {
      data['reports'] = reports!.map((v) => v.toJson()).toList();
    }
    data['diagnose_form'] = diagnoseForm;
    if (advertiser != null) {
      data['advertiser'] = advertiser!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  Map<String, String> toData() {
    final Map<String, String> data = <String, String>{};
    //this.endAt = this.startAt;
    data['id'] = '$id';
    data['notes'] = notes ?? '';
    data['coupon'] = coupon ?? '';
    data['payment_details'] = paymentDetails ?? '';
    data['start_at'] = startAt != null
        ? startAt!
        : days != null
            ? days![0]
            : "";
    data['end_at'] = endAt != null
        ? endAt!
        : (days != null && days!.isNotEmpty)
            ? days!.last
            : startAt != null
                ? startAt!
                : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    data['status'] = status ?? '';
    if (days != null && days!.isNotEmpty) {
      for (int i = 0; i < days!.length; i++) {
        data['days[$i]'] = days![i];
      }
    }
    return data;
  }

  ReservationData copyWith({
    int? id,
    int? userId,
    int? postId,
    int? advertiserId,
    String? notes,
    String? coupon,
    int? sessionsCount,
    int? amount,
    int? canReview,
    String? paymentDetails,
    String? startAt,
    String? endAt,
    List<String>? days,
    String? vat,
    String? qrCode,
    String? status,
    bool? paid,
    //PostDate post,
    //List<PostDate> posts,
    List<DoctorReports>? reports,
    DiagnoseForm? diagnoseForm,
    UserReservation? user,
    Advertiser? advertiser,
  }) {
    return ReservationData(
      id: advertiserId ?? this.id,
      userId: userId ?? this.userId,
      // postId: postId ?? this.postId,
      reports: reports ?? this.reports,
      advertiserId: advertiserId ?? this.advertiserId,
      notes: notes ?? this.notes,
      coupon: coupon ?? this.coupon,
      sessionsCount: sessionsCount ?? this.sessionsCount,
      amount: amount ?? this.amount,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      qrCode: qrCode ?? this.qrCode,
      startAt: startAt ?? this.startAt,
      vat: vat ?? this.vat,
      endAt: endAt ?? this.endAt,
      days: days ?? this.days,
      status: status ?? this.status,
      //paid: paid ?? this.paid,
      canReview: canReview ?? this.canReview,
      // post: post ?? this.post,
      // posts: posts ?? this.posts,
      user: user ?? this.user,
      diagnoseForm: diagnoseForm ?? this.diagnoseForm,
      advertiser: advertiser ?? this.advertiser,
    );
  }
}

class DoctorReports {
  int? id;
  String? file;
  int? reservationId;

  DoctorReports({
    this.id,
    this.file,
    this.reservationId,
  });

  DoctorReports.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    file = json?['file'];
    reservationId = json?['reservation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file'] = file;
    data['reservation_id'] = reservationId;
    return data;
  }
}
