import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/record_cubit/record_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/record_widget/record_wave_widget.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/record_widget/text_timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';

class SenderMessageSection extends StatelessWidget {
  const SenderMessageSection({
    super.key,
  });
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
          RecordSection(),
          5.pw,
          const TextTimer(),
          // 5.pw,
          PickImgSection(),
          5.pw,
          TextMsgSection(),
          5.pw,
          context.select<ChatsCubit, Widget>((cubit) {
            return cubit.state.content!.length > 0
                ? InkWell(
                    onTap: () async {
                      cubit.onChangeAudioPlay(false);
                      await cubit.sendMessage(context);
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}

class RecordSection extends StatelessWidget {
  const RecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderCubit, RecorderState>(
      builder: (context, state) {
        return state.recordState == RecordState.record
            ? Material(
                clipBehavior: Clip.hardEdge,
                child: GestureDetector(
                  onTap: () async {
                    await context.read<RecorderCubit>().stop(context);
                    await context.read<ChatsCubit>().sendMessage(context);
                  },
                  child: AppConstants.customAssetSvg(
                    imagePath: AppImages.pauseIcon,
                    width: 35.0,
                    height: 35.0,
                  ),
                ),
              )
            : Material(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    context.read<RecorderCubit>().start();
                  },
                  child: AppConstants.customAssetSvg(
                    imagePath: AppImages.mikeIcon,
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
              );
      },
    );
  }
}

class PickImgSection extends StatelessWidget {
  const PickImgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderCubit, RecorderState>(
      builder: (context, state) {
        return state.recordState == RecordState.record
            ? const SizedBox.shrink()
            : Material(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () async {
                    await context.read<ChatsCubit>().pickImage(context);
                  },
                  child: AppConstants.customAssetSvg(
                    imagePath: AppImages.galleryIcon,
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
              );
      },
    );
  }
}

class TextMsgSection extends StatelessWidget {
  const TextMsgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderCubit, RecorderState>(
      builder: (context, state) {
        return state.recordState == RecordState.record
            ? Expanded(child: AudioWavesView())
            : Expanded(
                child: TextField(
                  controller:
                      context.select<ChatsCubit, TextEditingController?>(
                          (cubit) => cubit.msgFieldController),
                  onChanged: (value) {
                    context.read<ChatsCubit>().onContentChange(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'اكتب رسالة …',
                  ),
                ),
              );
      },
    );
  }
}
