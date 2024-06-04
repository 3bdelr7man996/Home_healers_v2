import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';

import 'departements_model.dart';
import 'rates_model.dart';
import 'working_hours_model.dart';

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
    this.activated,
    this.bundleId,
    this.countryId,
    this.cityId,
    this.areaId,
    this.startfrom,
    this.endat,
    this.sessionPrice,
    this.sessionDur,
    this.nationalId,
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
    this.workinghours,
    this.offers,
    this.rates,
    this.reservationsCount,
    this.years,
    this.isFav = false,
  });
  int? id;
  String? firstnameAr;
  String? firstnameEn;
  String? lastnameAr;
  String? lastnameEn;
  String? mobile;
  String? email;
  String? image;
  List<String>? images;
  String? descAr;
  String? descEn;
  String? addressAr;
  String? addressEn;
  String? gender;
  String? iban;
  String? nationalId;
  String? location;
  int? activated;
  int? bundleId;
  int? countryId;
  int? cityId;
  int? areaId;
  DateTime? startfrom;
  DateTime? endat;
  int? sessionPrice;
  int? sessionDur;
  String? lat;
  String? lng;
  String? status;
  int? centerId;
  String? fcmToken;
  int? isOnline;
  String? createdAt;
  String? updatedAt;
  int? rating;
  String? nameAr;
  String? nameEn;
  List<Categories>? categories;
  List<StatusData>? statusAdvisor;
  Workinghours? workinghours;
  List<Rates>? rates;
  int? years;
  int? reservationsCount;
  List<Offers>? offers;
  bool? isFav;

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
    nationalId = json?['national_id'];
    location = json?["location"];
    activated = json?["activated"];
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
    years = json?['years'] ?? 5;
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
    workinghours = json?['workinghours'] != null
        ? new Workinghours.fromJson(json?['workinghours'])
        : null;
    if (json?['rates'] != null) {
      rates = <Rates>[];
      json?['rates'].forEach((v) {
        rates!.add(new Rates.fromJson(v));
      });
    }
    if (json?['offers'] != null) {
      offers = <Offers>[];
      json?['offers'].forEach((v) {
        offers?.add(new Offers.fromJson(v));
      });
    }
    isFav = false;
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
    data['national_id'] = nationalId;
    data['location'] = location;
    data['activated'] = activated;
    data['bundle_id'] = bundleId;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['startfrom'] = startfrom != null ? startfrom.toString() : null;
    data['endat'] = endat != null ? endat.toString() : null;
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

  Advertiser copyWith({
    int? id,
    String? firstnameAr,
    String? firstnameEn,
    String? lastnameAr,
    String? lastnameEn,
    String? mobile,
    String? email,
    String? image,
    List<String>? images,
    String? descAr,
    String? descEn,
    String? addressAr,
    String? addressEn,
    String? gender,
    String? iban,
    String? nationalId,
    String? location,
    int? activated,
    int? bundleId,
    int? countryId,
    int? cityId,
    int? areaId,
    DateTime? startfrom,
    DateTime? endat,
    int? sessionPrice,
    int? sessionDur,
    String? lat,
    String? lng,
    String? status,
    int? centerId,
    String? fcmToken,
    int? isOnline,
    String? createdAt,
    String? updatedAt,
    int? rating,
    String? nameAr,
    String? nameEn,
    List<Categories>? categories,
    List<StatusData>? statusAdvisor,
    Workinghours? workinghours,
    List<Rates>? rates,
    int? years,
    int? reservationsCount,
    List<Offers>? offers,
    bool? isFav,
  }) {
    return Advertiser(
      id: id ?? this.id,
      firstnameAr: firstnameAr ?? this.firstnameAr,
      firstnameEn: firstnameEn ?? this.firstnameEn,
      lastnameAr: lastnameAr ?? this.lastnameAr,
      lastnameEn: lastnameEn ?? this.lastnameEn,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      image: image ?? this.image,
      images: images ?? this.images,
      descAr: descAr ?? this.descAr,
      descEn: descEn ?? this.descEn,
      addressAr: addressAr ?? this.addressAr,
      addressEn: addressEn ?? this.addressEn,
      gender: gender ?? this.gender,
      iban: iban ?? this.iban,
      nationalId: nationalId ?? this.nationalId,
      location: location ?? this.location,
      activated: activated ?? this.activated,
      bundleId: bundleId ?? this.bundleId,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      areaId: areaId ?? this.areaId,
      startfrom: startfrom ?? this.startfrom,
      endat: endat ?? this.endat,
      sessionPrice: sessionPrice ?? this.sessionPrice,
      sessionDur: sessionDur ?? this.sessionDur,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      status: status ?? this.status,
      centerId: centerId ?? this.centerId,
      fcmToken: fcmToken ?? this.fcmToken,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rating: rating ?? this.rating,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      categories: categories ?? this.categories,
      statusAdvisor: statusAdvisor ?? this.statusAdvisor,
      workinghours: workinghours ?? this.workinghours,
      rates: rates ?? this.rates,
      years: years ?? this.years,
      reservationsCount: reservationsCount ?? this.reservationsCount,
      offers: offers ?? this.offers,
      isFav: isFav ?? this.isFav,
    );
  }
}
