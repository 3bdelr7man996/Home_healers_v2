import 'advertiser_model.dart';

class SignUpAdvertiseModel {
  SignUpAdvertiseModel({
    required this.success,
  });
  late final User? success;

  SignUpAdvertiseModel.fromJson(Map<String, dynamic>? json) {
    success = User.fromJson(json?['success']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success?.toJson();
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.token,
    required this.advertiser,
    required this.message,
    required this.activationCode,
    this.activated,
    this.age,
    this.birthday,
    this.countryCode,
    this.isOnlineForChat,
    this.line1,
    this.line2,
    this.nationality,
    this.points,
    this.region,
  });
  late final int id;
  late final String? name;
  late final String? email;
  late final String? mobile;
  late final String? token;
  late final Advertiser? advertiser;
  late final String? message;
  late final String? activationCode;
  late final int? points;
  late final int? activated;
  late final String? line1;
  late final String? line2;
  late final String? age;
  late final String? birthday;
  late final String? region;
  late final String? nationality;
  late final String? countryCode;
  late final int? isOnlineForChat;

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    email = json?['email'];
    mobile = json?['mobile'];
    token = json?['token'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
    message = json?['message'];
    activationCode = json?['activation_code'];
    points = json?['points'];
    activated = json?['activated'];
    line1 = json?['line1'];
    line2 = json?['line2'];
    age = json?['age'];
    birthday = json?['birthday'];
    countryCode = json?['country_code'];
    region = json?['region'];
    nationality = json?['nationality'];
    isOnlineForChat = json?['is_online_for_chat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['token'] = token;
    data['advertiser'] = advertiser?.toJson();
    return data;
  }
}
