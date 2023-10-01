import 'package:dr/doctor/features/auth/data/model/status_model.dart';

import 'departements_model.dart';

class Advertiser {
  Advertiser({
    this.id,
    this.firstnameAr,
    this.firstnameEn,
    this.lastnameAr,
    this.lastnameEn,
    this.mobile,
    this.email,
    this.image,
    this.images,
    this.descAr,
    this.descEn,
    this.addressAr,
    this.addressEn,
    this.gender,
    this.iban,
    this.location,
    this.bundleId,
    this.countryId,
    this.cityId,
    this.areaId,
    this.startfrom,
    this.endat,
    this.sessionPrice,
    this.sessionDur,
    this.lat,
    this.lng,
    this.status,
    this.centerId,
    this.fcmToken,
    this.isOnline,
    this.createdAt,
    this.updatedAt,
    this.rating,
    this.nameAr,
    this.nameEn,
    this.categories,
    this.statusAdvisor,
  });
  late final int? id;
  late final String? firstnameAr;
  late final String? firstnameEn;
  late final String? lastnameAr;
  late final String? lastnameEn;
  late final String? mobile;
  late final String? email;
  late final String? image;
  late final List<String>? images;
  late final String? descAr;
  late final String? descEn;
  late final String? addressAr;
  late final String? addressEn;
  late final String? gender;
  late final String? iban;
  late final String? location;
  late final String? bundleId;
  late final int? countryId;
  late final int? cityId;
  late final int? areaId;
  late final DateTime? startfrom;
  late final DateTime? endat;
  late final int? sessionPrice;
  late final int? sessionDur;
  late final String? lat;
  late final String? lng;
  late final String? status;
  late final int? centerId;
  late final String? fcmToken;
  late final int? isOnline;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? rating;
  late final String? nameAr;
  late final String? nameEn;
  late final List<Categories>? categories;
  late final List<StatusData>? statusAdvisor;

  Advertiser.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstnameAr = json?['firstname_ar'];
    firstnameEn = json?['firstname_en'];
    lastnameAr = json?['lastname_ar'];
    lastnameEn = json?['lastname_en'];
    mobile = json?['mobile'];
    email = json?['email'];
    image = json?['image'];
    images =
        json?['images'] != null ? json!['images'].toString().split(",") : null;
    descAr = json?['desc_ar'];
    descEn = json?['desc_en'];
    addressAr = json?["address_ar"];
    addressEn = json?["address_en"];
    gender = json?['gender'];
    iban = json?['iban'];
    location = json?["location"];
    bundleId = json?["bundle_id"];
    countryId = json?['country_id'];
    cityId = json?['city_id'];
    areaId = json?["area_id"];
    startfrom = (json?["startfrom"] != null)
        ? DateTime.parse(json?["startfrom"])
        : null;
    endat = (json?["endat"] != null) ? DateTime.parse(json?["endat"]) : null;
    sessionPrice = json?['session_price'];
    sessionDur = json?['session_dur'];
    lat = json?["lat"];
    lng = json?["lng"];
    status = json?['status'];
    centerId = json?['center_id'];
    fcmToken = json?['fcm_token'];
    isOnline = json?['is_online'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    rating = json?['rating'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    categories = json?['categories'] != null
        ? List.from(json?['categories'])
            .map((e) => Categories.fromJson(e))
            .toList()
        : null;
    statusAdvisor = json?['status_advisor'] != null
        ? List.from(json?['status_advisor'])
            .map((e) => StatusData.fromJson(e))
            .toList()
        : null;

    // List.castFrom<dynamic, dynamic>(json?['status_advisor']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstname_ar'] = firstnameAr;
    data['firstname_en'] = firstnameEn;
    data['lastname_ar'] = lastnameAr;
    data['lastname_en'] = lastnameEn;
    data['mobile'] = mobile;
    data['email'] = email;
    data['image'] = image;
    data['images'] = images;
    data['desc_ar'] = descAr;
    data['desc_en'] = descEn;
    data['address_ar'] = addressAr;
    data['address_en'] = addressEn;
    data['gender'] = gender;
    data['iban'] = iban;
    data['location'] = location;
    data['bundle_id'] = bundleId;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['startfrom'] = startfrom;
    data['endat'] = endat;
    data['session_price'] = sessionPrice;
    data['session_dur'] = sessionDur;
    data['lat'] = lat;
    data['lng'] = lng;
    data['status'] = status;
    data['center_id'] = centerId;
    data['fcm_token'] = fcmToken;
    data['is_online'] = isOnline;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['rating'] = rating;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['categories'] = categories?.map((e) => e.toJson()).toList();
    data['status_advisor'] = statusAdvisor;
    return data;
  }
}
