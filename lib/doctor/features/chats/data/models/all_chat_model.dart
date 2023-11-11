import 'message_model.dart';

class ChatModel {
  List<Messages>? messages;

  ChatModel({this.messages});

  ChatModel.fromJson(Map<String, dynamic>? json) {
    if (json?['messages'] != null) {
      messages = <Messages>[];
      json?['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
