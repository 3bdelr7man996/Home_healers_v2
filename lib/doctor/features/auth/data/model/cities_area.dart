class CitiesAreaModel {
  CitiesAreaModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<CityData> data;
  late final String message;

  CitiesAreaModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = List.from(json?['data']).map((e) => CityData.fromJson(e)).toList();
    message = json?['message'];
  }
}

class CityData {
  CityData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.countryId,
    required this.status,
    required this.area,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final int? countryId;
  late final String? status;
  late final List<Area>? area;

  CityData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    countryId = json?['country_id'];
    status = json?['status'];
    area = List.from(json?['area']).map((e) => Area.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['country_id'] = countryId;
    data['status'] = status;
    data['area'] = area?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Area {
  Area({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.status,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final int? cityId;
  late final String? status;

  Area.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    cityId = json?['city_id'];
    status = json?['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['city_id'] = cityId;
    data['status'] = status;
    return data;
  }
}
