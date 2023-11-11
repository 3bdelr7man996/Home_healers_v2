import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/one_chat_widgets.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OneChatScreen extends StatefulWidget {
  const OneChatScreen(
      {super.key, required this.recieverInfo, this.fromPatient = false});
  final UserData recieverInfo;
  final bool fromPatient;

  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  @override
  void initState() {
    context.read<ChatsCubit>().initChatData(
          context,
          recieverInfo: widget.recieverInfo,
        );
    context.read<ChatsCubit>().getAllMessage();
    super.initState();
  }

  @override
  void dispose() {
    // context.read<ChatsCubit>().disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarForChat(context,
            title: context.select<ChatsCubit, String>(
                (cubit) => cubit.recieverName ?? ''),
            image:
                "${AppStrings.imageUrl}${context.select<ChatsCubit, String>((cubit) => cubit.recieverImg ?? '')}",
            fromPatient: widget.fromPatient),
        body: BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: state.messagesList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return state.messagesList?[index].senderType == "User"
                          ? SenderMeesage(
                              content: state.messagesList?[index].content ?? '',
                              createdAt:
                                  state.messagesList?[index].createdAt ?? '')
                          : ReciveMessage(
                              content: state.messagesList?[index].content ?? '',
                              createdAt:
                                  state.messagesList?[index].createdAt ?? '');
                    },
                  ),
                ),
                Container(
                  color: const Color.fromARGB(14, 55, 209, 244),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/mike_icon.svg',
                        width: 35,
                        height: 35,
                      ),
                      5.pw,
                      Expanded(
                        child: TextField(
                          controller: context
                              .select<ChatsCubit, TextEditingController?>(
                                  (cubit) => cubit.msgFieldController),
                          onChanged: (value) {
                            context.read<ChatsCubit>().onContentChange(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'اكتب رسالة …',
                          ),
                        ),
                      ),
                      5.pw,
                      // IconButton( // icon: Icon(Icons.send), // onPressed: () { // }, // ),
                      state.content!.length > 0
                          ? InkWell(
                              onTap: () {
                                context.read<ChatsCubit>().sendMessage(
                                      context,
                                    );
                              },
                              child: Icon(
                                Icons.send,
                                color: AppColors.primaryColor,
                              ),
                            )
                          : SvgPicture.asset(
                              'assets/icons/add_icon.svg',
                              width: 35,
                              height: 35,
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
