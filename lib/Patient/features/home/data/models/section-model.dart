class SectionModel {
  SectionModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;

  SectionModel.fromJson(Map<String, dynamic>? json) {
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
    required this.firstnameAr,
    required this.firstnameEn,
    required this.lastnameAr,
    required this.lastnameEn,
    required this.mobile,
    required this.email,
    this.image,
    this.images,
    this.descAr,
    this.descEn,
    required this.addressAr,
    this.addressEn,
    required this.gender,
    required this.iban,
    this.location,
    required this.bundleId,
    required this.countryId,
    required this.cityId,
    this.areaId,
    this.startfrom,
    required this.endat,
    required this.sessionPrice,
    required this.sessionDur,
    this.lat,
    this.lng,
    required this.status,
    this.centerId,
    required this.fcmToken,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.nameAr,
    required this.nameEn,
    required this.categories,
    required this.statusAdvisor,
    this.workinghours,
    required this.rates,
  });
  late final int? id;
  late final String? firstnameAr;
  late final String? firstnameEn;
  late final String? lastnameAr;
  late final String? lastnameEn;
  late final String? mobile;
  late final String? email;
  late final String? image;
  var images;
  late final String? descAr;
  late final String? descEn;
  late final String? addressAr;
  late final String? addressEn;
  late final String? gender;
  late final String? iban;
  late var location;
  late final int? bundleId;
  late final int? countryId;
  late final int? cityId;
  late final int? areaId;
  late final String? startfrom;
  late final String? endat;
  late final int? sessionPrice;
  late final int? sessionDur;
  late final String? lat;
  late final String? lng;
  late final String? status;
  late var centerId;
  late final String? fcmToken;
  late final int? isOnline;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? rating;
  late final String? nameAr;
  late final String? nameEn;
  late final List<Categories> categories;
  late final List<StatusAdvisor> statusAdvisor;
  late final Workinghours? workinghours;
  late final List<dynamic>? rates;

  Data.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstnameAr = json?['firstname_ar'];
    firstnameEn = json?['firstname_en'];
    lastnameAr = json?['lastname_ar'];
    lastnameEn = json?['lastname_en'];
    mobile = json?['mobile'];
    email = json?['email'];
    image = json?['image'];
    images = json?['images'];
    descAr = json?['desc_ar'];
    descEn = json?['desc_en'];
    addressAr = json?['address_ar'];
    addressEn = json?['address_en'];
    gender = json?['gender'];
    iban = json?['iban'];
    location = json?['location'];
    bundleId = json?['bundle_id'];
    countryId = json?['country_id'];
    cityId = json?['city_id'];
    areaId = json?['area_id'];
    startfrom = json?['start_from'];
    endat = json?['endat'];
    sessionPrice = json?['session_price'];
    sessionDur = json?['session_dur'];
    lat = json?['lat'];
    lng = json?['lng'];
    status = json?['status'];
    centerId = json?['center_id'];
    fcmToken = json?['fcm_token'];
    isOnline = json?['is_online'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    rating = json?['rating'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    categories = List.from(json?['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    statusAdvisor = List.from(json?['status_advisor'])
        .map((e) => StatusAdvisor.fromJson(e))
        .toList();
    workinghours = null;
    rates = List.castFrom<dynamic, dynamic>(json?['rates']);
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
    _data['status_advisor'] = statusAdvisor.map((e) => e.toJson()).toList();
    _data['workinghours'] = workinghours;
    _data['rates'] = rates;
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
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;
  late final int? orderNum;
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
  late final int? advertiserId;
  late final int? categoryId;

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
    required this.pivot,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;
  late final Pivot pivot;

  StatusAdvisor.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Workinghours {
  Workinghours({
    required this.id,
    required this.advertiserId,
    this.sundayStartAt,
    this.sundayEndIn,
    this.mondayStartAt,
    this.mondayEndIn,
    this.tuesdayStartAt,
    this.tuesdayEndIn,
    this.wednesdayStartAt,
    this.wednesdayEndIn,
    this.thursdayStartAt,
    this.thursdayEndIn,
    this.fridayStartAt,
    this.fridayEndIn,
    this.saturdayStartAt,
    this.saturdayEndIn,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final int? advertiserId;
  late final String? sundayStartAt;
  late final String? sundayEndIn;
  late final String? mondayStartAt;
  late final String? mondayEndIn;
  late final String? tuesdayStartAt;
  late final String? tuesdayEndIn;
  late final String? wednesdayStartAt;
  late final String? wednesdayEndIn;
  late final String? thursdayStartAt;
  late final String? thursdayEndIn;
  late final String? fridayStartAt;
  late final String? fridayEndIn;
  late final String? saturdayStartAt;
  late final String? saturdayEndIn;
  late final String? createdAt;
  late final String? updatedAt;

  Workinghours.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    advertiserId = json?['advertiser_id'];
    sundayStartAt = null;
    sundayEndIn = null;
    mondayStartAt = null;
    mondayEndIn = null;
    tuesdayStartAt = null;
    tuesdayEndIn = null;
    wednesdayStartAt = null;
    wednesdayEndIn = null;
    thursdayStartAt = null;
    thursdayEndIn = null;
    fridayStartAt = null;
    fridayEndIn = null;
    saturdayStartAt = null;
    saturdayEndIn = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['advertiser_id'] = advertiserId;
    _data['sunday_start_at'] = sundayStartAt;
    _data['sunday_end_in'] = sundayEndIn;
    _data['monday_start_at'] = mondayStartAt;
    _data['monday_end_in'] = mondayEndIn;
    _data['tuesday_start_at'] = tuesdayStartAt;
    _data['tuesday_end_in'] = tuesdayEndIn;
    _data['wednesday_start_at'] = wednesdayStartAt;
    _data['wednesday_end_in'] = wednesdayEndIn;
    _data['thursday_start_at'] = thursdayStartAt;
    _data['thursday_end_in'] = thursdayEndIn;
    _data['friday_start_at'] = fridayStartAt;
    _data['friday_end_in'] = fridayEndIn;
    _data['saturday_start_at'] = saturdayStartAt;
    _data['saturday_end_in'] = saturdayEndIn;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
