class SignUpForPatientModel {
  SignUpForPatientModel({
    required this.success,
  });
  late final Success success;

  SignUpForPatientModel.fromJson(Map<String, dynamic>? json) {
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
    required this.token,
    required this.name,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.cityId,
  });
  late final int id;
  late final String token;
  late final String name;
  late final String mobile;
  late final String email;
  late final String gender;
  late final String cityId;

  Success.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    token = json?['token'];
    name = json?['name'];
    mobile = json?['mobile'];
    email = json?['email'];
    gender = json?['gender'];
    cityId = json?['city_id'];
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

    return _data;
  }
}
