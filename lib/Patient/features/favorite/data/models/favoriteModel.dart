class FavoriteModel {
  FavoriteModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;

  FavoriteModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = List.from(json?['data']).map((e) => Data.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.advertiserId,
    required this.advertiser,
    required this.user,
  });
  late final int id;
  late final int userId;
  late final int advertiserId;
  late final Advertiser advertiser;
  late final User user;

  Data.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
    user = User.fromJson(json?['user']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['advertiser'] = advertiser.toJson();
    _data['user'] = user.toJson();
    return _data;
  }
}

class Advertiser {
  Advertiser({
    required this.id,
    required this.firstnameAr,
    required this.firstnameEn,
    required this.lastnameAr,
    required this.lastnameEn,
    required this.mobile,
    required this.email,
    this.image,
    this.images,
    this.descAr,
    this.years,
    this.descEn,
    required this.addressAr,
    this.addressEn,
    required this.gender,
    this.iban,
    this.location,
    required this.bundleId,
    required this.countryId,
    required this.cityId,
    this.areaId,
    required this.startfrom,
    required this.endat,
    required this.sessionPrice,
    required this.sessionDur,
    this.lat,
    this.lng,
    required this.status,
    this.centerId,
    this.fcmToken,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
    required this.points,
    required this.activated,
    required this.rating,
    required this.nameAr,
    required this.nameEn,
    required this.categories,
    required this.statusAdvisor,
  });
  late final int id;
  late final String firstnameAr;
  late final String firstnameEn;
  late final String lastnameAr;
  late final String lastnameEn;
  late final String mobile;
  late final String email;
  late final String? image;
  late final years;
  late final List<String>? images;
  late final String? descAr;
  late final String? descEn;
  late final String addressAr;
  late final String? addressEn;
  late final String gender;
  late final String? iban;
  late final Null location;
  late final int bundleId;
  late final int countryId;
  late final int cityId;
  late final int? areaId;
  late final String startfrom;
  late final String endat;
  late final int sessionPrice;
  late final int sessionDur;
  late final String? lat;
  late final String? lng;
  late final String status;
  late final Null centerId;
  late final String? fcmToken;
  late final int isOnline;
  late final String createdAt;
  late final String updatedAt;
  late final int points;
  late final int activated;
  late final int rating;
  late final String nameAr;
  late final String nameEn;
  late final List<Categories> categories;
  late final List<StatusAdvisor> statusAdvisor;

  Advertiser.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstnameAr = json?['firstname_ar'];
    firstnameEn = json?['firstname_en'];
    lastnameAr = json?['lastname_ar'];
    lastnameEn = json?['lastname_en'];
    mobile = json?['mobile'];
    email = json?['email'];
    years = json?['years'];
    image = null;
    images = null;
    descAr = null;
    descEn = null;
    addressAr = json?['address_ar'];
    addressEn = null;
    gender = json?['gender'];
    iban = null;
    location = null;
    bundleId = json?['bundle_id'];
    countryId = json?['country_id'];
    cityId = json?['city_id'];
    areaId = null;
    startfrom = json?['startfrom'];
    endat = json?['endat'];
    sessionPrice = json?['session_price'];
    sessionDur = json?['session_dur'];
    lat = null;
    lng = null;
    status = json?['status'];
    centerId = null;
    fcmToken = null;
    isOnline = json?['is_online'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    points = json?['points'];
    activated = json?['activated'];
    rating = json?['rating'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    categories = List.from(json?['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    statusAdvisor = List.from(json?['status_advisor'])
        .map((e) => StatusAdvisor.fromJson(e))
        .toList();
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstname_ar'] = firstnameAr;
    _data['firstname_en'] = firstnameEn;
    _data['lastname_ar'] = lastnameAr;
    _data['lastname_en'] = lastnameEn;
    _data['mobile'] = mobile;
    _data['years'] = years;
    _data['email'] = email;
    _data['image'] = image;
    _data['images'] = images;
    _data['desc_ar'] = descAr;
    _data['desc_en'] = descEn;
    _data['address_ar'] = addressAr;
    _data['address_en'] = addressEn;
    _data['gender'] = gender;
    _data['iban'] = iban;
    _data['location'] = location;
    _data['bundle_id'] = bundleId;
    _data['country_id'] = countryId;
    _data['city_id'] = cityId;
    _data['area_id'] = areaId;
    _data['startfrom'] = startfrom;
    _data['endat'] = endat;
    _data['session_price'] = sessionPrice;
    _data['session_dur'] = sessionDur;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['status'] = status;
    _data['center_id'] = centerId;
    _data['fcm_token'] = fcmToken;
    _data['is_online'] = isOnline;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['points'] = points;
    _data['activated'] = activated;
    _data['rating'] = rating;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['status_advisor'] = statusAdvisor.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.orderNum,
    required this.image,
    required this.pivot,
  });
  late final int id;
  late final String nameAr;
  late final String nameEn;
  late final String status;
  late final int orderNum;
  late final String image;
  late final Pivot pivot;

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    orderNum = json?['order_num'];
    image = json?['image'];
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    _data['order_num'] = orderNum;
    _data['image'] = image;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.advertiserId,
    required this.categoryId,
  });
  late final int advertiserId;
  late final int categoryId;

  Pivot.fromJson(Map<String, dynamic>? json) {
    advertiserId = json?['advertiser_id'];
    categoryId = json?['category_id'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['advertiser_id'] = advertiserId;
    _data['category_id'] = categoryId;
    return _data;
  }
}

class StatusAdvisor {
  StatusAdvisor({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    this.image,
    required this.pivot,
  });
  late final int id;
  late final String nameAr;
  late final String nameEn;
  late final String status;
  late final Null image;
  late final Pivot pivot;

  StatusAdvisor.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    image = null;
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    _data['image'] = image;
    _data['pivot'] = pivot.toJson();
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
  });
  late final int id;
  late final String name;
  late final String mobile;
  late final String image;
  late final String fcmToken;
  late final String email;
  late final Null emailVerifiedAt;
  late final String gender;
  late final int cityId;
  late final Null centerId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final int points;
  late final int activated;
  late final Null line1;
  late final Null line2;
  late final Null age;
  late final Null birthday;
  late final Null countryCode;
  late final Null firstName;
  late final Null lastName;
  late final Null region;
  late final Null nationality;
  late final List<dynamic> doctorReports;
  late final List<dynamic> diagnoseForms;

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = json?['image'];
    fcmToken = json?['fcm_token'];
    email = json?['email'];
    emailVerifiedAt = null;
    gender = json?['gender'];
    cityId = json?['city_id'];
    centerId = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = null;
    points = json?['points'];
    activated = json?['activated'];
    line1 = null;
    line2 = null;
    age = null;
    birthday = null;
    countryCode = null;
    firstName = null;
    lastName = null;
    region = null;
    nationality = null;
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
    _data['doctor_reports'] = doctorReports;
    _data['diagnose_forms'] = diagnoseForms;
    return _data;
  }
}
