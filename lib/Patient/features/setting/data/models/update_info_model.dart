class UpdateInfoModel {
  UpdateInfoModel({
    required this.success,
  });
  late final Success success;

  UpdateInfoModel.fromJson(Map<String?, dynamic>? json) {
    success = Success.fromJson(json?['success']);
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['success'] = success.toJson();
    return _data;
  }
}

class Success {
  Success({
    required this.name,
    this.token,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.cityId,
    this.image,
    this.advertiser,
    required this.id,
  });
  late final String? name;
  late final String? token;
  late final String? mobile;
  late final String? email;
  late final String? gender;
  late final int cityId;
  late final String? image;
  late final Null advertiser;
  late final int id;

  Success.fromJson(Map<String?, dynamic>? json) {
    name = json?['name'];
    token = json?['token'];
    mobile = json?['mobile'];
    email = json?['email'];
    gender = json?['gender'];
    cityId = json?['city_id'];
    image = json?['image'];
    advertiser = null;
    id = json?['id'];
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['name'] = name;
    _data['token'] = token;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['city_id'] = cityId;
    _data['image'] = image;
    _data['advertiser'] = advertiser;
    _data['id'] = id;
    return _data;
  }
}
