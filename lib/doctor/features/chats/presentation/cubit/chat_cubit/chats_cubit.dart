import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/config/pusher_config/pusher_config.dart';
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
import 'package:dr/di_container.dart' as di;
import 'package:image_picker/image_picker.dart';

part 'chats_state.dart';

enum UserType { Advertiser, User }

enum FileType { record, file }

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepo chatsRepo;
  ChatsCubit({required this.chatsRepo}) : super(ChatsState());

  onContentChange(String value) => emit(state.copyWith(content: value));
  onChangeFiletype(String? Function()? type) =>
      emit(state.copyWith(fileType: type));
  onChangeFile(File? Function()? file) => emit(state.copyWith(msgFile: file));
  onChangePlayedName(String name) =>
      emit(state.copyWith(playedAudioName: name));

  TextEditingController? msgFieldController = TextEditingController();
  int? userId;
  int? advId;
  int? recieverId;
  int? myId;
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
      recieverId = recieverInfo.id;
      myId = advId;
      senderType = 'Advertiser';
      recieverType = 'User';
      recieverImg = recieverInfo.image;
      recieverName = recieverInfo.name;
    } else {
      advId = recieverInfo.advertiser?.id;
      userId = context.read<AuthCubitForPatient>().getUserInfo().id;
      recieverId = recieverInfo.advertiser?.id;
      myId = userId;
      senderType = 'User';
      recieverType = 'Advertiser';
      recieverImg = recieverInfo.advertiser?.image;
      recieverName =
          "${recieverInfo.advertiser?.firstnameAr} ${recieverInfo.advertiser?.lastnameAr}";
    }
    onChangeFile(() => null);
    onChangeFiletype(() => null);
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
        "reciver_id": "$recieverId",
        "type": state.fileType ?? '',
      };
      msgFieldController?.clear();
      Messages response = await chatsRepo.sendMessage(
        body: body,
        fileKey: 'file',
        files: state.msgFile != null ? [state.msgFile!] : null,
      );
      myMessages.add(response);

      emit(state.copyWith(
        sendMsgState: RequestState.success,
        content: '',
        messagesList: myMessages.reversed.toList(),
        fileType: () => null,
        msgFile: () => null,
      ));

      print(response);
    } catch (e) {
      log("send up error $e");
      emit(state.copyWith(sendMsgState: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.content!.length == 0 && state.msgFile == null)
      throw ("ادخل رسالتك");
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
        messagesList: myMessages.reversed.toList(),
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

  //?=====================[ SUBSCRIBE IN PUSHER CHANNEL ]=======================
  Future<void> subscribeChannel() async {
    await di.sl<PusherConfiguration>().pusher.subscribe(
        channelName: 'chat.$myId',
        onSubscriptionSucceeded: (channelName) {
          print("Subscribed to $channelName  success --------------");
        },
        onMemberAdded: (member) {
          print("Member added: $member");
        },
        onMemberRemoved: (member) {
          print("Member removed: $member");
        },
        onEvent: (event) {
          //PusherEvent myevent;
          //print("Got channel event: $event");
          log("event type ${event.runtimeType}");
          try {
            if (event.data != null && event.data.isNotEmpty) {
              // log("channel event ${json.decode(event.data)}");
              var msg = Messages.fromJson(json.decode(event.data));

              if (msg.reciverId == myId &&
                  msg.userId == userId &&
                  msg.advertiserId == advId) {
                myMessages.add(msg);
                emit(state.copyWith(
                  getMsgState: RequestState.success,
                  messagesList: myMessages.reversed.toList(),
                ));
              }
            }
          } catch (e) {
            log("recieve pusher error $e");
          }
        });
    await di.sl<PusherConfiguration>().pusher.connect();
  }

  void unSubscribeChannel() {
    di.sl<PusherConfiguration>().pusher.unsubscribe(channelName: 'chat.$myId');
    di.sl<PusherConfiguration>().pusher.disconnect();
  }

  //?==========================[ PICK IMAGE FILE ]==============================
  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(state.copyWith(
            msgFile: () => File(pickedFile.path),
            fileType: () => FileType.file.name));
        await sendMessage(context);
      }
    } catch (e) {
      log("Error picking image: $e");
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
