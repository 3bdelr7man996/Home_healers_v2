import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/shimmer_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/chats/data/models/conversations_model.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chats_widgets.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/conversations_widget/active_users_avatar.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/conversations_widget/active_users_shimmer.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/conversations_widget/chat_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    context.read<ChatsCubit>().getAllConversations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, backButton: false, title: "chats"),
        30.ph,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchField(),
                20.ph,
                ActiveUsersSection(),
                // 20.ph,
                Text(
                  "messages".tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                10.ph,
                ConversationsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActiveUsersSection extends StatelessWidget {
  const ActiveUsersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state.conversationState == RequestState.loading) {
          return ActiveUsersShimmer();
        } else if (state.conversationState == RequestState.success &&
            state.onlineUsers!.isNotEmpty) {
          return ActiveUsersListView(
            onlineUsers: state.onlineUsers,
          );
        } else if (state.conversationsList != null &&
            state.conversationsList!.isNotEmpty) {
          return ChatUserListView(
            conversationsList: state.conversationsList,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class ActiveUsersListView extends StatelessWidget {
  const ActiveUsersListView({super.key, required this.onlineUsers});
  final List<OnlineUsers>? onlineUsers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers?.length,
        itemBuilder: (context, index) {
          return ActiveUsersAvatar(
            userId: onlineUsers![index].user!.id!,
            imagePath: onlineUsers?[index].user?.image ?? '',
            userName: onlineUsers?[index].user?.name ?? '',
            isOnline: true,
          );
        },
      ),
    );
  }
}

class ChatUserListView extends StatelessWidget {
  const ChatUserListView({super.key, required this.conversationsList});
  final List<Conversations>? conversationsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "active_now".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        10.ph,
        SizedBox(
          height: 135,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: conversationsList?.length,
            itemBuilder: (context, index) {
              return ActiveUsersAvatar(
                userId: conversationsList![index].id!,
                imagePath: conversationsList![index].image ?? '',
                userName: conversationsList![index].name ?? '',
                isOnline: conversationsList![index].online ?? false,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ConversationsShimmer extends StatelessWidget {
  const ConversationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return shimmerHelper(
            child: ChatListTile(
              id: 0,
              imgPath: '',
              msg: '',
              name: '',
            ),
          );
        },
      ),
    );
  }
}

class ConversationsSection extends StatelessWidget {
  const ConversationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state.conversationState == RequestState.loading) {
          return ConversationsShimmer();
        } else if (state.conversationState == RequestState.success &&
            state.conversationsList!.isNotEmpty) {
          return Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.conversationsList!.length,
              itemBuilder: (context, index) {
                return ChatListTile(
                  id: state.conversationsList![index].id!,
                  imgPath: state.conversationsList![index].image,
                  msg: state.conversationsList![index].lastMsg,
                  name: state.conversationsList![index].name,
                );
              },
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppConstants.customAssetImage(
                    imagePath: AppImages.no_msg_icon,
                    height: 150,
                    width: 150,
                  ),
                  20.ph,
                  Text(
                    "لايوجد رسائل لديك",
                    style: TextStyle(
                      color: Color.fromARGB(255, 179, 181, 181),
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
