class FavoriteModel {
  FavoriteModel({
    required this.success,
    required this.data1,
    required this.message,
  });
  late final bool success;
  late final Data1 data1;
  late final String? message;

  FavoriteModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data1 = Data1.fromJson(json?['data1']);
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data1'] = data1.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data1 {
  Data1({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late var currentPage;
  late var data;
  late final String? firstPageUrl;
  late var from;
  late var lastPage;
  late final String? lastPageUrl;
  late final Null nextPageUrl;
  late final String? path;
  late var perPage;
  late final Null prevPageUrl;
  late var to;
  late var total;

  Data1.fromJson(Map<String, dynamic>? json) {
    currentPage = json?['current_page'];
    data = json?['data'] == null
        ? null
        : List.from(json?['data']).map((e) => Data.fromJson(e)).toList();
    firstPageUrl = json?['first_page_url'];
    from = json?['from'];
    lastPage = json?['last_page'];
    lastPageUrl = json?['last_page_url'];
    nextPageUrl = null;
    path = json?['path'];
    perPage = json?['per_page'];
    prevPageUrl = null;
    to = json?['to'];
    total = json?['total'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
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
  late var id;
  late var userId;
  late var advertiserId;
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
    required this.image,
    this.images,
    required this.descAr,
    required this.descEn,
    required this.addressAr,
    required this.addressEn,
    required this.gender,
    this.iban,
    this.location,
    required this.bundleId,
    required this.countryId,
    required this.cityId,
    required this.areaId,
    required this.startfrom,
    required this.endat,
    required this.sessionPrice,
    required this.sessionDur,
    required this.lat,
    required this.lng,
    required this.status,
    this.centerId,
    this.fcmToken,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.nameAr,
    required this.nameEn,
    required this.categories,
    required this.statusAdvisor,
  });
  late var id;
  late final String? firstnameAr;
  late final String? firstnameEn;
  late final String? lastnameAr;
  late final String? lastnameEn;
  late final String? mobile;
  late final String? email;
  late final String? image;
  late final Null images;
  late final String? descAr;
  late final String? descEn;
  late final String? addressAr;
  late final String? addressEn;
  late final String? gender;
  late final Null iban;
  late final Null location;
  late var bundleId;
  late var countryId;
  late var cityId;
  late var areaId;
  late final String? startfrom;
  late final String? endat;
  late var sessionPrice;
  late var sessionDur;
  late final String? lat;
  late final String? lng;
  late final String? status;
  late final Null centerId;
  late final Null fcmToken;
  late var isOnline;
  late final String? createdAt;
  late final String? updatedAt;
  late var rating;
  late final String? nameAr;
  late final String? nameEn;
  late final List<Categories> categories;
  late final List<dynamic> statusAdvisor;

  Advertiser.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstnameAr = json?['firstname_ar'];
    firstnameEn = json?['firstname_en'];
    lastnameAr = json?['lastname_ar'];
    lastnameEn = json?['lastname_en'];
    mobile = json?['mobile'];
    email = json?['email'];
    image = json?['image'];
    images = null;
    descAr = json?['desc_ar'];
    descEn = json?['desc_en'];
    addressAr = json?['address_ar'];
    addressEn = json?['address_en'];
    gender = json?['gender'];
    iban = null;
    location = null;
    bundleId = json?['bundle_id'];
    countryId = json?['country_id'];
    cityId = json?['city_id'];
    areaId = json?['area_id'];
    startfrom = json?['startfrom'];
    endat = json?['endat'];
    sessionPrice = json?['session_price'];
    sessionDur = json?['session_dur'];
    lat = json?['lat'];
    lng = json?['lng'];
    status = json?['status'];
    centerId = null;
    fcmToken = null;
    isOnline = json?['is_online'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    rating = json?['rating'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    categories = List.from(json?['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    statusAdvisor = List.castFrom<dynamic, dynamic>(json?['status_advisor']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstname_ar'] = firstnameAr;
    _data['firstname_en'] = firstnameEn;
    _data['lastname_ar'] = lastnameAr;
    _data['lastname_en'] = lastnameEn;
    _data['mobile'] = mobile;
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
    _data['rating'] = rating;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['status_advisor'] = statusAdvisor;
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
  late var id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;
  late var orderNum;
  late final String? image;
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
  late var advertiserId;
  late var categoryId;

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

class User {
  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.image,
    this.fcmToken,
    required this.email,
    this.emailVerifiedAt,
    required this.gender,
    required this.cityId,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.doctorReports,
    required this.diagnoseForms,
  });
  late var id;
  late final String? name;
  late final String? mobile;
  late final String? image;
  late final Null fcmToken;
  late final String? email;
  late final Null emailVerifiedAt;
  late final String? gender;
  late var cityId;
  late final Null centerId;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null deletedAt;
  late final List<dynamic> doctorReports;
  late final List<dynamic> diagnoseForms;

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = json?['image'];
    fcmToken = null;
    email = json?['email'];
    emailVerifiedAt = null;
    gender = json?['gender'];
    cityId = json?['city_id'];
    centerId = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = null;
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
    _data['doctor_reports'] = doctorReports;
    _data['diagnose_forms'] = diagnoseForms;
    return _data;
  }
}
