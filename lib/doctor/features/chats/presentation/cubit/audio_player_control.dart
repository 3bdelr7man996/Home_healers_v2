import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Stream<int> get progressStream => _audioPlayer.positionStream.map((progress) {
        final currentProgress = progress.inMilliseconds;
        if (currentProgress == durationInMill) {
          _audioPlayer.pause();
          _audioPlayer.seek(Duration.zero);
        }

        return currentProgress;
      });

  int get durationInMill => _audioPlayer.duration?.inMilliseconds ?? 0;
  Stream<bool> get playStatusStream => _audioPlayer.playingStream;

  Future<bool> loadAudio(String filePath, bool playAudio) async {
    print("Load aaaaaaaaaaaaaaaaaaaaaudio $filePath");
    try {
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(filePath)));
      await _audioPlayer.load();
      if (playAudio) {
        _audioPlayer.play();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  void play(BuildContext context) async {
    context.read<ChatsCubit>().onChangeAudioPlay(true);
    _audioPlayer.play();
  }

  void pause(BuildContext context) async {
    _audioPlayer.pause();
    context.read<ChatsCubit>().onChangeAudioPlay(false);
  }

  void seek(int durationInMill) {
    _audioPlayer.seek(Duration(milliseconds: durationInMill));
  }

  void dispose() async {
    await _audioPlayer.stop();
    _audioPlayer.dispose();
  }
}
