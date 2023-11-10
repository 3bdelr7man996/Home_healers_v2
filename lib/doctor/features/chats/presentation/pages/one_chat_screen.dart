import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/one_chat_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OneChatScreen extends StatefulWidget {
  var SenderInfo, fromPatient;
  OneChatScreen({Key? key, this.SenderInfo, this.fromPatient = false});
  final _textFieldController = TextEditingController();
  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatsCubit>().getAllMessage(
        widget.SenderInfo.userId, widget.SenderInfo.advertiserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarForChat(context,
            title:
                "${widget.SenderInfo.advertiser.firstnameAr} ${widget.SenderInfo.advertiser.lastnameAr}",
            image:
                "${AppStrings.imageUrl}${widget.SenderInfo.advertiser.image}",
            fromPatient: widget.fromPatient),
        body: BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: state.allMessages == null
                        ? 0
                        : state.allMessages
                            .length, // Replace with your actual message count
                    itemBuilder: (BuildContext context, int index) {
                      if (state.allMessages[index].senderType == "User") {
                        return SenderMeesage(
                            content: state.allMessages[index].content,
                            createdAt: state.allMessages[index].createdAt);
                      } else {
                        return ReciveMessage(
                            content: state.allMessages[index].content,
                            createdAt: state.allMessages[index].createdAt);
                      }
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
                          controller: widget._textFieldController,
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
                                    widget.SenderInfo.userId,
                                    widget.SenderInfo.advertiserId,
                                    "Advertiser",
                                    "User",
                                    widget._textFieldController);
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
