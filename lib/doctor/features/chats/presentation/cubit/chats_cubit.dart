import 'dart:developer';

import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/chats/data/models/all_chat_model.dart';
import 'package:dr/doctor/features/chats/data/models/conversations_model.dart';
import 'package:dr/doctor/features/chats/data/models/message_model.dart';
import 'package:dr/doctor/features/chats/data/repositories/chats_repo.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

enum UserType { Advertiser, User }

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepo chatsRepo;
  ChatsCubit({required this.chatsRepo}) : super(ChatsState());

  onContentChange(String value) => emit(state.copyWith(content: value));

  TextEditingController? msgFieldController = TextEditingController();
  int? userId;
  int? advId;
  String? senderType;
  String? recieverType;
  String? recieverImg;
  String? recieverName;

  void disposeController() {
    msgFieldController?.dispose();
  }

  void initChatData(BuildContext context, {required UserData recieverInfo}) {
    if (CacheHelper.getData(key: AppStrings.isAdvertise)) {
      advId = context.read<AuthCubit>().getAdvertiserInfo().id;
      userId = recieverInfo.id;
      senderType = 'Advertiser';
      recieverType = 'User';
      recieverImg = recieverInfo.image;
      recieverName = recieverInfo.name;
    } else {
      advId = recieverInfo.advertiser?.id;
      userId = context.read<AuthCubitForPatient>().getUserInfo().id;
      senderType = 'User';
      recieverType = 'Advertiser';
      recieverImg = recieverInfo.advertiser?.image;
      recieverName =
          "${recieverInfo.advertiser?.firstnameAr} ${recieverInfo.advertiser?.lastnameAr}";
    }
  }

  ///Send A Message
  Future<void> sendMessage(
    BuildContext context,
  ) async {
    try {
      fieldsValidation();
      emit(state.copyWith(sendMsgState: RequestState.loading));
      Map<String, String> body = {
        "user_id": '$userId',
        "advertiser_id": '$advId',
        "content": "${state.content}",
        "sender_type": senderType!,
        "receiver_type": recieverType!,
      };
      Messages response = await chatsRepo.sendMessage(
        body: body,
      );
      myMessages.add(response);
      //print(response);
      emit(state.copyWith(
        sendMsgState: RequestState.success,
        content: '',
        messagesList: myMessages,
      ));

      msgFieldController?.clear();
    } catch (e) {
      log("send up error $e");
      emit(state.copyWith(sendMsgState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.content!.length == 0) throw ("ادخل رسالتك");
  }

  List<Messages> myMessages = [];

  ///Get All Message
  Future<void> getAllMessage() async {
    try {
      emit(state.copyWith(getMsgState: RequestState.loading));
      ChatModel response = await chatsRepo.getAllMessagesForChat(
        advertiserId: advId!,
        userId: userId!,
      );
      myMessages = [];
      myMessages.addAll(response.messages?.toList() ?? []);
      emit(state.copyWith(
        getMsgState: RequestState.success,
        messagesList: myMessages,
      ));
    } catch (e) {
      emit(state.copyWith(
        getMsgState: RequestState.failed,
      ));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?=======================[GET CONVERSATIONS HOME ]===========================

  List<Conversations>? conversationsList = [];
  List<OnlineUsers>? onlineUsers = [];

  getAllConversations() async {
    try {
      emit(state.copyWith(conversationState: RequestState.loading));
      ConversationsModel response = await chatsRepo.getAllConversations();
      conversationsList = response.conversations;
      onlineUsers = response.onlineUsers;

      emit(state.copyWith(
        conversationState: RequestState.success,
        conversationsList: conversationsList,
        onlineUsers: onlineUsers,
      ));
    } catch (e) {
      emit(state.copyWith(conversationState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  //?=======================[ SEARCH IN CONVERSATION LIST]======================
  void searchConversation({String name = ''}) {
    if (name.isNotEmpty) {
      emit(state.copyWith(
          conversationsList: conversationsList
              ?.where((conv) => conv.name!.contains(name))
              .toList()));
    } else {
      emit(state.copyWith(conversationsList: conversationsList));
    }
  }
}
