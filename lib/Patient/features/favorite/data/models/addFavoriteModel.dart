class AddFavoriteModel {
  AddFavoriteModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late var message;

  AddFavoriteModel.fromJson(Map<String?, dynamic>? json) {
    success = json?['success'];
    data = Data.fromJson(json?['data']);
    message = json?['message'];
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.advertiserId,
    required this.userId,
    required this.id,
  });
  late var advertiserId;
  late var userId;
  late var id;

  Data.fromJson(Map<String?, dynamic>? json) {
    advertiserId = json?['advertiser_id'];
    userId = json?['user_id'];
    id = json?['id'];
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['advertiser_id'] = advertiserId;
    _data['user_id'] = userId;
    _data['id'] = id;
    return _data;
  }
}
