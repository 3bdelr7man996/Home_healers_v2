import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';

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
    this.statusId,
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
  int? statusId;
  late final Advertiser? advertiser;

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
    statusId = json?['status_id'];
    advertiser = json?['advertiser'] != null
        ? Advertiser.fromJson(json?['advertiser'])
        : null;
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
    _data['advertiser'] = advertiser!.toJson();
    return _data;
  }
}
