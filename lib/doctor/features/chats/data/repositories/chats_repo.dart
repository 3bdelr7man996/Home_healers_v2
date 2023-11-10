import 'dart:developer';
import 'dart:io';

import 'package:dr/doctor/features/chats/data/datasources/chats_ds.dart';
import 'package:dr/doctor/features/chats/data/models/all_chat_model.dart';
import 'package:dr/doctor/features/chats/data/models/send_message_model.dart';

class ChatsRepo {
  final ChatsDS dataSource;

  ChatsRepo({required this.dataSource});

  Future<SendMessageModel> sendMessage({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
    List<File>? documents,
    String? documentsKey,
    bool isUpdateProfile = false,
  }) async {
    log("bodyyyy== $body");
    SendMessageModel signUpResponse = SendMessageModel.fromJson(
      await dataSource.sendMessage(
        body: body,
        files: files,
        documents: documents,
        documentsKey: documentsKey,
        fileKey: fileKey,
        isUpdateProfile: isUpdateProfile,
      ),
    );
    return signUpResponse;
  }

  //?======================[ GET ALL Message For Chat ]======================
  Future<AllChatModel> getAllMessagesForChat(user_id, advertiser_id) async {
    log("$user_id");
    log("$advertiser_id");
    AllChatModel GetAllMessage = AllChatModel.fromJson(
        await dataSource.allChatDS(user_id, advertiser_id));
    return GetAllMessage;
  }
}
