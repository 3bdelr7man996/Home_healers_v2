class AddReportModel {
  AddReportModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String? message;

  AddReportModel.fromJson(Map<String?, dynamic>? json) {
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
    required this.repTitle,
    required this.repImage,
    required this.userId,
    required this.createdAt,
    required this.id,
  });
  late final String? repTitle;
  late final String? repImage;
  late final int userId;
  late final String? createdAt;
  late final int id;

  Data.fromJson(Map<String?, dynamic>? json) {
    repTitle = json?['rep_title'];
    repImage = json?['rep_image'];
    userId = json?['user_id'];
    createdAt = json?['created_at'];
    id = json?['id'];
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['rep_title'] = repTitle;
    _data['rep_image'] = repImage;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
