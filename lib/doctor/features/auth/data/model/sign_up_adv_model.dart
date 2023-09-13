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
  });
  late final int id;
  late final String? name;
  late final String? email;
  late final String? mobile;
  late final String? token;
  late final Advertiser? advertiser;

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    email = json?['email'];
    mobile = json?['mobile'];
    token = json?['token'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
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
