class UpdateReservationModel {
  UpdateReservationModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String? message;

  UpdateReservationModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = Data.fromJson(json?['data']);
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.parentId,
    required this.userId,
    required this.advertiserId,
    this.notes,
    this.coupon,
    this.days,
    required this.startAt,
    required this.endAt,
    required this.sessionsCount,
    required this.subTotal,
    required this.vat,
    required this.fees,
    required this.amount,
    required this.isPaid,
    this.paymentDetails,
    required this.status,
    this.lat,
    this.lang,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.statusId,
    this.qrCode,
    required this.reports,
    this.diagnoseForm,
    required this.advertiser,
    required this.posts,
    required this.user,
  });
  var id;
  var parentId;
  var userId;
  var advertiserId;
  var notes;
  var coupon;
  var days;
  late final String? startAt;
  late final String? endAt;
  var sessionsCount;
  var subTotal;
  late final String? vat;
  var fees;
  var amount;
  var isPaid;
  var paymentDetails;
  late final String? status;
  var lat;
  var lang;
  var centerId;
  late final String? createdAt;
  late final String? updatedAt;
  var deletedAt;
  var statusId;
  var qrCode;
  var reports;
  var diagnoseForm;
  late final Advertiser advertiser;
  var posts;
  late final User user;

  Data.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    parentId = json?['parent_id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    notes = json?['notes'];
    coupon = json?['coupon'];
    days = json?['days'];
    startAt = json?['start_at'];
    endAt = json?['end_at'];
    sessionsCount = json?['sessions_count'];
    subTotal = json?['sub_total'];
    vat = json?['vat'];
    fees = json?['fees'];
    amount = json?['amount'];
    isPaid = json?['is_paid'];
    paymentDetails = json?['paymentDetails'];
    status = json?['status'];
    lat = json?['lat'];
    lang = json?['lang'];
    centerId = json?['center_id'];

    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = json?['deleted_at'];
    statusId = json?['status_id'];
    qrCode = json?['qr_code'];
    reports = json?['reports'];
    diagnoseForm = json?['diagnose_form'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
    posts = json?['posts'];
    user = User.fromJson(json?['user']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['notes'] = notes;
    _data['coupon'] = coupon;
    _data['days'] = days;
    _data['start_at'] = startAt;
    _data['end_at'] = endAt;
    _data['sessions_count'] = sessionsCount;
    _data['sub_total'] = subTotal;
    _data['vat'] = vat;
    _data['fees'] = fees;
    _data['amount'] = amount;
    _data['is_paid'] = isPaid;
    _data['payment_details'] = paymentDetails;
    _data['status'] = status;
    _data['lat'] = lat;
    _data['lang'] = lang;
    _data['center_id'] = centerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['status_id'] = statusId;
    _data['qr_code'] = qrCode;
    _data['reports'] = reports;
    _data['diagnose_form'] = diagnoseForm;
    _data['advertiser'] = advertiser.toJson();
    _data['posts'] = posts;
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
    required this.rating,
    required this.nameAr,
    required this.nameEn,
    required this.categories,
    required this.statusAdvisor,
  });
  var id;
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
  var iban;
  late final String? location;
  var bundleId;
  var countryId;
  var cityId;
  var areaId;
  var startfrom;
  var endat;
  var sessionPrice;
  var sessionDur;
  late final String? lat;
  late final String? lng;
  late final String? status;
  var centerId;
  var fcmToken;
  var isOnline;
  late final String? createdAt;
  late final String? updatedAt;
  var rating;
  late final String? nameAr;
  late final String? nameEn;
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
  var id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;
  var orderNum;
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
  var advertiserId;
  var categoryId;

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
  var id;
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

class User {
  User({
    required this.id,
    required this.name,
    required this.mobile,
    this.image,
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
  var id;
  late final String? name;
  late final String? mobile;
  var image;
  var fcmToken;
  late final String? email;
  var emailVerifiedAt;
  late final String? gender;
  var cityId;
  var centerId;
  late final String? createdAt;
  late final String? updatedAt;
  var deletedAt;
  var doctorReports;
  var diagnoseForms;

  User.fromJson(Map<String, dynamic>? json) {
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
    deletedAt = json?['delet_at'];
    doctorReports = json?['doctor_reports'];
    diagnoseForms = json?['diagnose_forms'];
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
