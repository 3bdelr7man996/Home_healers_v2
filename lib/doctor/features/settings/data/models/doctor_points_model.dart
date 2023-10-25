class DoctorPointsModel {
  int? userId;
  int? points;
  int? walletBalance;
  List<NewPointsNotifications>? newPointsNotifications;

  DoctorPointsModel(
      {this.userId,
      this.points,
      this.walletBalance,
      this.newPointsNotifications});

  DoctorPointsModel.fromJson(Map<String, dynamic>? json) {
    userId = json?['user_id'];
    points = json?['points'];
    walletBalance = json?['wallet_balance'];
    if (json?['newPointsNotifications'] != null) {
      newPointsNotifications = <NewPointsNotifications>[];
      json?['newPointsNotifications'].forEach((v) {
        newPointsNotifications!.add(NewPointsNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['points'] = points;
    data['wallet_balance'] = walletBalance;
    if (newPointsNotifications != null) {
      data['newPointsNotifications'] =
          newPointsNotifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewPointsNotifications {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  PointsNotifData? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NewPointsNotifications(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  NewPointsNotifications.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    notifiableType = json?['notifiable_type'];
    notifiableId = json?['notifiable_id'];
    data =
        json?['data'] != null ? PointsNotifData.fromJson(json?['data']) : null;
    readAt = json?['read_at'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PointsNotifData {
  String? icon;
  String? title;
  String? body;

  PointsNotifData({this.icon, this.title, this.body});

  PointsNotifData.fromJson(Map<String, dynamic>? json) {
    icon = json?['icon'];
    title = json?['title'];
    body = json?['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
