import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/audio_cubit/audio_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;

  final Function()? onTap;
  const PlayPauseButton(
      {super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
        buildWhen: (previous, current) =>
            previous.audioLoading != current.audioLoading,
        builder: (context, state) {
          return state.audioLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CustomLoader(
                    padding: 0,
                  ),
                )
              : Material(
                  shape: const CircleBorder(),
                  color: AppColors.primaryColor,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      width: 54,
                      height: 54,
                      padding: EdgeInsets.only(
                        left: isPlaying ? 0 : 4,
                      ),
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                );
        });
  }
}
