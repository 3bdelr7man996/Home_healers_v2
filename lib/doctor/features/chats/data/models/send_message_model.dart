class SendMessageModel {
  SendMessageModel({
    required this.userId,
    required this.advertiserId,
    required this.content,
    required this.senderType,
    required this.receiverType,
    this.senderFcm,
    this.receiverFcm,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String userId;
  late final String advertiserId;
  late final String content;
  late final String senderType;
  late final String receiverType;
  late final Null senderFcm;
  late final Null receiverFcm;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  SendMessageModel.fromJson(Map<String, dynamic>? json) {
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    content = json?['content'];
    senderType = json?['sender_type'];
    receiverType = json?['receiver_type'];
    senderFcm = null;
    receiverFcm = null;
    updatedAt = json?['updated_at'];
    createdAt = json?['created_at'];
    id = json?['id'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['content'] = content;
    _data['sender_type'] = senderType;
    _data['receiver_type'] = receiverType;
    _data['sender_fcm'] = senderFcm;
    _data['receiver_fcm'] = receiverFcm;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
