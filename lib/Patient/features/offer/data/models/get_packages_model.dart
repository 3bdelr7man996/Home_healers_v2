class GetPackagesModel {
  GetPackagesModel({
    required this.success,
    required this.packages,
    required this.message,
  });
  late final bool success;
  late final List<Packages> packages;
  late final String message;

  GetPackagesModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    packages =
        List.from(json?['packages']).map((e) => Packages.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['packages'] = packages.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Packages {
  Packages({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.sessionCount,
    required this.price,
    required this.status_id,
    this.advertiserId,
    required this.type,
    required this.description,
    required this.oldPrice,
    required this.discount,
  });
  late final int id;
  late final String createdAt;
  late final String updatedAt;
  late final int sessionCount;
  late final int price;
  late var status_id;
  late var advertiserId;
  late final String type;
  late final String description;
  late final int oldPrice;
  late final String discount;

  Packages.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    sessionCount = json?['session_count'];
    price = json?['price'];
    status_id = json?['status_id'];
    advertiserId = json?['advertiser_id'];
    type = json?['type'];
    description = json?['description'];
    oldPrice = json?['old_price'];
    discount = json?['discount'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['session_count'] = sessionCount;
    _data['price'] = price;
    _data['status_id'] = status_id;
    _data['advertiser_id'] = advertiserId;
    _data['type'] = type;
    _data['description'] = description;
    _data['old_price'] = oldPrice;
    _data['discount'] = discount;
    return _data;
  }
}
