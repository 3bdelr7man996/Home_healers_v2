import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioState());
  final AudioPlayer _audioPlayer = AudioPlayer();

  Stream<int> get progressStream => _audioPlayer.positionStream.map((progress) {
        final currentProgress = progress.inMilliseconds;
        if (currentProgress == state.durationInMill) {
          _audioPlayer.pause();
          _audioPlayer.seek(Duration.zero);
        }

        return currentProgress;
      });

  //int get durationInMill => _audioPlayer.duration?.inMilliseconds ?? 0;
  Stream<bool> get playStatusStream => _audioPlayer.playingStream;
  onChangeAudioPlay(bool isPlay) => emit(state.copyWith(audioPlay: isPlay));
  onChangesliderTempValue(double? tempValue) =>
      emit(state.copyWith(sliderTempValue: () => tempValue));

  Future<void> loadAudio(String filePath) async {
    try {
      emit(state.copyWith(
        audioLoading: true,
        audioPlay: true,
        sliderTempValue: null,
      ));
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(filePath)));
      await _audioPlayer.load();
      if (state.audioPlay) {
        _audioPlayer.play();
      }
      emit(state.copyWith(
        audioLoading: false,
        durationInMill: _audioPlayer.duration?.inMilliseconds,
      ));
    } catch (e) {}
  }

  void play(BuildContext context) async {
    emit(state.copyWith(audioPlay: true));
    _audioPlayer.play();
  }

  void pause(BuildContext context) async {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
      emit(state.copyWith(audioPlay: false));
    }
  }

  void seek(int durationInMill) {
    _audioPlayer.seek(Duration(milliseconds: durationInMill));
  }

  void dispose() async {
    await _audioPlayer.stop();
    // _audioPlayer.dispose();
  }
}
