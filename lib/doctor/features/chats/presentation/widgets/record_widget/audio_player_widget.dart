import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/audio_cubit/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'play_pause_button.dart';

class AudioPlayerView extends StatefulWidget {
  final String path;
  final bool fromMe;
  const AudioPlayerView({
    Key? key,
    required this.path,
    required this.fromMe,
  }) : super(key: key);

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   context.read<AudioCubit>().dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
//final audioDuration = state.durationInMill?.toDouble();

        return StreamBuilder(
          stream: context.read<AudioCubit>().progressStream,
          builder: (context, snapshot) {
            double progress = (snapshot.data ?? 0).toDouble();
            return sliderBody(
              sliderTempValue: state.sliderTempValue,
              audioDuration: state.durationInMill?.toDouble() ?? 0,
              progress: progress,
              fromMe: widget.fromMe,
            );
          },
        );
      },
    );
  }
}

class sliderBody extends StatelessWidget {
  const sliderBody({
    super.key,
    required this.sliderTempValue,
    required this.audioDuration,
    required this.progress,
    required this.fromMe,
  });
  final double? sliderTempValue;
  final double audioDuration;
  final double progress;
  final bool fromMe;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: fromMe ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin:
            fromMe ? EdgeInsets.only(left: 30.0) : EdgeInsets.only(right: 30.0),
        decoration: BoxDecoration(
          // color: Color.fromARGB(77, 255, 255, 255),
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: fromMe
                ? [
                    AppColors.darkPrimaryColor,
                    Color.fromARGB(255, 190, 99, 223),
                  ]
                : [
                    Color.fromARGB(255, 237, 239, 243),
                    Color.fromARGB(255, 132, 169, 232),
                  ],
            tileMode: TileMode.repeated,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            StreamBuilder(
              stream: context.read<AudioCubit>().playStatusStream,
              builder: (context, snapshot) {
                final bool isPlaying = snapshot.data ?? false;
                return PlayPauseButton(
                  isPlaying: isPlaying,
                  onTap: () {
                    if (isPlaying) {
                      context.read<AudioCubit>().pause(context);
                    } else {
                      context.read<AudioCubit>().play(context);
                    }
                  },
                );
              },
            ),
            Expanded(
              child: Slider(
                value: sliderTempValue ?? progress.clamp(0, audioDuration),
                min: 0,
                max: audioDuration,
                onChanged: (value) {
                  context.read<AudioCubit>().onChangesliderTempValue(value);
                },
                onChangeStart: (value) {
                  context.read<AudioCubit>().pause(context);
                },
                onChangeEnd: (value) {
                  context.read<AudioCubit>().seek(value.toInt());
                  context.read<AudioCubit>().onChangesliderTempValue(null);
                  context.read<AudioCubit>().play(context);
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
            Text(
              _formatToDateTime(progress.toInt()),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatToDateTime(int durationInMill) {
    //2000 / (1000 * 60) = 00 minutes
    final int minutes = durationInMill ~/ Duration.millisecondsPerMinute;

    //(2000 % 60000) / 1000 = 02 sec
    final int seconds = (durationInMill % Duration.millisecondsPerMinute) ~/
        Duration.millisecondsPerSecond;

    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }
}
