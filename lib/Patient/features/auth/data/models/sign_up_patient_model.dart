class SignUpForPatientModel {
  SignUpForPatientModel({
    required this.success,
    required this.message,
  });
  late final Success success;
  late final String message;

  SignUpForPatientModel.fromJson(Map<String, dynamic>? json) {
    success = Success.fromJson(json?['success']);
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Success {
  Success({
    required this.id,
    required this.token,
    required this.name,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.cityId,
    this.image,
    this.advertiser,
    this.activated,
    required this.line1,
    required this.line2,
    required this.age,
    required this.birthday,
    required this.region,
    required this.nationality,
    required this.countryCode,
  });
  late final int id;
  late final String token;
  late final String name;
  late final String mobile;
  late final String email;
  late final String gender;
  late final String cityId;
  late var image;
  late var advertiser;
  late var activated;
  late final String line1;
  late final String line2;
  late final String age;
  late final String birthday;
  late final String region;
  late final String nationality;
  late final String countryCode;

  Success.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    token = json?['token'];
    name = json?['name'];
    mobile = json?['mobile'];
    email = json?['email'];
    gender = json?['gender'];
    cityId = json?['city_id'];
    image = json?['image'];
    advertiser = json?['advertiser'];
    activated = json?['activated'];
    line1 = json?['line1'];
    line2 = json?['line2'];
    age = json?['age'];
    birthday = json?['birthday'];
    region = json?['region'];
    nationality = json?['nationality'];
    countryCode = json?['country_code'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['token'] = token;
    _data['name'] = name;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['city_id'] = cityId;
    _data['image'] = image;
    _data['advertiser'] = advertiser;
    _data['activated'] = activated;
    _data['line1'] = line1;
    _data['line2'] = line2;
    _data['age'] = age;
    _data['birthday'] = birthday;
    _data['region'] = region;
    _data['nationality'] = nationality;
    _data['country_code'] = countryCode;
    return _data;
  }
}
