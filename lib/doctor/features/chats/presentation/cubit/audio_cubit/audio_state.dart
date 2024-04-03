part of 'audio_cubit.dart';

class AudioState extends Equatable {
  const AudioState({
    this.audioLoading = false,
    this.audioPlay = false,
    this.durationInMill,
    this.sliderTempValue,
  });
  final bool audioLoading;
  final bool audioPlay;
  final int? durationInMill;
  final double? sliderTempValue;
  @override
  List<Object?> get props => [
        audioLoading,
        audioPlay,
        durationInMill,
        sliderTempValue,
      ];
  AudioState copyWith({
    bool? audioLoading,
    bool? audioPlay,
    int? durationInMill,
    double? Function()? sliderTempValue,
  }) =>
      AudioState(
        audioLoading: audioLoading ?? this.audioLoading,
        audioPlay: audioPlay ?? this.audioPlay,
        durationInMill: durationInMill ?? this.durationInMill,
        sliderTempValue:
            sliderTempValue != null ? sliderTempValue() : this.sliderTempValue,
      );
}
