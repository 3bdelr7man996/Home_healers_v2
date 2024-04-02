import 'dart:developer';

import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/audio_player_control.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'play_pause_button.dart';

class AudioPlayerView extends StatefulWidget {
  final String path;
  const AudioPlayerView({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  double? sliderTempValue;
  final audioPlayerController = AudioPlayerController();
  Future<bool>? loadAudio;

  @override
  void initState() {
    loadAudio = audioPlayerController.loadAudio(
      widget.path,
      context.read<ChatsCubit>().state.audioPlay,
    );
    super.initState();
  }

  @override
  void dispose() {
    audioPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAudio,
      builder: (context, loadData) {
        final audioDuration = audioPlayerController.durationInMill.toDouble();

        return StreamBuilder(
          stream: audioPlayerController.progressStream,
          builder: (context, snapshot) {
            double progress = (snapshot.data ?? 0).toDouble();

            return sliderBody(
              audioDuration: audioDuration,
              progress: progress,
            );
          },
        );
      },
    );
  }

  Widget sliderBody({required double audioDuration, required double progress}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: const Color.fromARGB(29, 0, 0, 0),
        child: Row(
          children: [
            StreamBuilder(
              stream: audioPlayerController.playStatusStream,
              builder: (context, snapshot) {
                final bool isPlaying = snapshot.data ?? false;
                return PlayPauseButton(
                  isPlaying: isPlaying,
                  onTap: () {
                    if (isPlaying) {
                      audioPlayerController.pause(context);
                    } else {
                      audioPlayerController.play(context);
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
                  log("Changed value $value");
                  setState(() {
                    sliderTempValue = value;
                  });
                },
                onChangeStart: (value) {
                  log("On change starr ---------------------");
                  audioPlayerController.pause(context);
                },
                onChangeEnd: (value) {
                  audioPlayerController.seek(value.toInt());
                  sliderTempValue = null;
                  audioPlayerController.play(context);
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
