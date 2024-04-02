import 'dart:async';

import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/record_cubit/record_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/chat_appbar.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/float_sender_msg.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/reciver_buble.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/sender_buble.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:record/record.dart';

class OneChatScreen extends StatefulWidget {
  const OneChatScreen(
      {super.key, required this.recieverInfo, this.fromPatient = false});
  final UserData recieverInfo;
  final bool fromPatient;

  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  ScrollController _scrollController = ScrollController();
  PusherChannel? myChannel;
  StreamSubscription<RecordState>? recordSub;

  // StreamSubscription<Amplitude>? _amplitudeSub;

  @override
  void initState() {
    context.read<ChatsCubit>().initChatData(
          context,
          recieverInfo: widget.recieverInfo,
        );
    context.read<ChatsCubit>().getAllMessage();
    context.read<ChatsCubit>().subscribeChannel();

    recordSub =
        context.read<RecorderCubit>().recordStateStream.listen((recordState) {
      context.read<RecorderCubit>().updateRecordState(recordState);
    });

    super.initState();
  }

  @override
  void dispose() {
    // context.read<ChatsCubit>().disposeController();
    _scrollController.dispose();
    recordSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop == true) {
          context.read<ChatsCubit>().unSubscribeChannel();
        }
      },
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 244, 243, 243),
          appBar: AppBarForChat(context, fromPatient: widget.fromPatient),
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: SenderMessageSection(),
          body: BlocBuilder<ChatsCubit, ChatsState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (state.getMsgState == RequestState.loading)
                      ? Expanded(child: CustomLoader(padding: 0))
                      : (state.getMsgState == RequestState.success &&
                              state.messagesList!.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                reverse: true,
                                dragStartBehavior: DragStartBehavior.down,
                                controller: _scrollController,
                                padding: EdgeInsets.all(8.0),
                                itemCount: state.messagesList?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return state.messagesList?[index]
                                              .senderType ==
                                          context.read<ChatsCubit>().senderType
                                      ? SenderBuble(
                                          message: state.messagesList?[index])
                                      : ReciveBuble(
                                          content: state.messagesList?[index]
                                                  .content ??
                                              '',
                                          createdAt: state.messagesList?[index]
                                                  .createdAt ??
                                              '');
                                },
                              ),
                            )
                          : SizedBox.shrink(),
                  SenderMessageSection(),
                ],
              );
            },
          )),
    );
  }
}
