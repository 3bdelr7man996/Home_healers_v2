class ReportsModel {
  ReportsModel({
    required this.success,
  });
  late final Success success;

  ReportsModel.fromJson(Map<String, dynamic>? json) {
    success = Success.fromJson(json?['success']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success.toJson();
    return _data;
  }
}

class Success {
  Success({
    required this.id,
    required this.name,
    required this.mobile,
    this.image,
    required this.fcmToken,
    required this.email,
    this.emailVerifiedAt,
    required this.gender,
    required this.cityId,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.points,
    required this.activated,
    this.line1,
    this.line2,
    this.age,
    this.birthday,
    this.countryCode,
    this.firstName,
    this.lastName,
    this.region,
    this.nationality,
    required this.doctorReports,
    required this.diagnoseForms,
    required this.reports,
    required this.reservations,
    required this.evaluations,
  });
  late var id;
  late final String? name;
  late final String? mobile;
  late var image;
  late final String? fcmToken;
  late final String? email;
  late var emailVerifiedAt;
  late final String? gender;
  late var cityId;
  late var centerId;
  late final String? createdAt;
  late final String? updatedAt;
  late var deletedAt;
  late var points;
  late var activated;
  late var line1;
  late var line2;
  late var age;
  late var birthday;
  late var countryCode;
  late var firstName;
  late var lastName;
  late var region;
  late var nationality;
  late final List<DoctorReports>? doctorReports;
  late var diagnoseForms;
  late final List<Reports>? reports;
  late final List<Reservations>? reservations;
  late final List<dynamic>? evaluations;

  Success.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = json?['image'];
    fcmToken = json?['fcm_token'];
    email = json?['email'];
    emailVerifiedAt = json?['email_verified_at'];
    gender = json?['gender'];
    cityId = json?['city_id'];
    centerId = json?['created_at'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = json?['deleted_at'];
    points = json?['points'];
    activated = json?['activated'];
    line1 = json?['line1'];
    line2 = json?['line2'];
    age = json?['age'];
    birthday = json?['birthday'];
    countryCode = json?['country_code'];
    firstName = json?['first_name'];
    lastName = json?['last_name'];
    region = json?['region'];
    nationality = json?['nationality'];
    doctorReports = List.from(json?['doctor_reports'])
        .map((e) => DoctorReports.fromJson(e))
        .toList();
    diagnoseForms = List.from(json?['diagnose_forms'])
        .map((e) => DiagnoseForms.fromJson(e))
        .toList();
    reports =
        List.from(json?['reports']).map((e) => Reports.fromJson(e)).toList();
    reservations = List.from(json?['reservations'])
        .map((e) => Reservations.fromJson(e))
        .toList();
    evaluations = List.castFrom<dynamic, dynamic>(json?['evaluations']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['mobile'] = mobile;
    _data['image'] = image;
    _data['fcm_token'] = fcmToken;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['gender'] = gender;
    _data['city_id'] = cityId;
    _data['center_id'] = centerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['points'] = points;
    _data['activated'] = activated;
    _data['line1'] = line1;
    _data['line2'] = line2;
    _data['age'] = age;
    _data['birthday'] = birthday;
    _data['country_code'] = countryCode;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['region'] = region;
    _data['nationality'] = nationality;
    _data['doctor_reports'] = doctorReports?.map((e) => e.toJson()).toList();
    _data['diagnose_forms'] = diagnoseForms?.map((e) => e.toJson()).toList();
    _data['reports'] = reports?.map((e) => e.toJson()).toList();
    _data['reservations'] = reservations?.map((e) => e.toJson()).toList();
    _data['evaluations'] = evaluations;
    return _data;
  }
}

class DoctorReports {
  DoctorReports({
    required this.id,
    required this.file,
    required this.reservationId,
    required this.createdAt,
    required this.laravelThroughKey,
  });
  late var id;
  late final String? file;
  late var reservationId;
  late final String? createdAt;
  late var laravelThroughKey;

  DoctorReports.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    file = json?['file'];
    reservationId = json?['reservation_id'];
    createdAt = json?['created_at'];
    laravelThroughKey = json?['laravel_through_key'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['file'] = file;
    _data['reservation_id'] = reservationId;
    _data['created_at'] = createdAt;
    _data['laravel_through_key'] = laravelThroughKey;
    return _data;
  }
}

class DiagnoseForms {
  DiagnoseForms({
    required this.id,
    required this.reservationId,
    this.section_1,
    this.section_2,
    this.section_3,
    this.section_4,
    this.section_5,
    this.section_6,
    this.section_7,
    this.section_8,
    this.section_9,
    this.section_10,
    this.section_11,
    this.section_12,
    this.treatment,
    required this.createdAt,
    required this.laravelThroughKey,
  });
  late var id;
  late var reservationId;
  late final String? section_1;
  late final String? section_2;
  late final String? section_3;
  late final String? section_4;
  late var section_5;
  late var section_6;
  late var section_7;
  late final String? section_8;
  late var section_9;
  late var section_10;
  late final String? section_11;
  late var section_12;
  late var treatment;
  late final String? createdAt;
  late var laravelThroughKey;

  DiagnoseForms.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    reservationId = json?['reservation_id'];
    section_1 = json?['section_1'];
    section_2 = json?['section_2'];
    section_3 = json?['section_3'];
    section_4 = json?['section_4'];
    section_5 = json?['section_5'];
    section_6 = json?['section_6'];
    section_7 = json?['section_7'];
    section_8 = json?['section_8'];
    section_9 = json?['section_9'];
    section_10 = json?['section_10'];
    section_11 = json?['section_11'];
    section_12 = json?['section_12'];
    treatment = json?['treatment'];
    createdAt = json?['created_at'];
    laravelThroughKey = json?['laravel_through_key'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reservation_id'] = reservationId;
    _data['section_1'] = section_1;
    _data['section_2'] = section_2;
    _data['section_3'] = section_3;
    _data['section_4'] = section_4;
    _data['section_5'] = section_5;
    _data['section_6'] = section_6;
    _data['section_7'] = section_7;
    _data['section_8'] = section_8;
    _data['section_9'] = section_9;
    _data['section_10'] = section_10;
    _data['section_11'] = section_11;
    _data['section_12'] = section_12;
    _data['treatment'] = treatment;
    _data['created_at'] = createdAt;
    _data['laravel_through_key'] = laravelThroughKey;
    return _data;
  }
}

class Reports {
  Reports({
    required this.id,
    required this.repTitle,
    required this.repImage,
    required this.userId,
    required this.createdAt,
  });
  late var id;
  late final String? repTitle;
  late final String? repImage;
  late var userId;
  late final String? createdAt;

  Reports.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    repTitle = json?['rep_title'];
    repImage = json?['rep_image'];
    userId = json?['user_id'];
    createdAt = json?['created_at'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['rep_title'] = repTitle;
    _data['rep_image'] = repImage;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Reservations {
  Reservations({
    required this.id,
    required this.parentId,
    required this.userId,
    required this.advertiserId,
    this.notes,
    this.coupon,
    this.days,
    this.startAt,
    this.endAt,
    required this.sessionsCount,
    required this.subTotal,
    required this.vat,
    required this.fees,
    required this.amount,
    required this.isPaid,
    this.paymentDetails,
    required this.status,
    this.lat,
    this.lang,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.statusId,
    this.painPlace,
    this.orderTransaction,
    this.qrCode,
    required this.reports,
    this.diagnoseForm,
  });
  late var id;
  late var parentId;
  late var userId;
  late var advertiserId;
  late final String? notes;
  late final String? coupon;
  late var days;
  late final String? startAt;
  late final String? endAt;
  late var sessionsCount;
  late var subTotal;
  late final String? vat;
  late var fees;
  late var amount;
  late var isPaid;
  late var paymentDetails;
  late final String? status;
  late var lat;
  late var lang;
  late var centerId;
  late final String? createdAt;
  late final String? updatedAt;
  late var deletedAt;
  late final int? statusId;
  late final String? painPlace;
  late final String? orderTransaction;
  late var qrCode;
  late final List<Reports> reports;
  late var diagnoseForm;

  Reservations.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    parentId = json?['parent_id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    notes = json?['notes'];
    coupon = json?['coupon'];
    days = json?['days'];
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
    centerId = json?['center_id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = json?['deleted_at'];
    statusId = json?['status_id'];
    painPlace = json?['pain_place'];
    orderTransaction = json?['order_transaction'];
    qrCode = json?['qr_code'];
    reports =
        List.from(json?['reports']).map((e) => Reports.fromJson(e)).toList();
    diagnoseForm = json?['diagnose_form'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['notes'] = notes;
    _data['coupon'] = coupon;
    _data['days'] = days;
    _data['start_at'] = startAt;
    _data['end_at'] = endAt;
    _data['sessions_count'] = sessionsCount;
    _data['sub_total'] = subTotal;
    _data['vat'] = vat;
    _data['fees'] = fees;
    _data['amount'] = amount;
    _data['is_paid'] = isPaid;
    _data['payment_details'] = paymentDetails;
    _data['status'] = status;
    _data['lat'] = lat;
    _data['lang'] = lang;
    _data['center_id'] = centerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['status_id'] = statusId;
    _data['pain_place'] = painPlace;
    _data['order_transaction'] = orderTransaction;
    _data['qr_code'] = qrCode;
    _data['reports'] = reports.map((e) => e.toJson()).toList();
    _data['diagnose_form'] = diagnoseForm;
    return _data;
  }
}

// class DiagnoseForm {
//   DiagnoseForm({
//     required this.id,
//     required this.reservationId,
//     this.section_1,
//     this.section_2,
//     this.section_3,
//     this.section_4,
//     this.section_5,
//     this.section_6,
//     this.section_7,
//     this.section_8,
//     this.section_9,
//     this.section_10,
//     this.section_11,
//     this.section_12,
//     this.treatment,
//     required this.createdAt,
//   });
//   late var id;
//   late var reservationId;
//   late var section_1;
//   late var section_2;
//   late var section_3;
//   late var section_4;
//   late var section_5;
//   late var section_6;
//   late var section_7;
//   late var section_8;
//   late var section_9;
//   late var section_10;
//   late final String? section_11;
//   late var section_12;
//   late var treatment;
//   late final String? createdAt;

//   DiagnoseForm.fromJson(Map<String, dynamic>? json) {
//     id = json?['id'];
//     reservationId = json?['reservation_id'];
//     section_1 = json?['section_1'];
//     section_2 = json?['section_2'];
//     section_3 = json?['section_3'];
//     section_4 = json?['section_4'];
//     section_5 = json?['section_5'];
//     section_6 = json?['section_6'];
//     section_7 = json?['section_7'];
//     section_8 = json?['section_8'];
//     section_9 = json?['section_9'];
//     section_10 = json?['section_10'];
//     section_11 = json?['section_11'];
//     section_12 = json?['section_12'];
//     treatment = json?['treatment'];
//     createdAt = json?['created_at'];
//   }

//   Map<String, dynamic>? toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['reservation_id'] = reservationId;
//     _data['section_1'] = section_1;
//     _data['section_2'] = section_2;
//     _data['section_3'] = section_3;
//     _data['section_4'] = section_4;
//     _data['section_5'] = section_5;
//     _data['section_6'] = section_6;
//     _data['section_7'] = section_7;
//     _data['section_8'] = section_8;
//     _data['section_9'] = section_9;
//     _data['section_10'] = section_10;
//     _data['section_11'] = section_11;
//     _data['section_12'] = section_12;
//     _data['treatment'] = treatment;
//     _data['created_at'] = createdAt;
//     return _data;
//   }
// }
