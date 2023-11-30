import 'dart:io';

import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';

class ChatsDS {
  final ApiBaseHelper apiHelper;

  ChatsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> sendMessage({
    required Map<String, String> body,
    String? fileKey,
    List<File>? files,
  }) async {
    Map<String, dynamic>? response = await apiHelper.multiPartRequest(
      AppStrings.sendMessage,
      newBaseUrl: AppStrings.divSecondUrl,
      body: body,
      fileKey: fileKey ?? "",
      files: files,
    );
    return response;
  }

  ///GET All Message For Chat
  Future<Map<String, dynamic>?> allChatDS(
      {required Map<String, dynamic>? queryParameters}) async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.allMessages,
      queryParameters: queryParameters,
    );
    return response;
  }

  ///GET ALL CONVERSATIONS OF CHAT HOME
  Future<Map<String, dynamic>?> getAllConversations() async {
    Map<String, dynamic>? response = await apiHelper.get(
      AppStrings.allConversations,
    );
    return response;
  }
}
