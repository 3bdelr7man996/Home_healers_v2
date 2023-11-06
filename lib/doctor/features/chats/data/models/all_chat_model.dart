class AllChatModel {
  AllChatModel({
    required this.messages,
  });
  late final List<Messages> messages;

  AllChatModel.fromJson(Map<String, dynamic>? json) {
    messages =
        List.from(json?['messages']).map((e) => Messages.fromJson(e)).toList();
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['messages'] = messages.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Messages {
  Messages({
    required this.id,
    required this.userId,
    required this.advertiserId,
    required this.content,
    required this.senderType,
    required this.receiverType,
    this.senderFcm,
    this.receiverFcm,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int userId;
  late final int advertiserId;
  late final String content;
  late final String senderType;
  late final String receiverType;
  late final Null senderFcm;
  late final Null receiverFcm;
  late final String createdAt;
  late final String updatedAt;

  Messages.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    content = json?['content'];
    senderType = json?['sender_type'];
    receiverType = json?['receiver_type'];
    senderFcm = null;
    receiverFcm = null;
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['content'] = content;
    _data['sender_type'] = senderType;
    _data['receiver_type'] = receiverType;
    _data['sender_fcm'] = senderFcm;
    _data['receiver_fcm'] = receiverFcm;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
