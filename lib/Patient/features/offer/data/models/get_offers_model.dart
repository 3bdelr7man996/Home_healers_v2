
class GetOffersModel {
  GetOffersModel({
    required this.success,
    required this.offers,
    required this.message,
  });
  late final bool success;
  late final List<Offers> offers;
  late var message;

  GetOffersModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    offers = List.from(json?['offers']).map((e) => Offers.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['offers'] = offers.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Offers {
  Offers({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.sessionCount,
    required this.price,
    required this.advertiserId,
    required this.type,
    this.description,
    required this.oldPrice,
    required this.discount,
    required this.advertiser,
  });
  late var id;
  late var createdAt;
  late var updatedAt;
  late var sessionCount;
  late var price;
  late var advertiserId;
  late var type;
  late var description;
  late var oldPrice;
  late var discount;
  late final Advertiser advertiser;

  Offers.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    sessionCount = json?['session_count'];
    price = json?['price'];
    advertiserId = json?['advertiser_id'];
    type = json?['type'];
    description = json?['description'];
    oldPrice = json?['old_price'];
    discount = json?['discount'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['session_count'] = sessionCount;
    _data['price'] = price;
    _data['advertiser_id'] = advertiserId;
    _data['type'] = type;
    _data['description'] = description;
    _data['old_price'] = oldPrice;
    _data['discount'] = discount;
    _data['advertiser'] = advertiser.toJson();
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
    this.descAr,
    this.descEn,
    required this.addressAr,
    required this.addressEn,
    required this.gender,
    required this.iban,
    required this.location,
    this.bundleId,
    required this.countryId,
    required this.cityId,
    this.areaId,
    this.startfrom,
    this.endat,
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
    required this.points,
    required this.activated,
    required this.rating,
    required this.nameAr,
    required this.nameEn,
    required this.categories,
    required this.statusAdvisor,
  });
  late var id;
  late var firstnameAr;
  late var firstnameEn;
  late var lastnameAr;
  late var lastnameEn;
  late var mobile;
  late var email;
  late var image;
  late var images;
  late var descAr;
  late var descEn;
  late var addressAr;
  late var addressEn;
  late var gender;
  late var iban;
  late var location;
  late var bundleId;
  late var countryId;
  late var cityId;
  late var areaId;
  late var startfrom;
  late var endat;
  late var sessionPrice;
  late var sessionDur;
  late var lat;
  late var lng;
  late var status;
  late var centerId;
  late var fcmToken;
  late var isOnline;
  late var createdAt;
  late var updatedAt;
  late var points;
  late var activated;
  late var rating;
  late var nameAr;
  late var nameEn;
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
    endat = json?['end_at'];
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
  late var id;
  late var nameAr;
  late var nameEn;
  late var status;
  late var orderNum;
  late var image;
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

class StatusAdvisor {
  StatusAdvisor({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    this.image,
    required this.pivot,
  });
  late var id;
  late var nameAr;
  late var nameEn;
  late var status;
  late var image;
  late final Pivot pivot;

  StatusAdvisor.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    image = json?['image'];
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
