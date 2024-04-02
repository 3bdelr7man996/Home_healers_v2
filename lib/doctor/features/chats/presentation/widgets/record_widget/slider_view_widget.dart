import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'play_pause_button.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: const Color.fromARGB(29, 0, 0, 0),
        child: Row(
          children: [
            PlayPauseButton(
              isPlaying: false,
              onTap: () {
                context
                    .read<ChatsCubit>()
                    .onChangePlayedName(path.split('/').last);
                context.read<ChatsCubit>().onChangeAudioPlay(true);
                // context.read<ChatsCubit>().initLoadAudio(path);
              },
            ),
            Expanded(
              child: Slider(
                value: 0,
                min: 0,
                max: 0,
                onChanged: (value) {},
                activeColor: AppColors.primaryColor,
              ),
            ),
            // Text(
            //   "00:00",
            //   style: TextStyle(
            //     fontSize: 14,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
