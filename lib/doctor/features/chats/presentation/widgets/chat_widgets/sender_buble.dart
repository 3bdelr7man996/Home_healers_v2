import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/chats/data/models/message_model.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/record_widget/audio_player_widget.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/record_widget/slider_view_widget.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SenderBuble extends StatelessWidget {
  final Messages? message;
  SenderBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message?.content != null)
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.darkPrimaryColor,
                      Color.fromARGB(255, 190, 99, 223),
                    ],
                    tileMode: TileMode.repeated,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  message!.content!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          fileView(
            context,
            path: message?.path,
            type: message?.type ?? '',
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(
              Icons.done,
              size: 14,
              color: AppColors.textGrey,
            ),
            5.pw,
            Text(
              "${message?.createdAt ?? ''}",
              style: TextStyle(
                fontSize: 9.0,
                color: AppColors.textGrey,
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget fileView(BuildContext context, {String? path, String type = ''}) {
    if (type.isEmpty && path == null) {
      return const SizedBox.shrink();
    } else if (type == 'file' && path != null) {
      return InkWell(
        onTap: () {
          AppConstants.customNavigation(
            context,
            PhotoViewerRouteWrapper(
              imgBaseUrl: AppStrings.secondImgUrl,
              filePath: path,
            ),
            0,
            0,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: AppConstants.customNetworkImage(
            imagePath: path,
            imgBaseUrl: AppStrings.secondImgUrl,
            width: context.width * 0.35,
            height: context.width * 0.45,
          ),
        ),
      );
    } else if (type == 'record' && path != null) {
      return BlocBuilder<ChatsCubit, ChatsState>(
        buildWhen: (previous, current) =>
            previous.playedAudioName != current.playedAudioName,
        builder: (context, state) {
          return (state.playedAudioName.isNotEmpty &&
                  path.contains(state.playedAudioName))
              ? AudioPlayerView(
                  path: '${AppStrings.secondImgUrl}$path',
                  fromMe: true,
                )
              : SliderView(
                  path: '${AppStrings.secondImgUrl}$path',
                  fromMe: true,
                );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
