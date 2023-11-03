class MyPointsModel {
  MyPointsModel({
    required this.userId,
    required this.name,
    required this.points,
    required this.pointsInSAR,
    required this.walletBalance,
    required this.newPointsNotifications,
  });
  late final int userId;
  late final String name;
  late final int points;
  late final double pointsInSAR;
  late final int walletBalance;
  late final List<NewPointsNotifications> newPointsNotifications;

  MyPointsModel.fromJson(Map<String, dynamic>? json) {
    userId = json?['user_id'];
    name = json?['name'];
    points = json?['points'];
    pointsInSAR = json?['pointsInSAR'];
    walletBalance = json?['wallet_balance'];
    newPointsNotifications = List.from(json?['newPointsNotifications'])
        .map((e) => NewPointsNotifications.fromJson(e))
        .toList();
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['points'] = points;
    _data['pointsInSAR'] = pointsInSAR;
    _data['wallet_balance'] = walletBalance;
    _data['newPointsNotifications'] =
        newPointsNotifications.map((e) => e.toJson()).toList();
    return _data;
  }
}

class NewPointsNotifications {
  NewPointsNotifications({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String type;
  late final String notifiableType;
  late final int notifiableId;
  late final Data data;
  late final Null readAt;
  late final String createdAt;
  late final String updatedAt;

  NewPointsNotifications.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    notifiableType = json?['notifiable_type'];
    notifiableId = json?['notifiable_id'];
    data = Data.fromJson(json?['data']);
    readAt = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['notifiable_type'] = notifiableType;
    _data['notifiable_id'] = notifiableId;
    _data['data'] = data.toJson();
    _data['read_at'] = readAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Data {
  Data({
    required this.icon,
    required this.title,
    required this.body,
    required this.pointsInSAR,
  });
  late final String icon;
  late final String title;
  late final String body;
  late final int pointsInSAR;

  Data.fromJson(Map<String, dynamic>? json) {
    icon = json?['icon'];
    title = json?['title'];
    body = json?['body'];
    pointsInSAR = json?['pointsInSAR'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['icon'] = icon;
    _data['title'] = title;
    _data['body'] = body;
    _data['pointsInSAR'] = pointsInSAR;
    return _data;
  }
}
