import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';

class FavoriteModel {
  FavoriteModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<FavoriteData> data;
  late final String? message;

  FavoriteModel.fromJson(Map<String?, dynamic>? json) {
    success = json?['success'];
    data =
        List.from(json?['data']).map((e) => FavoriteData.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class FavoriteData {
  FavoriteData({
     this.id,
     this.userId,
     this.advertiserId,
    this.advertiser,
    this.user,
  });
    int? id;
    int? userId;
    int? advertiserId;
    Advertiser? advertiser;
    User? user;

  FavoriteData.fromJson(Map<String?, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
    user = User.fromJson(json?['user']);
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['advertiser'] = advertiser?.toJson();
    _data['user'] = user?.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.image,
    required this.fcmToken,
    required this.email,
    required this.emailVerifiedAt,
    required this.gender,
    required this.cityId,
    required this.centerId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.points,
    required this.activated,
    required this.line1,
    required this.line2,
    required this.age,
    required this.birthday,
    required this.countryCode,
    required this.firstName,
    required this.lastName,
    required this.region,
    required this.nationality,
    required this.isOnlineForChat,
    required this.lastSeen,
    required this.doctorReports,
    required this.diagnoseForms,
  });
  late final int? id;
  late final String? name;
  late final String? mobile;
  late final String? image;
  late final String? fcmToken;
  late final String? email;
  late final String? emailVerifiedAt;
  late final String? gender;
  late final int? cityId;
  late final int? centerId;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;
  late final int? points;
  late final int? activated;
  late final String? line1;
  late final String? line2;
  late final String? age;
  late final String? birthday;
  late final String? countryCode;
  late final String? firstName;
  late final String? lastName;
  late final String? region;
  late final String? nationality;
  late final int? isOnlineForChat;
  late final String? lastSeen;
  late final List<dynamic> doctorReports;
  late final List<dynamic> diagnoseForms;

  User.fromJson(Map<String?, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = json?['image'];
    fcmToken = json?['fcm_token'];
    email = json?['email'];
    emailVerifiedAt = json?['email_verified_at'];
    gender = json?['gender'];
    cityId = json?['city_id'];
    centerId = json?['center_id'];
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
    isOnlineForChat = json?['is_online_for_chat'];
    lastSeen = json?['last_seen'];
    doctorReports = List.castFrom<dynamic, dynamic>(json?['doctor_reports']);
    diagnoseForms = List.castFrom<dynamic, dynamic>(json?['diagnose_forms']);
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
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
    _data['is_online_for_chat'] = isOnlineForChat;
    _data['last_seen'] = lastSeen;
    _data['doctor_reports'] = doctorReports;
    _data['diagnose_forms'] = diagnoseForms;
    return _data;
  }
}
