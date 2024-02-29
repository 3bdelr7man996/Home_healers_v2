import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SenderMessageSection extends StatelessWidget {
  const SenderMessageSection({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: context.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0))),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          // AppConstants.customAssetSvg(
          //   imagePath: AppImages.mikeIcon,
          //   width: 35.0,
          //   height: 35.0,
          // ),
          5.pw,
          Expanded(
            child: TextField(
              controller: context.select<ChatsCubit, TextEditingController?>(
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
          context.select<ChatsCubit, Widget>((cubit) {
            return cubit.state.content!.length > 0
                ? InkWell(
                    onTap: () async {
                      await cubit.sendMessage(context);
                      // await mychannel
                      //     ?.trigger(PusherEvent(
                      //         channelName: "chat.265",
                      //         eventName: 'chat',
                      //         data: {}))
                      //     .catchError((e) {
                      //   log(e.toString());
                      // });
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  )
                : SizedBox();
          }),
          //     : SvgPicture.asset(
          //         'assets/icons/add_icon.svg',
          //         width: 35,
          //         height: 35,
          //       ),
        ],
      ),
    );
  }
}
