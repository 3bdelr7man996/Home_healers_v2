class AdvNotifModel {
  List<Notifications>? notifications;

  AdvNotifModel({this.notifications});

  AdvNotifModel.fromJson(Map<String, dynamic>? json) {
    if (json?['notifications'] != null) {
      notifications = <Notifications>[];
      json?['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotificationData? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Notifications(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  Notifications.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    notifiableType = json?['notifiable_type'];
    notifiableId = json?['notifiable_id'];
    data =
        json?['data'] != null ? NotificationData.fromJson(json?['data']) : null;
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

class NotificationData {
  int? id;
  String? status;
  int? userId;
  int? postId;
  int? advId;
  String? userName;
  String? postName;
  String? advName;
  String? icon;
  String? title;
  String? body;

  NotificationData(
      {this.id,
      this.status,
      this.userId,
      this.postId,
      this.advId,
      this.userName,
      this.postName,
      this.advName,
      this.icon,
      this.title,
      this.body});

  NotificationData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    status = json?['status'];
    userId = json?['user_id'];
    postId = json?['post_id'];
    advId = json?['adv_id'];
    userName = json?['user_name'];
    postName = json?['post_name'];
    advName = json?['adv_name'];
    icon = json?['icon'];
    title = json?['title'];
    body = json?['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['user_id'] = userId;
    data['post_id'] = postId;
    data['adv_id'] = advId;
    data['user_name'] = userName;
    data['post_name'] = postName;
    data['adv_name'] = advName;
    data['icon'] = icon;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
