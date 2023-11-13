import 'package:dr/config/pusher_config/pusher_config.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/chat_appbar.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/float_sender_msg.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/reciver_buble.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chat_widgets/sender_buble.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dr/di_container.dart' as di;

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

  @override
  void initState() {
    context.read<ChatsCubit>().initChatData(
          context,
          recieverInfo: widget.recieverInfo,
        );
    context.read<ChatsCubit>().getAllMessage().then((value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });
    di.sl<PusherConfiguration>().pusher.subscribe(channelName: '');
    di.sl<PusherConfiguration>().pusher.connect();
    super.initState();
  }

  @override
  void dispose() {
    // context.read<ChatsCubit>().disposeController();
    _scrollController.dispose();
    di.sl<PusherConfiguration>().pusher.unsubscribe(channelName: '');
    di.sl<PusherConfiguration>().pusher.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 243, 243),
        appBar: AppBarForChat(context, fromPatient: widget.fromPatient),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SenderMessageSection(),
        body: BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            if (state.getMsgState == RequestState.loading) {
              return CustomLoader(padding: 0);
            } else if (state.getMsgState == RequestState.success &&
                state.messagesList!.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      dragStartBehavior: DragStartBehavior.down,
                      controller: _scrollController,
                      padding: EdgeInsets.all(8.0),
                      itemCount: state.messagesList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return state.messagesList?[index].senderType ==
                                context.read<ChatsCubit>().senderType
                            ? SenderBuble(
                                content:
                                    state.messagesList?[index].content ?? '',
                                createdAt:
                                    state.messagesList?[index].createdAt ?? '')
                            : ReciveBuble(
                                content:
                                    state.messagesList?[index].content ?? '',
                                createdAt:
                                    state.messagesList?[index].createdAt ?? '');
                      },
                    ),
                  ),
                  80.ph,
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ));
  }
}
