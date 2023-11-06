import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class ChatsDS {
  final ApiBaseHelper apiHelper;

  ChatsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> sendMessage(
      {required Map<String, String> body,
      String? fileKey,
      List<File>? files,
      List<File>? documents,
      String? documentsKey,
      bool isUpdateProfile = false}) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      '/api/chat/send',
      body: body,
      fileKey: fileKey ?? "",
      files: files,
      documents: documents,
      documentsKey: documentsKey,
    );
    return response;
  }

  ///GET All Message For Chat
  Future<Map<String, dynamic>?> allChatDS(
      var user_id, var advertiser_id) async {
    Map<String, dynamic>? response = await apiHelper.get(
        "/api/chat/retrieve?user_id=${user_id}&advertiser_id=${advertiser_id}");
    return response;
  }
}
