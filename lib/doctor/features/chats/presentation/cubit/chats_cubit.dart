import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/chats/data/models/all_chat_model.dart';
import 'package:dr/doctor/features/chats/data/models/send_message_model.dart';
import 'package:dr/doctor/features/chats/data/repositories/chats_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepo chatsRepo;
  ChatsCubit({required this.chatsRepo}) : super(ChatsState());

  onContentChange(String value) => emit(state.copyWith(content: value));

  ///Send A Message
  Future<void> sendMessage(context, var user_id, var advertiser_id,
      receiver_type, sender_type, _textFieldController) async {
    try {
      fieldsValidation();
      Map<String, String> body = {
        "user_id": "${user_id}",
        "advertiser_id": "${advertiser_id}",
        "content": "${state.content}",
        "sender_type": "${sender_type}",
        "receiver_type": "${receiver_type}",
      };
      SendMessageModel response = await chatsRepo.sendMessage(
        body: body,
      );
      print(response);
      emit(state.copyWith(content: ""));
      _textFieldController.clear();
      await getAllMessage(user_id, advertiser_id);
      log("send Success");
    } catch (e) {
      log("send up error $e");

      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.content!.length == 0) throw ("ادخل رسالتك");
  }

  ///Get All Message
  Future<void> getAllMessage(var user_id, var advertiser_id) async {
    try {
      print(user_id);
      AllChatModel response =
          await chatsRepo.getAllMessagesForChat(user_id, advertiser_id);
      emit(state.copyWith(allMessages: response.messages));
      print(state.allMessages);
      log("Get All Messages Success");
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
