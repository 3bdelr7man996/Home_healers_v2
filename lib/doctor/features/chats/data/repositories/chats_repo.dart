import 'dart:developer';
import 'dart:io';

import 'package:dr/doctor/features/chats/data/datasources/chats_ds.dart';
import 'package:dr/doctor/features/chats/data/models/all_chat_model.dart';
import 'package:dr/doctor/features/chats/data/models/message_model.dart';

class ChatsRepo {
  final ChatsDS dataSource;

  ChatsRepo({required this.dataSource});

  Future<Messages> sendMessage({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
  }) async {
    log("bodyyyy== $body");
    Messages signUpResponse = Messages.fromJson(
      await dataSource.sendMessage(
        body: body,
        files: files,
        fileKey: fileKey,
      ),
    );
    return signUpResponse;
  }

  //?======================[ GET ALL Message For Chat ]======================
  Future<ChatModel> getAllMessagesForChat(
      {required int userId, required int advertiserId}) async {
    ChatModel response = ChatModel.fromJson(
      await dataSource.allChatDS(
        queryParameters: {
          'user_id': '$userId',
          'advertiser_id': '$advertiserId',
        },
      ),
    );
    return response;
  }
}
