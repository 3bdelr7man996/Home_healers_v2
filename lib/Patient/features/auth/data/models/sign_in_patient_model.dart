class SignInForPatientModel {
  SignInForPatientModel({
    required this.success,
  });
  late final Success success;

  SignInForPatientModel.fromJson(Map<String, dynamic>? json) {
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
    this.fcmToken,
    required this.email,
    this.emailVerifiedAt,
    required this.gender,
    required this.cityId,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.token,
    this.advertiser,
    required this.doctorReports,
    required this.diagnoseForms,
  });
  late final int id;
  late final String name;
  late final String mobile;
  late final Null image;
  late final Null fcmToken;
  late final String email;
  late final Null emailVerifiedAt;
  late final String gender;
  late final int cityId;
  late final Null centerId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final String token;
  late final Null advertiser;
  late final List<dynamic> doctorReports;
  late final List<dynamic> diagnoseForms;

  Success.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = null;
    fcmToken = null;
    email = json?['email'];
    emailVerifiedAt = null;
    gender = json?['gender'];
    cityId = json?['city_id'];
    centerId = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = null;
    token = json?['token'];
    advertiser = null;
    doctorReports = List.castFrom<dynamic, dynamic>(json?['doctor_reports']);
    diagnoseForms = List.castFrom<dynamic, dynamic>(json?['diagnose_forms']);
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
    _data['token'] = token;
    _data['advertiser'] = advertiser;
    _data['doctor_reports'] = doctorReports;
    _data['diagnose_forms'] = diagnoseForms;
    return _data;
  }
}
