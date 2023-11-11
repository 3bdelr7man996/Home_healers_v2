class Messages {
  int? id;
  int? userId;
  int? advertiserId;
  String? content;
  String? senderType;
  String? receiverType;
  String? senderFcm;
  String? receiverFcm;
  String? createdAt;
  String? updatedAt;

  Messages(
      {this.id,
      this.userId,
      this.advertiserId,
      this.content,
      this.senderType,
      this.receiverType,
      this.senderFcm,
      this.receiverFcm,
      this.createdAt,
      this.updatedAt});

  Messages.fromJson(Map<String, dynamic>? json) {
    id = int.parse(json?['id'].toString() ?? "0");
    userId = int.parse(json?['user_id'].toString() ?? "0");
    advertiserId = int.parse(json?['advertiser_id'].toString() ?? "0");
    content = json?['content'];
    senderType = json?['sender_type'];
    receiverType = json?['receiver_type'];
    senderFcm = json?['sender_fcm'];
    receiverFcm = json?['receiver_fcm'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['advertiser_id'] = this.advertiserId;
    data['content'] = this.content;
    data['sender_type'] = this.senderType;
    data['receiver_type'] = this.receiverType;
    data['sender_fcm'] = this.senderFcm;
    data['receiver_fcm'] = this.receiverFcm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
